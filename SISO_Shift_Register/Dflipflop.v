`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 14:44:40
// Design Name: 
// Module Name: Dflipflop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Dflipflop(D,clk,reset,Q);
input clk, reset,D;
output reg Q; //We use reg because of changing of value Q in the middle of execution

    always@(posedge clk, posedge reset)

    if(reset)
        Q<=1'b0;
    else 
        Q<=D;
 
endmodule
