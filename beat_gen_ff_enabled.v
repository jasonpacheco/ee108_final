`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:32 11/30/2014 
// Design Name: 
// Module Name:    beat_gen_ff_enabled 
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
module beat_gen_ff_enabled(
    input clk,
    input reset,
    input en,
    input [1:0] play_state,
    output wire beat
);
    parameter WIDTH = 10;
    parameter STOP = 1000;

    wire [WIDTH-1:0] count;

    dffre #(WIDTH) counter (
        .clk(clk),
        .r(reset | (count == STOP)),
        .en(en),
        .d(play_state[0] ? (count + (2'd2 + count[0])) : count + 1'b1),
        .q(count)
    );

    assign beat = (count == STOP);

endmodule
