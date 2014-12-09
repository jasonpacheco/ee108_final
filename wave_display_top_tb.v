`include "dvi_defines.v"
module wave_display_top_tb ();
	reg clk, reset, new_sample, valid, vsync;
	reg [15:0] sample;
	wire valid_pixel, read_index, write_en;
	reg new_sample_ready;
	wire [8:0] read_address, write_address;
	wire [7:0] write_sample, read_sample;
	wire [`log2NUM_COLS - 1:0] true_x;
	wire [`log2NUM_ROWS - 1:0] true_y;
	wire chip_data_enable, chip_hsync, chip_vsync, chip_reset, xclk, xclk_n;
	wire [11:0] chip_data;
	 
	wave_capture wc_dut (
        .clk(clk),
        .reset(reset),
        .new_sample_ready(new_sample),
        .new_sample_in(sample),
        .write_address(write_address),
        .write_enable(write_en),
        .write_sample(write_sample),
        .wave_display_idle(~vsync),
        .read_index(read_index)
    );
    
    ram_1w2r #(.WIDTH(8), .DEPTH(9)) sample_ram_dut( 
        .clka(clk),
        .clkb(clk),
        .wea(write_en),
        .addra(write_address),
        .dina(write_sample),
        .douta(),
        .addrb(read_address),
        .doutb(read_sample)
    );
    
    wire [7:0] r, g, b;
    wave_display wd_dut (
        .clk(clk),
        .reset(reset),
        .x(true_x),
        .y(true_y),
        .valid(valid),
        .read_address(read_address),
        .read_value(read_sample),
        .read_index(read_index),
        .valid_pixel(valid_pixel),
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
		//@(negedge chip_vsync);
		clk = 1; #5 clk = 0;
		forever begin
			
			#5 clk = 1; #5 clk = 0;
		end
	end
	
	initial begin
		
		#10 reset = 1'b0; 
		#10 reset = 1'b1; //read_index = 1'b0;
		#10 reset = 1'b0; valid = 1'b1; /*read_index = 1'b1;*/ sample = 16'b1010010010010010; new_sample = 1'b1; vsync = 1'b0; //read_value = 9'b01101010;
		#20 reset = 1'b0; valid = 1'b1; /*read_index = 1'b1;*/ sample = 16'b0010010010010010; new_sample = 1'b1; //read_value = 9'b01111100;
		#20 reset = 1'b0; valid = 1'b1; /*read_index = 1'b1;*/ sample = 16'b1010010010010010; new_sample = 1'b1; //read_value = 9'b11111111;
		#10000 reset = 1'b0; valid = 1'b1; /*read_index = 1'b1;*/sample = 16'b0010010010010010; new_sample = 1'b1; //read_value = 9'b00011110;
		#20 reset = 1'b0; valid = 1'b1; /*read_index = 1'b1;*/ sample = 16'b1010010010010010; new_sample = 1'b1; //read_value = 9'b00110001;
		#20 reset = 1'b0; valid = 1'b1; /*read_index = 1'b1;*/ sample = 16'b0010010010010010; new_sample = 1'b1; //read_value = 9'b10001111;
		#20 reset = 1'b0; valid = 1'b1; /*read_index = 1'b1;*/ sample = 16'b1010010010010010; new_sample = 1'b1; //read_value = 9'b11110000;
		#20 reset = 1'b0; valid = 1'b1; /*read_index = 1'b1;*/ sample = 16'b0010010010010010; new_sample = 1'b1; //read_value = 9'b01011000;
		#20 reset = 1'b0; valid = 1'b1; /*read_index = 1'b1;*/ sample = 16'b0010010010010010; new_sample = 1'b1; //read_value = 9'b11110111;
		$stop;
	end

endmodule
