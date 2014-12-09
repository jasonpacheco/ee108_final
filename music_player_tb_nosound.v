
module music_player_tb_nosound(
    );
reg clk, reset, next_button, play_button;
    reg generate_next_sample;
    wire [15:0] sample;

//  ****************************************************************************
//      MCU
//  ****************************************************************************
//  

    wire play;
    wire reset_player;
	wire [1:0] song;
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
//   
//  ****************************************************************************
//      Song Reader
//  ****************************************************************************
//  
    wire beat;
    wire [17:0] 	notes_to_load;
    wire [17:0] 	durs_to_load;
    wire [2:0]      notes_done, notes_load, notes_play;
    wire       	play_enable;
    // Instantiate your song reader here
	
	 song_reader_v2 RED(
    .clk(clk),
    .reset(reset|reset_player),
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
		
//   
//  ****************************************************************************
//      Note Player
//  ****************************************************************************
//  

    // Hooking up note_player to the audio interface can be a little tricky,
    // so we did it here for you. You still need to implement the note_player
    // module itself and instantiate the other parts of music_player, though!


    wire [15:0] note_sample, note_sample_0, note_sample_1, note_sample_2;
    wire note_sample_ready, note_sample_ready_0, note_sample_ready_1, note_sample_ready_2;
    note_player note_player0(
        .clk(clk),
        .reset(reset|reset_player),
        .play_enable(play_enable & notes_play[0]),
        .note_to_load(notes_to_load[5:0]),
        .duration_to_load(durs_to_load[5:0]),
        .load_new_note(notes_load[0]),
          .play_state(2'b00),
        .done_with_note(notes_done[0]),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample_0),
        .new_sample_ready(note_sample_ready_0)
    );

note_player note_player1(
        .clk(clk),
        .reset(reset|reset_player),
        .play_enable(play_enable & notes_play[1]),
        .note_to_load(notes_to_load[11:6]),
        .duration_to_load(durs_to_load[11:6]),
        .load_new_note(notes_load[1]),
          .play_state(2'b00),
        .done_with_note(notes_done[1]),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample_1),
        .new_sample_ready(note_sample_ready_1)
    );
note_player note_player2(
        .clk(clk),
        .reset(reset|reset_player),
        .play_enable(play_enable & notes_play[2]),
        .note_to_load(notes_to_load[17:12]),
        .duration_to_load(durs_to_load[17:12]),
        .load_new_note(notes_load[2]),
          .play_state(2'b00),
        .done_with_note(notes_done[2]),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample_2),
        .new_sample_ready(note_sample_ready_2)
    );
      assign sample = note_sample_0 + note_sample_1+note_sample_2;


     wire [15:0] echo_sample;
	assign note_sample_ready 	= note_sample_ready_0 & note_sample_ready_1 & note_sample_ready_2; 
	echo echo (
		.clk(clk),
		.reset(reset | reset_player),
		.sample_in(sample),
		.new_sample_ready(note_sample_ready),
		.echo_enable(1'b1),
		.sample_to_codec(echo_sample)
	);
//   
//  ****************************************************************************
//      Beat Generator
//  ****************************************************************************
//  By default this will divide the generate_next_sample signal (48kHz from the
//  codec's new_frame input) down by 1000, to 48Hz. If you change the BEAT_COUNT
//  parameter when instantiating this you can change it for simulation.
//  
    /*beat_generator #(.WIDTH(10), .STOP(10)) beat_generator(
        .clk(clk),
        .reset(reset),
        .en(generate_next_sample),
        .beat(beat)
    );*/

     

  beat_gen_ff_enabled #(.WIDTH(10), .STOP(10)) beat_generator (
        .clk(clk),
        .reset(reset),
        .en(generate_next_sample),
        .play_state(2'b00),
        .beat(beat)
     );
  // Clock and reset
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        repeat (4) #5 clk = ~clk;
        reset = 1'b0;
        forever begin #5 clk = ~clk;
        
        end
    end

     initial begin 
          forever begin
               generate_next_sample = 1;
               #10;
               generate_next_sample = 0;
               #1000;
               $display("sample %b", sample);
          end
     end

    // Tests
    integer delay;
    initial begin
        delay = 2000000;
        play_button = 1'b0;
        next_button = 1'b0;
        @(negedge reset);
        @(negedge clk);

        repeat (25) begin
            @(negedge clk);
        end 

     // Next Song  
        $display("Next song...");
        @(negedge clk);
        next_button = 1'b1;
        @(negedge clk);
        next_button = 1'b0;



// Next Song  
        $display("Next song...");
        @(negedge clk);
        next_button = 1'b1;
        @(negedge clk);
        next_button = 1'b0;


        // Start playing
        $display("Starting playing song 0...");
        @(negedge clk);
        play_button = 1'b1;
        @(negedge clk);
        play_button = 1'b0;

        repeat (delay) begin
            @(negedge clk);
        end

        // Pause  
        $display("Pause...");
        @(negedge clk);
        play_button = 1'b1;
        @(negedge clk);
        play_button = 1'b0;

        repeat (delay/4) begin
            @(negedge clk);
        end


        // Play 
        $display("Resume playing song 0..."); 
        @(negedge clk);
        play_button = 1'b1;
        @(negedge clk);
        play_button = 1'b0;

        repeat (delay) begin
            @(negedge clk);
        end



        // Next Song  
        $display("Next song...");
        @(negedge clk);
        next_button = 1'b1;
        @(negedge clk);
        next_button = 1'b0;

        repeat (delay/8) begin
            @(negedge clk);
        end
    
           // Next Song  
        $display("Next song...");
        @(negedge clk);
        next_button = 1'b1;
        @(negedge clk);
        next_button = 1'b0;

        repeat (delay/4) begin
            @(negedge clk);
        end
     
           // Next Song  
        $display("Next song...");
        @(negedge clk);
        next_button = 1'b1;
        @(negedge clk);
        next_button = 1'b0;

        repeat (delay/4) begin
            @(negedge clk);
        end


        // Play
        $display("Starting playing song 3...");  
        @(negedge clk);
        play_button = 1'b1;
        @(negedge clk);
        play_button = 1'b0;

        repeat (3*delay) begin
            @(negedge clk);
        end

          // Next Song  
        $display("Next song...");
        @(negedge clk);
        next_button = 1'b1;
        @(negedge clk);
        next_button = 1'b0;

        repeat (delay/8) begin
            @(negedge clk);
        end


        // Play
        $display("Starting playing song 2...");  
        @(negedge clk);
        play_button = 1'b1;
        @(negedge clk);
        play_button = 1'b0;

        repeat (delay) begin
            @(negedge clk);
        end

          // Next Song  
        $display("Next song...");
        @(negedge clk);
        next_button = 1'b1;
        @(negedge clk);
        next_button = 1'b0;

        repeat (delay/4) begin
            @(negedge clk);
        end


        // Play
        $display("Starting playing song 3...");  
        @(negedge clk);
        play_button = 1'b1;
        @(negedge clk);
        play_button = 1'b0;

        repeat (delay) begin
            @(negedge clk);
        end

        $stop;
    end

endmodule
