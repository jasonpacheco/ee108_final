module final_top (
    // Clock
    input clk,
    // AC97 interface
    input  AC97Clk,            // AC97 clock (~12 Mhz)
    input  SData_In,           // Serial data in (record data and status)
    output AC97Reset_n,        // Reset signal for AC97 controller/clock
    output SData_Out,          // Serial data out (control and playback data)
    output Sync,               // AC97 sync signal
    // Push button interface
    input  left_button,
    input  right_button,
    input  up_button,
    input down_button,
    input center_button,
    input echo_switch,
    // LEDs
    output wire [3:0] leds_l,
    output wire [3:0] leds_r,
    // DVI Interface
    output chip_hsync,
    output chip_vsync,
    output [11:0] chip_data,
    output chip_reset,
    output chip_data_enable,
    output xclk,
    output xclk_n,
    // I2C
    inout  scl,
    inout  sda
);  
    // button_press_unit's WIDTH parameter is exposed here so that you can
    // reduce it in simulation.  Setting it to 1 effectively disables it.
    parameter BPU_WIDTH = 20;
    // The BEAT_COUNT is parameterized so you can reduce this in simulation.
    // If you reduce this to 100 your simulation will be 10x faster.
    parameter BEAT_COUNT = 1000;

    // Our reset
    wire reset = up_button;
   
    // These signals are for determining which color to display
    wire 	[10:0] 	x;  // [0..1279]
    wire 	[9:0]  	y;  // [0..1023]     
    // Color to display at the given x,y
    
 
//   
//  ****************************************************************************
//      Button processor units
//  ****************************************************************************
//  
    wire play;
    button_press_unit #(.WIDTH(BPU_WIDTH)) play_button_press_unit(
        .clk(clk),
        .reset(reset),
        .in(left_button),
        .out(play)
    );
    
    wire next;
    button_press_unit #(.WIDTH(BPU_WIDTH)) next_button_press_unit(
        .clk(clk),
        .reset(reset),
        .in(right_button),
        .out(next)
    );

	wire stereo;
    button_press_unit #(.WIDTH(BPU_WIDTH)) stereo_button_press_unit(
        .clk(clk),
        .reset(reset),
        .in(center_button),
        .out(stereo)
    );
     

    wire fast_forward;
    button_press_unit #(.WIDTH(BPU_WIDTH)) fast_forward_button_press_unit(
        .clk(clk),
        .reset(reset),
        .in(down_button),
        .out(fast_forward)
    );
       
//   
//  ****************************************************************************
//      The music player
//  ****************************************************************************
//         

    wire [15:0] codec_sample, flopped_sample;
    wire [47:0] out_notes;
    wire [1:0] 	song;
    wire 		new_sample, flopped_new_sample, new_frame, note_display_enable, reset_player;
    wire [17:0]	notes;
    wire beat_out;
    music_player_v2 #(.BEAT_COUNT(BEAT_COUNT)) music_player_v2 (
        .clk(clk),
        .reset(reset),
        .play_button(play),
        .next_button(next),
        .fast_forward_button(fast_forward),
        .echo_switch(echo_switch),
        .new_frame(new_frame),
        
        .new_sample_generated(new_sample), 
        .sample_out(codec_sample),
        .out_notes(out_notes),
        .note_display_play(note_display_enable),
        .song_out(song),
        .reset_player_out(reset_player),
        .note_data_out(notes),
        .beat_out(beat_out)
    );
    
    dff #(.WIDTH(17)) sample_reg (
        .clk(clk),
        .d({new_sample, codec_sample}),
        .q({flopped_new_sample, flopped_sample})
    );
    
    wire flopped_new_sample_note_one;
    wire [15:0] flopped_sample_note_one;
    dff #(.WIDTH(17)) sample_reg_note_one (
        .clk(clk),
        .d({new_sample, out_notes[47:32]}),
        .q({flopped_new_sample_note_one, flopped_sample_note_one})
    );
    
    wire flopped_new_sample_note_two;
    wire [15:0] flopped_sample_note_two;
    dff #(.WIDTH(17)) sample_reg_note_two (
        .clk(clk),
        .d({new_sample, out_notes[31:16]}),
        .q({flopped_new_sample_note_two, flopped_sample_note_two})
    );
    
    wire flopped_new_sample_note_three;
    wire [15:0] flopped_sample_note_three;
    dff #(.WIDTH(17)) sample_reg_note_three (
        .clk(clk),
        .d({new_sample, out_notes[15:0]}),
        .q({flopped_new_sample_note_three, flopped_sample_note_three})
    );

//   
//  ****************************************************************************
//      Wave display
//  ****************************************************************************
//  
	wire 	[7:0]	r_wave, g_wave, b_wave, r_text, g_text, b_text, r, g, b;
    //reg 	[7:0]	r_reg, g_reg, b_reg;
	wave_display_top wd (
		.clk(clk),
		.reset(reset),
		.x(x),
		.y(y),
		.valid(chip_hsync && chip_vsync),
		.vsync(chip_vsync),
		.color(2'b00),
		.r(r_wave), .g(g_wave), .b(b_wave),
		.sample(flopped_sample),
		.new_sample(flopped_new_sample)
	);
	
	wire [7:0] r_n1, g_n1, b_n1, r_n2, g_n2, b_n2, r_n3, g_n3, b_n3;
	wave_display_top wd_note_one (
		.clk(clk),
		.reset(reset),
		.x(x),
		.y(y),
		.valid(chip_hsync && chip_vsync),
		.vsync(chip_vsync),
		.color(2'b01),
		.r(r_n1), .g(g_n1), .b(b_n1),
		.sample(flopped_sample_note_one),
		.new_sample(flopped_new_sample_note_one)
	);
	
	wave_display_top wd_note_two (
		.clk(clk),
		.reset(reset),
		.x(x),
		.y(y),
		.valid(chip_hsync && chip_vsync),
		.vsync(chip_vsync),
		.color(2'b10),
		.r(r_n2), .g(g_n2), .b(b_n2),
		.sample(flopped_sample_note_two),
		.new_sample(flopped_new_sample_note_two)
	);
	
	wave_display_top wd_note_three (
		.clk(clk),
		.reset(reset),
		.x(x),
		.y(y),
		.valid(chip_hsync && chip_vsync),
		.vsync(chip_vsync),
		.color(2'b11),
		.r(r_n3), .g(g_n3), .b(b_n3),
		.sample(flopped_sample_note_three),
		.new_sample(flopped_new_sample_note_three)
	);
	
    
    note_display note_display (
		.clk(clk),
		.reset(reset | reset_player),
		.x(x),
		.y(y),
		.select({(chip_hsync && chip_vsync), note_display_enable, flopped_new_sample}),
		.song(song),
		.note_one(notes[5:0]),
		.note_two(notes[11:6]),
		.note_three(notes[17:12]),
		.r_text(r_text),
		.g_text(g_text),
		.b_text(b_text),
		.beat_high(beat_out)
	);
   	
	assign r = r_text | r_wave | r_n1 | r_n2 | r_n3;
	assign g = g_text | g_wave | g_n1 | g_n2 | g_n3;
	assign b = b_text | b_wave | b_n1 | b_n2 | b_n3;
	
//   
//  ****************************************************************************
//      Stereo MCU interface
//  ****************************************************************************
//  
	
     wire [1:0] aural_state;

     stereo_mcu stereo_mcu (
	     .clk(clk),
	     .rst(reset),
	     .button_press(stereo),
	     .aural_state(aural_state)
     );

//   
//  ****************************************************************************
//      Codec interface
//  ****************************************************************************
//  
    // Output the sample onto the LEDs for the fun of it.
    //assign leds_l = codec_sample[15:12];
    assign leds_r 			= codec_sample[15:12];
	wire [15:0] aural_left 	= {16{aural_state[0]}};
	wire [15:0] aural_right = {16{aural_state[1]}};
	
    ac97_if codec (
        .ClkIn(clk),
        .Reset(1'b0), // The codec's internal reset MUST be tied to 0
        .PCM_Playback_Left(codec_sample & aural_left),   // Set these two to different
        .PCM_Playback_Right(codec_sample & aural_right),  // samples to have stereo audio!
        .PCM_Record_Left(),
        .PCM_Record_Right(),
        .PCM_Playback_Accept(new_frame),  // Asserted each sample
        .AC97Reset_n(AC97Reset_n),
        .AC97Clk(AC97Clk),
        .Sync(Sync),
        .SData_Out(SData_Out),
        .SData_In(SData_In)
    );

//   
//  ****************************************************************************
//      Display management
//  ****************************************************************************
//  
    /* blinking leds to show life */
    wire [26:0] led_counter;

    dff #(.WIDTH (27)) led_div (
        .clk (clk),
        .d (led_counter + 27'd1),
        .q (led_counter)
    );
    assign leds_l = led_counter[26:23];

    dvi_controller_top ctrl (
        .clk    (clk),
        .enable (1'b1),
        .reset  (reset),
        .r      (r),
        .g      (g),
        .b      (b),
        .chip_data_enable (chip_data_enable),
        .chip_hsync       (chip_hsync),
        .chip_vsync       (chip_vsync),
        .chip_reset       (chip_reset),
        .chip_data        (chip_data),
        .xclk             (xclk),
        .xclk_n           (xclk_n),
        .x                (x),
        .y                (y)
    );
 
    // I2C controller to configure dvi interface
    i2c_emulator i2c_controller (
        .clk (clk),
        .rst (reset),
        .scl (scl),
        .sda (sda)
    );

endmodule
