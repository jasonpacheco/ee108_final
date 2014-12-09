module stereo_mcu (
	input clk,
	input rst,
	input button_press,
	output [1:0] aural_state
);

	wire 	[1:0] next_state, current_state;
	reg 	[1:0] next_state_reg;

	wire [11:0] count_state;
	dff #(2) state_FF (.clk(clk), .d(next_state), .q(current_state));     
	dffr #(12) counter (.clk(clk), .r(rst || button_press), .d(count_state + 12'b1), .q(count_state));
	
	wire [1:0] gate_state_next, gate_state;
	reg [1:0] gate_state_next_reg;
	dff #(2) gate_FF (.clk(clk), .d(gate_state_next), .q(gate_state));
	
	always @(*) begin
		if (button_press) begin
			gate_state_next_reg = 2'b11;
			if (current_state == 2'b11) begin
				next_state_reg = 2'b10;
			end
			else if (current_state == 2'b10) begin
				next_state_reg = 2'b01;
			end//
			else if (current_state == 2'b01) begin
				next_state_reg = 2'b00;
			end
			else begin // cur state == 2'b01
				next_state_reg = 2'b11;
			end
		end
		else begin
			if (current_state != 2'b00) begin
				next_state_reg = current_state;
				gate_state_next_reg = 2'b11;
			end else begin
				next_state_reg = current_state;
				if (count_state == 12'b100000100011) begin
					if (gate_state == 2'b10) begin
						gate_state_next_reg = 2'b01;
					end else begin
						gate_state_next_reg = 2'b10;
					end
				end else begin
					gate_state_next_reg = 2'b11;
				end
			end
		end
	end
	
	
	assign gate_state_next = (rst || button_press) ? 2'b11 : gate_state_next_reg;
	assign next_state = rst ? 2'b11 : next_state_reg;
	assign aural_state = rst ? 2'b11 : ((current_state != 2'b00) ? current_state : gate_state);

endmodule
