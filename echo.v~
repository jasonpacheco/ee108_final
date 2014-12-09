`define COUNT_MAX 14'b10010110000000 //14'b10010110000000	// Equivalent to a delay of 200 ms
`define MAX_SAT 16'hFFFF //16'hFFFF
`define WEIGHT 1
module echo (
	input 			clk,
	input			reset,
	input 	[15:0] 	sample_in,
	input 			new_sample_ready,
	input 			echo_enable,
	output 	[15:0] 	sample_to_codec
);
	wire 			read_enable;
	wire			delayed_sample_ready;
	wire 	[13:0] 	count_state;
	
	dffr #(1) sample_ready_ff (
		.clk(clk),
		.r(reset),
		.d(new_sample_ready),
		.q(delayed_sample_ready)
	);
	
	dffre #(14) counter (
    	.clk(clk), 
    	.r(reset), 
    	.en(!read_enable && (new_sample_ready && !delayed_sample_ready)), 
    	.d(count_state + 14'b1), 
    	.q(count_state)
	);
	
    // We write samples into the address tracked by this flip-flop; asserted when new_sample_ready is high.
	wire [15:0] write_address_state;
	dffre #(16) write_address_ff (
		.clk(clk),
		.r(reset || write_address_state == `MAX_SAT),
		.en((new_sample_ready && !delayed_sample_ready)),
		.d(write_address_state + 16'b1),
		.q(write_address_state)
	);
	// We read samples from the address tracked by this flip-flop; on when counter has reached the maximum delay time.
	wire [15:0] read_address_state;
	dffre #(16) read_address_ff (
		.clk(clk),
		.r(reset || read_address_state == `MAX_SAT),
		.en(read_enable),
		.d(read_address_state + 16'b1),
		.q(read_address_state)
	);
	
	assign read_enable = reset ? 0 : ((count_state == `COUNT_MAX && (new_sample_ready && !delayed_sample_ready)) ? 1 : 0);
	
	// When read_enable goes high, we start reading samples from the RAM
	// and combining it with the current sample into the note player.
	wire [15:0] echoed_sample_out;
	wire [15:0] modified_sample;
	reg [15:0] modified_sample_help_reg1, modified_sample_help_reg2, modified_sample_reg; 
	always @(*) begin
          modified_sample_help_reg1 = ~echoed_sample_out + 16'b1;
          modified_sample_help_reg2 = modified_sample_help_reg1 / `WEIGHT;
          if(echoed_sample_out[15]) begin
               modified_sample_reg = ~modified_sample_help_reg2 + 16'b1;
          end
          else begin
               modified_sample_reg = echoed_sample_out / `WEIGHT;
          end
     end
	
	
	assign modified_sample = reset ? 16'b0 : ((read_enable && echo_enable) ? (((sample_in + modified_sample_reg) >= `MAX_SAT) ? `MAX_SAT : sample_in + modified_sample_reg) : sample_in);
	
	wire [15:0] sample;	
	assign sample = reset ? sample_in : modified_sample;

	wire [15:0] delayed_sample;
	dffr #(16) sample_ff (
		.clk(clk),
		.r(reset),
		.d(sample),
		.q(delayed_sample)
	);
	
	ram_1w2r #(.WIDTH(16), .DEPTH(16)) delayed_sample_ram (
		.clka(clk),
		.wea(delayed_sample_ready),
		.addra(write_address_state),
		.dina(delayed_sample),
		.douta(),
		.clkb(clk),
		.addrb(read_address_state),
		.doutb(echoed_sample_out)
	);
	assign sample_to_codec = modified_sample;
	
endmodule
