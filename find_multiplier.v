module find_multiplier(
	input clk,
	input rst,
	input [5:0] curr,
	input [5:0] start,
	output [7:0] multiple
    );

	reg [7:0] multiplier;
	wire [5:0] counter = start-curr;

always @(*) begin
		case (counter)
			6'b000000: multiplier = 8'b10000000;
			6'b000001: multiplier = 8'b01111101;
			6'b000010: multiplier = 8'b01111010;
			6'b000011: multiplier = 8'b01111000;
			6'b000100: multiplier = 8'b01110101;
			6'b000101: multiplier = 8'b01110011;
			6'b000110: multiplier = 8'b01110000;
			6'b000111: multiplier = 8'b01101110;
			6'b001000: multiplier = 8'b01101100;
			6'b001001: multiplier = 8'b01101010;
			6'b001010: multiplier = 8'b01100111;
			6'b001011: multiplier = 8'b01100101;
			6'b001100: multiplier = 8'b01100011;
			6'b001101: multiplier = 8'b01100001;
			6'b001110: multiplier = 8'b01011111;
			6'b001111: multiplier = 8'b01011101;
			6'b010000: multiplier = 8'b01011011;
			6'b010001: multiplier = 8'b01011001;
			6'b010010: multiplier = 8'b01010111;
			6'b010011: multiplier = 8'b01010110;
			6'b010100: multiplier = 8'b01010100;
			6'b010101: multiplier = 8'b01010010;
			6'b010110: multiplier = 8'b01010001;
			6'b010111: multiplier = 8'b01010000;
			6'b011000: multiplier = 8'b01001111;
			6'b011001: multiplier = 8'b01001101;
			6'b011010: multiplier = 8'b01001100;
			6'b011011: multiplier = 8'b01001010;
			6'b011100: multiplier = 8'b01001000;
			6'b011101: multiplier = 8'b01000101;
			6'b011110: multiplier = 8'b01000100;
			6'b011111: multiplier = 8'b01000011;
			6'b100000: multiplier = 8'b01000001;
			6'b100001: multiplier = 8'b01000000;
			6'b100010: multiplier = 8'b00111111;
			6'b100011: multiplier = 8'b00111101;
			6'b100100: multiplier = 8'b00111100;
			6'b100101: multiplier = 8'b00111011;
			6'b100110: multiplier = 8'b00111001;
			6'b100111: multiplier = 8'b00111000;
			6'b101000: multiplier = 8'b00110111;
			6'b101001: multiplier = 8'b00110110;
			6'b101010: multiplier = 8'b00110101;
			6'b101011: multiplier = 8'b00110100;
			6'b101100: multiplier = 8'b00110011;
			6'b101101: multiplier = 8'b00110010;
			6'b101110: multiplier = 8'b00110001;
			6'b101111: multiplier = 8'b00110000;
			6'b110000: multiplier = 8'b00101111;			//48
			6'b110001: multiplier = 8'b00101110;
			6'b110010: multiplier = 8'b00101101;
			6'b110011: multiplier = 8'b00101100;
			6'b110100: multiplier = 8'b00101011;
			6'b110101: multiplier = 8'b00101010;
			6'b110110: multiplier = 8'b00101001;
			6'b110111: multiplier = 8'b00101000;
			6'b111000: multiplier = 8'b00100111;
			6'b111001: multiplier = 8'b00100111;
			6'b111010: multiplier = 8'b00100110;
			6'b111011: multiplier = 8'b00100101;
			6'b111100: multiplier = 8'b00100100;
			6'b111101: multiplier = 8'b00100011;
			6'b111110: multiplier = 8'b00100011;
			6'b111111: multiplier = 8'b00100010;
			default: multiplier = 8'b00100010;

		endcase
	end

assign multiple = multiplier;


endmodule
