`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 16:24:30
// Design Name: 
// Module Name: SISO8bit_tb
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


module SISO8bit_tb();
reg  D;
reg clk,reset;
wire [7:0] Q;

SISO8bit uut(.D(D),.reset(reset),.clk(clk), .Q(Q));

always #20 clk=!clk;
 
 initial begin
 clk=0;
 reset=0;
 D=8'b1;
 
 #600
 reset=1;
 D=8'b1;
 
 #600 $stop;
 
 end
endmodule
