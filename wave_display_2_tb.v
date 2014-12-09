module wave_display_2_tb ();
	reg clk, reset, valid, read_index;
	reg [10:0] 	x;
	reg [9:0] 	y;
	reg [7:0] 	read_value;
	
	wire [8:0]	read_address;
	wire [7:0] 	r, g, b;
	
	wave_display DUT (
		.clk(clk), 
		.reset(reset), 
		.x(x), 
		.y(y), 
		.valid(1'b1), 
		.read_address(read_address), 
		.read_value(read_value), 
		.read_index(1'b0), 
		.r(r), .g(g), .b(b),
		.color(2'b00)
	);
	
	initial begin
		clk = 1; #5 clk = 0;
		forever begin
			$display("r=%b, x=%d, y=%d, rv=%d, ra=%d, ca=%d, pa=%d, cv=%d, pv=%d, max=%d, min=%d", reset, x, y, read_value, read_address, DUT.current_address, DUT.previous_address, DUT.current_value, DUT.previous_value, DUT.max_value, DUT.min_value);
			#5 clk = 1; #5 clk = 0;	
		end
	end
	integer i,j;
	initial begin
		reset = 0; x = 11'd0; y = 10'd0; read_value = 8'd0;
		#10 reset = 1;
		#10 reset = 0;
		#20 x = 11'd1; y = 10'd1; read_value = 8'd1;
		for (i = 200; i < 500; i = i + 1) begin
			for (j = 200; j < 600; j = j + 1) begin
				#20 x = 11'd1 + j; y = 10'd1 + i; read_value = 8'd1 + i + j;
			end
		end
		#10
		$stop;
	end
endmodule
