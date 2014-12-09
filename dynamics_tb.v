module dynamics_tb();
	reg clk, rst;
	reg [15:0] sample;
	reg [7:0] multiplier;
	wire [15:0] sample_out;

	dynamics DUT (.clk(clk), .rst(rst), .sample_in(sample), .curr(5'b11111), .start(5'b01010), .multiple(multiplier), .sample_out(sample_out));


	initial begin
		clk = 1; #5 clk = 0;
		forever begin
			$display("rst=%b, ns=%b, sin%b, multiple=%b sout=%b", rst, DUT.new_sample, sample, multiplier, sample_out);
			#5 clk = 1; #5 clk = 0;
		end
	end

	initial begin
		#10 rst = 0;
		#10 rst = 1; sample = 16'b0001010101010101; 
		#10 rst = 0; 
		#10 sample = 16'b0001010101010101; multiplier = 8'b10000000;		
		#10 multiplier = 8'b01111101;
		#10 multiplier = 8'b01111010;
		#10 multiplier = 8'b01111000;
		#10 multiplier = 8'b01110101;
		#10 multiplier = 8'b01110011;
		#10 multiplier = 8'b01110000;
		#10 multiplier = 8'b01101110;
		#10 multiplier = 8'b01101100;
		#10 multiplier = 8'b01101010;
		#10 multiplier = 8'b01100111;
		#10 multiplier = 8'b01100101;
		#10 multiplier = 8'b01100011;
		#10 multiplier = 8'b01100001;
		#10 multiplier = 8'b01011111;
		#10 multiplier = 8'b01011101;
		#10 multiplier = 8'b01011011;
		#10 multiplier = 8'b01011001;
		#10 multiplier = 8'b01010111;
		#10 multiplier = 8'b01010110;
		#10 multiplier = 8'b01010100;
		#10 multiplier = 8'b01010010;
		#10 multiplier = 8'b01010001;
		#10 multiplier = 8'b01010000;
		#10 multiplier = 8'b01001111;
		#10 multiplier = 8'b01001101;
		#10 multiplier = 8'b01001100;
		#10 multiplier = 8'b01001010;
		#10 multiplier = 8'b01001000;
		#10 multiplier = 8'b01000101;
		#10 multiplier = 8'b01000100;
		#10 multiplier = 8'b01000011;
		#10 multiplier = 8'b01000001;
		#10 multiplier = 8'b01000000;
		#10 multiplier = 8'b00111111;
		#10 multiplier = 8'b00111101;
		#10 multiplier = 8'b00111100;
		#10 multiplier = 8'b00111011;
		#10 multiplier = 8'b00111001;
		#10 multiplier = 8'b00111000;
		#10 multiplier = 8'b00110111;
		#10 multiplier = 8'b00110110;
		#10 multiplier = 8'b00110101;
		#10 multiplier = 8'b00110100;
		#10 multiplier = 8'b00110011;
		#10 multiplier = 8'b00110010;
		#10 multiplier = 8'b00110001;
		#10 multiplier = 8'b00110000;
		#10 multiplier = 8'b00101111;			//48
		#10 multiplier = 8'b00101110;
		#10 multiplier = 8'b00101101;
		#10 multiplier = 8'b00101100;
		#10 multiplier = 8'b00101011;
		#10 multiplier = 8'b00101010;
		#10 multiplier = 8'b00101001;
		#10 multiplier = 8'b00101000;
		#10 multiplier = 8'b00100111;
		#10 multiplier = 8'b00100111;
		#10 multiplier = 8'b00100110;
		#10 multiplier = 8'b00100101;
		#10 multiplier = 8'b00100100;
		#10 multiplier = 8'b00100011;
		#10 multiplier = 8'b00100011;
		#10 multiplier = 8'b00100010;
		#10
		$stop;
		 
	end

endmodule



	

