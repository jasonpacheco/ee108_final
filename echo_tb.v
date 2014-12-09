module echo_tb ();
	reg             clk, reset, new_sample_ready;
	reg     [15:0]  sample_in;
	wire    [15:0]  sample_to_codec;
	
	echo DUT (.clk(clk), .reset(reset), .sample_in(sample_in), .new_sample_ready(new_sample_ready), .sample_to_codec(sample_to_codec), .echo_enable(1'b1));
	
	initial begin
		clk = 1; #5 clk = 0;
		forever begin
			$display("r=%d, NSR=%d, ramin=%d, sin=%d, ramout=%d, sout=%d, count=%d, raddr=%d, waddr=%d, ", reset, new_sample_ready, DUT.modified_sample, sample_in,
			DUT.echoed_sample_out, sample_to_codec, DUT.count_state, DUT.read_address_state, DUT.write_address_state, DUT.delayed_sample_ready);
			#5 clk = 1; #5 clk = 0;
		end
	end

	initial begin
		reset = 1; 	new_sample_ready = 0;
		#10 reset = 0; sample_in = 16'd1;
		#10 sample_in = 16'd2; new_sample_ready = 1;
		#10 sample_in = 16'd3;
		#10 sample_in = 16'd4; new_sample_ready = 0;
		#10 sample_in = 16'd5;
		#10 sample_in = 16'd6;
		#10 sample_in = 16'd7;
		#10 sample_in = 16'd8; new_sample_ready = 1;
		#10 sample_in = 16'd9;
		#10 sample_in = 16'd10;
		#10 sample_in = 16'd11; new_sample_ready = 0;
		#10
		#10 sample_in = 16'd12; new_sample_ready = 1;
		/**
		repeat(4000) begin
			#20 new_sample_ready = 0;
			#20 sample_in = $random;
			#10 new_sample_ready = 1;
		end
		sample_in = 16'd14;**/
		#10 sample_in = 16'd15; new_sample_ready = 0;
		#10
		#10 sample_in = 16'd16; new_sample_ready = 1;
		#10
		#10 sample_in = 16'd17; new_sample_ready = 0;
		#10 sample_in = 16'd18;
		#10 sample_in = 16'd19; new_sample_ready = 1;
		#10
		#10 sample_in = 16'd20; new_sample_ready = 0;
		#10 sample_in = 16'd21;
		#10 sample_in = 16'd22; new_sample_ready = 1;
		#10
		#10 sample_in = 16'd21; new_sample_ready = 0;
		#10 sample_in = 16'd20;
		#10 sample_in = 16'd19;
		#10 sample_in = 16'd18; new_sample_ready = 1;
		#10
		#10 sample_in = 16'd0; new_sample_ready = 0;
		#10 sample_in = 16'd0;
		#10 sample_in = 16'd17; new_sample_ready = 1;
		#10
		#10 sample_in = 16'd16; new_sample_ready = 0;
		#10 sample_in = 16'd15;
		#10 sample_in = 16'd14;
		#10 sample_in = 16'd13;
		#10 sample_in = 16'd12; new_sample_ready = 1;
		#10
		#10 sample_in = 16'd11; new_sample_ready = 0;
		#10 sample_in = 16'd10;
		#10 sample_in = 16'd9;
		#10 sample_in = 16'd8;
		#10 sample_in = 16'd7; new_sample_ready = 1;
		#20 sample_in = 16'd6; 
		#10 sample_in = 16'd5;
		#10
		$stop;
		 
	end
endmodule
