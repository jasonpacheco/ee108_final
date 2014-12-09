module wave_capture_tb ();

	reg clk, reset, new_sample_ready, wave_display_idle;
	reg [15:0] new_sample_in;
	wire write_enable, read_index;
	wire [8:0] write_address;
	wire [7:0] write_sample;
	
	wave_capture dut (
		.clk(clk),
		.reset(reset),
		.new_sample_ready(new_sample_ready),
		.new_sample_in(new_sample_in),
		.write_address(write_address),
		.write_enable(write_enable),
		.write_sample(write_sample),
		.wave_display_idle(wave_display_idle),
		.read_index(read_index)
	);
	
	initial begin
		clk = 1; #5 clk = 0;
		forever begin
			$display("rst=%b, sam=%b, NSR=%b, WDI=%b, w_en=%b, w_add=%b, w_sam=%b, r_index=%b, nxt_st=%b, curr_st=%b, nxt_count=%b, curr_count=%b, pzs=%b",/*<-add*/ reset, new_sample_in, new_sample_ready, wave_display_idle, write_enable, write_address, write_sample, read_index, dut.next_state, dut.current_state, dut.next_address_counter, dut.current_address_counter, dut.positive_zero_seen);
			#5 clk = 1; #5 clk = 0;
		end
	end
	
	initial begin
		#10 reset = 0;
		#10 reset = 1;
		#10 reset = 0; new_sample_in = 16'b0100101100000000; new_sample_ready = 1; wave_display_idle = 0;
		#10 new_sample_ready = 0;
		#20 new_sample_in = 16'b1001101000000011; new_sample_ready = 1;
		#10 new_sample_in = 16'b0100000100000011; new_sample_ready = 1; // start
		#30 new_sample_ready = 0;
		#10 new_sample_in = 16'b1111111100000011; new_sample_ready = 1;
		#10 new_sample_in = 16'b0101100101110000; new_sample_ready = 1; // end
		#10 new_sample_in = 16'b0010101100010010; new_sample_ready = 1; 
		#50 new_sample_ready = 0;
		#10 new_sample_in = 16'b0101101000000011; new_sample_ready = 1;
		#10 new_sample_in = 16'b1000000000101000; new_sample_ready = 1;
		#10 new_sample_ready = 0; wave_display_idle = 1;
		#20 wave_display_idle = 0; new_sample_in = 16'b1000001100101000; new_sample_ready = 1;
		#30 new_sample_in = 16'b0111111000000000; // start
		#10 new_sample_in = 16'b0010011001111000;
		#10 new_sample_in = 16'b0101011000010101; new_sample_ready = 0;
		#10 new_sample_in = 16'b1010011000000010; new_sample_ready = 1;
		#10 new_sample_in = 16'b0011111001110000; wave_display_idle = 0; // end
		#3000 wave_display_idle = 1;
		#30 new_sample_in = 16'b1000101010000000; new_sample_ready = 1;
		#10 new_sample_in = 16'b0001111010010111; new_sample_ready = 1;
		#10 new_sample_in = 16'b0111111100000000; new_sample_ready = 1;
		#10
		$stop;
	end


endmodule
