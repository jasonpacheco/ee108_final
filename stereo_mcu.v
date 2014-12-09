module stereo_mcu (
	input clk,
	input rst,
	input button_press,
	output [1:0] aural_state
);

	wire 	[1:0] next_state, current_state;
	reg 	[1:0] next_state_reg;

	dff #(2) state_FF (.clk(clk), .d(next_state), .q(current_state));     

	always @(*) begin
		if (button_press) begin
			if (current_state == 2'b11) begin
				next_state_reg = 2'b10;
			end
			else if (current_state == 2'b10) begin
				next_state_reg = 2'b01;
			end
			else begin // cur state == 2'b01
				next_state_reg = 2'b11;
			end
		end
		else begin
			next_state_reg = current_state;
		end
	end

	assign next_state = rst ? 2'b11 : next_state_reg;
	assign aural_state = rst ? 2'b11 : current_state;

endmodule
