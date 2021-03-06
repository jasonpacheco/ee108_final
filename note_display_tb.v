`include "dvi_defines.v"
module note_display_tb ();

	reg clk, reset;
	wire [7:0] r, g, b;
	reg [5:0] note_one, note_two, note_three;
	wire [`log2NUM_COLS - 1:0] true_x;
	wire [`log2NUM_ROWS - 1:0] true_y;
	wire chip_data_enable, chip_hsync, chip_vsync, chip_reset, xclk, xclk_n;
	wire [11:0] chip_data;
	reg beat;
	dvi_controller_top ctrl (
		.clk(clk),
		.enable(1'b1),
		.reset(reset),
		.r(r),
		.g(g),
		.b(b),
		.chip_data_enable(chip_data_enable),
		.chip_hsync(chip_hsync), 
		.chip_vsync(chip_vsync),
		.chip_reset(chip_reset),
		.chip_data(chip_data),
		.x(true_x),
		.y(true_y),
		.xclk(xclk),
		.xclk_n(xclk_n)
	);
	
	note_display DUT (
		.clk(clk),
		.reset(reset),
		.x(true_x),
		.y(true_y),
		.select({(chip_hsync && chip_vsync),1'b1, 1'b1}),
		.note_one(note_one),
		.note_two(note_two),
		.note_three(note_three),
		.r_text(r),
		.g_text(g),
		.b_text(b),
		.song(2'b00),
		.beat_high(beat)
	);
	
	initial begin
		clk = 1; #5 clk = 0;
		forever begin
			$display("o1=%h, o2=%h, o3=%h, o4=%h, o5=%h", DUT.out1, DUT.out2, DUT.out3, DUT.out4, DUT.out5);
			#5 clk = 1; #5 clk = 0;	
		end
	end
	
	initial begin
	
		#10 reset = 0; beat = 0;
		#10 reset = 1;
		#10 reset = 0; note_one = 6'd2; note_two = 6'd4; note_three = 6'd0;
		#10 note_one = 6'd9; note_two = 6'd0; note_three = 6'd0;
		#10 note_one = 6'd9; note_two = 6'd0; note_three = 6'd34; beat = 1;
		/*@(negedge chip_vsync)*/ #10 note_one = 6'd19; note_two = 6'd3; note_three = 6'd18;
		#10 note_one = 6'd19; note_two = 6'd3; note_three = 6'd18;
		#10 note_one = 6'd46; note_two = 6'd27; note_three = 6'd33;
		#10 note_one = 6'd14; note_two = 6'd33; note_three = 6'd22; 
		#10 note_one = 6'd4; note_two = 6'd3; note_three = 6'd2;
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10 note_one = 6'd14; note_two = 6'd33; note_three = 6'd22; 
		#10 note_one = 6'd4; note_two = 6'd3; note_three = 6'd2;
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10 note_one = 6'd14; note_two = 6'd33; note_three = 6'd22; 
		#10 note_one = 6'd4; note_two = 6'd3; note_three = 6'd2;
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;
		#10 note_one = 6'd14; note_two = 6'd33; note_three = 6'd22; 
		#10 note_one = 6'd4; note_two = 6'd3; note_three = 6'd2;
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10 note_one = 6'd14; note_two = 6'd33; note_three = 6'd22; 
		#10 note_one = 6'd4; note_two = 6'd3; note_three = 6'd2;
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10 note_one = 6'd14; note_two = 6'd33; note_three = 6'd22; 
		#10 note_one = 6'd4; note_two = 6'd3; note_three = 6'd2;
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10 note_one = 6'd14; note_two = 6'd33; note_three = 6'd22; 
		#10 note_one = 6'd4; note_two = 6'd3; note_three = 6'd2;
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10 note_one = 6'd14; note_two = 6'd33; note_three = 6'd22; 
		#10 note_one = 6'd4; note_two = 6'd3; note_three = 6'd2;
		#10 note_one = 6'd49; note_two = 6'd13; note_three = 6'd20;	
		#10
		$stop;
	end
endmodule
