`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2022 16:36:48
// Design Name: 
// Module Name: ATM_Controller_TB
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


module ATM_Controller_TB();
reg clk,rst,IC,S,N;
reg [4:0] account;
reg [3:0] pin;
reg [2:0] bal;
reg [2:0] ammount;
reg [1:0] OP;
wire [11:0] Y;
wire [2:0] balance;


ATM_Controller uut(.clk(clk),.rst(rst),.IC(IC),.S(S),.N(N),.account(account),.pin(pin),.bal(bal),.ammount(ammount),.OP(OP),.Y(Y),.balance(balance));

always #20 clk=!clk;

initial begin
                  clk=1;
                  rst=0;
                  IC=1'b0;
                  S=1'b0;
                  N=1'b0;
                  account=5'b00000;
                  pin=4'b0000;
                  bal= 3'b111;
                  ammount=3'b000;
                  OP=2'b00;
         #100
                  rst=1;
                  IC=1'b1;
                  S=1'b1;
                  N=1'b0;
                  account=5'b11111;
                  pin=4'b0000;
                  bal= 3'b111;
                  ammount=3'b111;
                  OP=2'b10;
         #220
                  rst=1;
                  IC=1'b1;
                  S=1'b1;
                  N=1'b0;
                  account=5'b11111;
                  pin=4'b1111;
                  bal= 3'b111;
                  ammount=3'b111;
                  OP=2'b10;
         #220
                  rst=1;
                  IC=1'b1;
                  S=1'b1;
                  N=1'b0;
                  account=5'b11111;
                  pin=4'b1111;
                  bal= 3'b111;
                  ammount=3'b011;
                  OP=2'b01;                    
         #240 $stop;                 
         end
endmodule
