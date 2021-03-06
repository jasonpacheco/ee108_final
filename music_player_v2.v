`include "dvi_defines.v"
module music_player_v2 (
    input 								clk,
    input 								reset,
    input 								play_button,
    input 								next_button,
    input                               fast_forward_button,
    // The raw new_frame signal from the ac97_if codec.
    input 								new_frame,
    output wire 						new_sample_generated,
    // Our final output sample to the codec. This needs to be synced to new_frame.
    output wire [15:0] 					sample_out,
	output		[47:0]					out_notes,
	input								echo_switch,
	output								note_display_play,
	output		[1:0]					song_out,
	output 								reset_player_out,
	output		[17:0]					note_data_out,
	output								beat_out
);
    // The BEAT_COUNT is parameterized so you can reduce this in simulation.
    // If you reduce this to 100 your simulation will be 10x faster.
    parameter BEAT_COUNT = 1000;
	
//   
//  ****************************************************************************
//      MCU
//  ****************************************************************************
//  
    wire 		play;
    wire 		reset_player;
	wire [1:0] 	song;
	wire		song_done;
    // Instantiate your MCU here
	mcu mcu (
		.clk(clk),
		.reset(reset),
		.play_button(play_button),
		.next_button(next_button),
		.play(play),
		.reset_player(reset_player),
		.song(song),
		.song_done(song_done)
	);
	assign song_out = song;
	assign reset_player_out = reset_player;
//   
//  ****************************************************************************
//      FF/Reverse MCU
//  ****************************************************************************
//
     
     wire [1:0] play_state;     
     
     play_state_mcu mcu2 (
          .button_press(fast_forward_button),
          .rst(reset),
          .clk(clk),
          .play_state(play_state)
     );


//   
//  ****************************************************************************
//      Song Reader
//  ****************************************************************************
//  
    wire 			beat;
    wire [17:0] 	notes_to_load;
    wire [17:0] 	durs_to_load;
    wire [2:0] 		notes_done, notes_load, notes_play;
    wire 			play_enable;
    // Instantiate your song reader here
	
	song_reader_v2 song_reader (
		.clk(clk),
		.reset(reset | reset_player),
		.play(play),
		.song(song),
		.beat(beat),
		.notes_done(notes_done),
		.song_done(song_done),
		.notes_load(notes_load),
		.notes_play(notes_play),
		.notes_to_load(notes_to_load),
		.durs_to_load(durs_to_load),
		.play_enable(play_enable)
	);
	assign note_data_out = notes_to_load;
//   
//  ****************************************************************************
//      Note Player
//  ****************************************************************************
//  

    // Hooking up note_player to the audio interface can be a little tricky,
    // so we did it here for you. You still need to implement the note_player
    // module itself and instantiate the other parts of music_player, though!


    wire 		generate_next_sample;
    wire [15:0] note_sample, note_sample_one, note_sample_two, note_sample_three;
    wire 		note_sample_ready, note_sample_ready_one, note_sample_ready_two, note_sample_ready_three;
	note_player note_player_one (
		.clk(clk),
		.reset(reset | reset_player),
		.play_enable(play_enable & notes_play[0]),
		.note_to_load(notes_to_load[5:0]),
		.duration_to_load(durs_to_load[5:0]),
		.load_new_note(notes_load[0]),
		.play_state(play_state),
		.done_with_note(notes_done[0]),
		.beat(beat),
		.generate_next_sample(generate_next_sample),
		.sample_out(note_sample_one),
		.new_sample_ready(note_sample_ready_one)
	);

	note_player note_player_two (
		.clk(clk),
		.reset(reset | reset_player),
		.play_enable(play_enable & notes_play[1]),
		.note_to_load(notes_to_load[11:6]),
		.duration_to_load(durs_to_load[11:6]),
		.load_new_note(notes_load[1]),
		.play_state(play_state),
		.done_with_note(notes_done[1]),
		.beat(beat),
		.generate_next_sample(generate_next_sample),
		.sample_out(note_sample_two),
		.new_sample_ready(note_sample_ready_two)
	);
	
	note_player note_player_three (
		.clk(clk),
		.reset(reset | reset_player),
		.play_enable(play_enable & notes_play[2]),
		.note_to_load(notes_to_load[17:12]),
		.duration_to_load(durs_to_load[17:12]),
		.load_new_note(notes_load[2]),
		.play_state(play_state),
		.done_with_note(notes_done[2]),
		.beat(beat),
		.generate_next_sample(generate_next_sample),
		.sample_out(note_sample_three),
		.new_sample_ready(note_sample_ready_three)
	);
	
	
//   
//  ****************************************************************************
//      Beat Generator
//  ****************************************************************************
//  By default this will divide the generate_next_sample signal (48kHz from the
//  codec's new_frame input) down by 1000, to 48Hz. If you change the BEAT_COUNT
//  parameter when instantiating this you can change it for simulation.
//  
//out with the old in with the new!
  /*  beat_generator #(.WIDTH(10), .STOP(BEAT_COUNT)) beat_generator (
        .clk(clk),
        .reset(reset),
        .en(generate_next_sample),
        .beat(beat)
    );

*/

     beat_gen_ff_enabled #(.WIDTH(10), .STOP(BEAT_COUNT)) beat_generator (
        .clk(clk),
        .reset(reset),
        .en(generate_next_sample),
        .play_state(play_state),
        .beat(beat)
     );
     assign beat_out = beat;
//**********************************************
// Echo like ya mean it
//**********************************************
	wire [15:0] echo_sample;
	assign echo_sample 			= note_sample_one + note_sample_two + note_sample_three;
	assign note_sample_ready 	= note_sample_ready_one & note_sample_ready_two & note_sample_ready_three; 
	echo echo (
		.clk(clk),
		.reset(reset | reset_player),
		.sample_in(echo_sample),
		.new_sample_ready(note_sample_ready),
		.echo_enable(echo_switch & play),
		.sample_to_codec(note_sample)
	);


	assign out_notes = new_sample_generated ? {note_sample_one, note_sample_two, note_sample_three} : 48'b0; 
//  
//  ****************************************************************************
//      Codec Conditioner
//  ****************************************************************************
//  
	assign new_sample_generated = generate_next_sample;
	assign note_display_play = play_enable;
	codec_conditioner codec_conditioner (
	    .clk(clk),
	    // NOTE: The reset input for codec_conditioner should always be the
	    // PURE UNMODIFIED top-level reset signal. Do not mix it with anything
	    // else.
	    .reset(reset),
	    .new_sample_in(note_sample),
	    .latch_new_sample_in(note_sample_ready),
	    .generate_next_sample(generate_next_sample),
	    .new_frame(new_frame),.valid_sample(sample_out)
	);
	    
endmodule
