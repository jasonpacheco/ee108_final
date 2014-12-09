`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:07 11/30/2014 
// Design Name: 
// Module Name:    aural_tb 
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
module aural_tb(
    );
reg clk, rst, bp;
wire [1:0] out;

initial begin
		clk = 1; #5 clk = 0;
		forever begin
			$display("bp=%b, aural_state=%b", bp, DUT.aural_state);
			#5 clk = 1; #5 clk = 0;	
		end
	end

 stereo_mcu DUT(
	.clk(clk),
     .rst(rst),
     .button_press(bp),
     .aural_state(out)
    );

initial begin
rst = 1; bp = 0;
#10;
rst = 0;
#50;
bp = 1;
#10;
bp = 0;
#50;
bp = 1;
#10;
bp = 0;
#50;
bp = 1;
#10;
bp = 0;
#40
rst = 1; bp = 0;
#10;
rst = 0;
#40;
bp = 1;
#10;
bp = 0;
#50;
$stop;
end


endmodule