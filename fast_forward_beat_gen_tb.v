`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:21:15 12/06/2014 
// Design Name: 
// Module Name:    fast_forward_beat_gen_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fast_forward_beat_gen_tb();

     reg clk, rst;
     reg en;
     reg [1:0] fast_forward;
   wire  out;

initial begin
		clk = 1; #5 clk = 0;
		forever begin
			#5 clk = 1; #5 clk = 0;	
		end
	end


beat_gen_ff_enabled DUT(
     .clk(clk),
     .reset(rst),
     .en(en),
     .play_state(fast_forward),
     .beat(out)
     );

initial begin
     rst = 1; en = 0; fast_forward = 2'b00;
     #10;
     rst = 0; en = 0; fast_forward = 2'b00;
     #20;
     en = 1;
     #50;
     fast_forward = 2'b01;
     #50;
     en = 0;
     #20;
     en = 1;
     #50;
     fast_forward = 2'b00;
     #50;
     $stop;
end 

endmodule
