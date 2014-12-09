module wave_display (
	input clk,
	input reset,
	input [10:0] x,  // [0..1279]
	input [9:0]  y,  // [0..1023]
	input valid,
	input [7:0] read_value,
	input read_index,
	output wire [8:0] read_address,
	output wire [7:0] r,
	output wire [7:0] g,
	output wire [7:0] b,
	input [1:0]	color
);

	wire [7:0] current_address, previous_address;
	dffr #(8) address_tracker (.clk(clk), .r(reset), .d(current_address), .q(previous_address));
	wire [7:0] previous_read_value, current_value, previous_value;
	dffr #(8) value_tracker (.clk(clk), .r(reset), .d(current_value), .q(previous_value));
	
	reg [7:0] read_value_reg;
	always @(*) begin
		if (current_address == previous_address) begin
			read_value_reg = read_value;
		end else begin
			read_value_reg = previous_value;
		end
	end
	assign current_value = read_value_reg;
	
	assign previous_read_value = (current_address == 8'b1) ? read_value : previous_value;

	wire [7:0] max_value, min_value;
	assign {max_value, min_value} = (previous_read_value > read_value) ? {previous_read_value, read_value} : {read_value, previous_read_value};
	
	reg [8:0] current_address_reg;
	always @(*) begin
		if (x[10:8] == 3'b0) begin
			current_address_reg = 8'b0;
		end else begin
			if (x[10:8] == 3'b001) begin
				current_address_reg = {1'b0, x[7:1]} + 8'b1;
			end else if (x[10:8] == 3'b010) begin
				current_address_reg = {1'b1, x[7:1]} + 8'b1;
			end else begin
				current_address_reg = 8'b11111111;
			end
		end
	end
	
	assign current_address = current_address_reg;
	assign read_address = {read_index, current_address};

	wire valid_x = (x[10:8] == 3'b001 || x[10:8] == 3'b010);
	wire valid_y = (y[8:1] >= min_value && y[8:1] <= max_value && y[9] == 0); //[8:1
	
	reg [23:0] color_reg;
	always @(*) begin
		case (color)
			2'b00: color_reg = 24'hFFFFFF;
			2'b01: color_reg = 24'hEA4040;
			2'b10: color_reg = 24'h56CCB7;
			2'b11: color_reg = 24'hFDC00D;
			default: color_reg = 24'h000000;
		endcase
	end
	wire valid_pixel;
	assign valid_pixel = (valid && valid_x && valid_y);
	assign {r, g, b} = valid_pixel ? color_reg : 24'b0;
endmodule
