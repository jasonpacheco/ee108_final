module sine_reader (
    input 			clk,
    input 			reset,
    input 	[19:0] 	step_size,
    input 			generate_next,
	input 	[1:0] 	play_state,
    output 			sample_ready,
    output 	[15:0] 	sample
);
	wire [9:0] addr;
	wire [15:0] dout;
	sine_rom sine_rom (.clk(clk), .addr(addr), .dout(dout));
	wire [21:0] next_state_count, current_state_count;
	dff #(22) countFF (.clk(clk), .d(next_state_count), .q(current_state_count));
	//wire [21:0] quad_addr;
	reg [21:0] 	quad_addr_reg;
	reg 		sample_start_reg;
	
	always @(*) begin
		if (generate_next) begin
			case (play_state)
				2'b00: 	begin
							quad_addr_reg = current_state_count + step_size;
						end
				2'b01: 	begin
							quad_addr_reg = current_state_count + step_size + step_size;
						end
				2'b10: 	begin
							quad_addr_reg = current_state_count - step_size;
						end
				default: 	quad_addr_reg = current_state_count;
			endcase
			sample_start_reg = 0;
		end
		else begin
			quad_addr_reg 		= current_state_count;
			sample_start_reg 	= 1;
		end
		
	end
	
	reg [15:0] sample_out_reg;
	reg [9:0] addr_reg;
	
	always @(*) begin
		case (next_state_count[21:20])
			2'b00:	 begin
						sample_out_reg 	= dout / 8;
						addr_reg 		= next_state_count[19:10];
					 end
			2'b01:	 begin
						sample_out_reg 	= dout / 8;
						addr_reg 		= ~next_state_count[19:10];
					 end
			2'b10:	 begin
						sample_out_reg 	= 16'b0 - dout / 8;
						addr_reg 		= next_state_count[19:10];
					 end
			2'b11:	 begin
						sample_out_reg 	= 16'b0 - dout / 8;
						addr_reg 		= ~next_state_count[19:10];
					 end
			default: begin
						sample_out_reg 	= dout / 8;
						addr_reg 		= next_state_count[19:10];
					 end
		endcase
	end
	
	wire 	[1:0] sample_ready_state_curr, sample_ready_state_next;
	reg		[1:0] sample_ready_reg;
	
	always @(*) begin
		if (sample_start_reg == 0) begin
			sample_ready_reg = 2'b00;
		end else if (sample_ready_state_curr == 2'b00) begin
			sample_ready_reg = 2'b01;
		end else if (sample_ready_state_curr == 2'b01) begin
			sample_ready_reg = 2'b10;
		end else if (sample_ready_state_curr == 2'b10) begin 
			sample_ready_reg = 2'b11;
		end else begin 
			sample_ready_reg = sample_ready_state_curr;
		end
	end
	
	dffr #(2) pipe_ready(.clk(clk), .r(reset),.d(sample_ready_state_next), .q(sample_ready_state_curr));
		
	wire [15:0] sample_curr, sample_next;
	
	assign sample_ready_state_next 	= reset ? 2'b0 : sample_ready_reg;
	assign sample_next 				= sample_out_reg;
	
	assign addr 			= reset ? 10'b0 : addr_reg;
	assign next_state_count = reset ? 22'd0 : quad_addr_reg;
	assign sample_ready 	= reset ? 1'b0 : (sample_ready_state_next == 2'b11);
	dffr #(16) pipe(.clk(clk), .r(reset),.d(sample_next), .q(sample_curr));
	assign sample = sample_curr;
endmodule
