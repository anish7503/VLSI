`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 15:01:54
// Design Name: 
// Module Name: SISO8bit
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


module SISO8bit(D,reset,clk,Q);
input clk,reset;
input  D;
output [7:0] Q;

//always@(posedge clk)
Dflipflop D0 (.D(D),.reset(reset),.clk(clk),.Q(Q[0]));
Dflipflop D1 (.D(Q[0]),.reset(reset),.clk(clk),.Q(Q[1]));
Dflipflop D2 (.D(Q[1]),.reset(reset),.clk(clk),.Q(Q[2]));
Dflipflop D3 (.D(Q[2]),.reset(reset),.clk(clk),.Q(Q[3]));
Dflipflop D4 (.D(Q[3]),.reset(reset),.clk(clk),.Q(Q[4]));
Dflipflop D5 (.D(Q[4]),.reset(reset),.clk(clk),.Q(Q[5]));
Dflipflop D6 (.D(Q[5]),.reset(reset),.clk(clk),.Q(Q[6]));
Dflipflop D7 (.D(Q[6]),.reset(reset),.clk(clk),.Q(Q[7]));

endmodule
