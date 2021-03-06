`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:52:47 12/07/2014 
// Design Name: 
// Module Name:    past_notes_flop_tb 
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
module past_notes_flop_tb ();
    reg clk, reset;
    initial begin
		clk = 1; #5 clk = 0;
		forever begin
			$display("reset=%b, myin=%d, out1=%d, out2=%d, out3=%d, out4=%d, out5=%d, count=%d", reset, myin, out1, out2, out3, out4, out5, current_count);
			#5 clk = 1; #5 clk = 0;	
		end
	end
    reg [3:0] myin;
	wire [3:0] out1, out2, out3, out4, out5;
	reg new_notes, play_enable;
	dffre #(4) store_notes_1 (.clk(clk), .r(reset), .en(new_notes && play_enable), .d(myin), .q(out1));
	dffre #(4) store_notes_2 (.clk(clk), .r(reset), .en(new_notes && play_enable), .d(out1), .q(out2));
	dffre #(4) store_notes_3 (.clk(clk), .r(reset), .en(new_notes && play_enable), .d(out2), .q(out3));
	dffre #(4) store_notes_4 (.clk(clk), .r(reset), .en(new_notes && play_enable), .d(out3), .q(out4));
	dffre #(4) store_notes_5 (.clk(clk), .r(reset), .en(new_notes && play_enable), .d(out4), .q(out5));
	reg [10:0] current_count;
	dff #(11) count_down (
		.clk(clk),
		.r(reset),
		.en(1'b1),
		.d(current_count - 11'b1),
		.q(current_count)
	);
	
	initial begin
		#10 reset = 0; myin = 4'd4; new_notes = 1; play_enable = 1;
		#10 reset = 1; current_count = reset ? 11'd10 : current_count;
		#10 reset = 0;
		#20 myin = 4'd5;
		#10 myin = 4'd9;
		#10 myin = 4'd10;
		#10 myin = 4'd14;
		#10 myin= 4'd8;
		#10 myin= 4'd11;
		#10 myin = 4'd0;
		#10 myin = 4'd3;
		#10 myin = 4'd1;
		#10 myin = 4'd4;
		#10 myin= 4'd6;
		#10 myin= 4'd15;
		#10 myin = 4'd2;
		$stop;
	end
	
endmodule
