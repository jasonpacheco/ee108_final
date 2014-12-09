module dynamics (
	input 			clk,
	input 			rst,
	input 	[15:0] 	sample_in,
	input 	[5:0]	curr,
	input	[5:0]	start,
	input	[7:0]	multiple,
	output 	[15:0] 	sample_out
);

	wire new_sample; 
	wire [31:0] decayed_sample;
	wire [5:0] counter = start-curr;


     reg [15:0] sample_help_reg1;
     reg [31:0] decayed_sample_reg,  sample_help_reg2;

     always @(*) begin
          sample_help_reg1 = ~sample_in + 16'b1;
          sample_help_reg2 = {sample_help_reg1,7'b0}*multiple;
          if(sample_in[15]) begin
               decayed_sample_reg = ~sample_help_reg2 + 32'b1;
          end
          else begin
               decayed_sample_reg = {sample_in,7'b0}*multiple;
          end
     end
     
	assign new_sample = (rst || counter == 7'b0000000);//if counter has restarted the module will have a new sample.
	assign sample_out = new_sample ? sample_in : decayed_sample_reg [31:16];

endmodule
