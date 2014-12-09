module dynamics_tb();
	reg clk, rst;
	reg [15:0] sample_1, sample_2, sample_3;
	wire [15:0] sample_out;

	dynamics DUT (.clk(clk), .rst(rst), .sample_1(sample_1), .sample_2(sample_2), .sample_3(sample_3), .sample_out(sample_out));


	initial begin
		clk = 1; #5 clk = 0;
		forever begin
			$display("rst=%b, ns=%b, s1=%b, s2=%b, s3=%b, counter=%b, sin=%b, sout=%b", rst, DUT.new_sample, sample_1, sample_2, sample_3, DUT.counter_reg, DUT.sample_in_reg, sample_out);
			#5 clk = 1; #5 clk = 0;
		end
	end

	initial begin
		#10 rst = 0;
		#10 rst = 1; sample_1 = 16'b0001010101010101; sample_2 = 16'b0000100011100010; sample_3 = 16'b0001000001001011;
		#10 rst = 0; 
		#130 sample_1 = 16'b0100000111011101; sample_2 = 16'b0111110111101111; sample_3 = 16'b1111000001010111;
		#150  sample_1 = 16'b111111111111100; sample_2 = 16'b1010101010101010; sample_3 = 16'b0111111110000000;
		#150
		$stop;
		 
	end

endmodule



	

