`include "dvi_defines.v"
module wave_display_top_tb ();
	reg clk, reset, vsync;
	reg [15:0] sample;
	wire [`log2NUM_COLS - 1:0] true_x;
	wire [`log2NUM_ROWS - 1:0] true_y;
	wire chip_data_enable, chip_hsync, chip_vsync, chip_reset, xclk, xclk_n;
	wire [11:0] chip_data;
	wire [7:0] r, g, b;
	wave_display_top DUT (
		.clk(clk),
		.reset(reset),
		.new_sample(1'b1),
		.sample(sample),
		.x(true_x),
		.y(true_y),
		.valid(chip_hsync && chip_vsync),
		.vsync(chip_vsync),
		.color(2'b00),
		.r(r), .g(g), .b(b)
	);
	
	
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
	
	initial begin
		//
		clk = 1; #5 clk = 0;
		forever begin
			#5 clk = 1; #5 clk = 0;
		end
	end
	
	initial begin
		
		#10 reset = 1'b1; sample = 16'b1010010010010010;
		#10 reset = 1'b0; //read_index = 1'b0;
		#10 sample = 16'b1010010000111001;
		#10 sample = 16'b1010010010010010;
		@(negedge chip_vsync) #10 sample = 16'b1010010010010010;
		@(negedge chip_vsync) #10 sample = 16'b1010101100011100;
		@(negedge chip_vsync) #10 sample = 16'b1010010010010010;
		#10 sample = 16'b1010010010010010;
		#10 sample = 16'b1010011010110010;
		#10 sample = 16'b1010100101011101;
		#10 sample = 16'b1010010010010010;
		#10 sample = 16'b1010010010010010;
		#10 sample = 16'b1010101010101000;
		#10 sample = 16'b1011010101011101;
		#10 sample = 16'b1010010010010010;
		#10 sample = 16'b1011100111111111;
		#10 sample = 16'b1010010010010010;
		
		$stop;
	end

endmodule
