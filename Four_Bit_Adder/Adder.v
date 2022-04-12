`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2022 15:30:18
// Design Name: 
// Module Name: Adder
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

module Adder(A,B,Cin,Sum,Cout);
  //assigning input parameters pin
  input A,B,Cin;
  //assigning output parameters pin
  output Sum,Cout;
  //assigning wires (inside our model)
  wire W1,W2,W3;

  //Implementing our model of full Adder
  halfAdder HA1(.a(A),.b(B),.sum(W2),.carry(W1)); 
  halfAdder HA2(.a(W2),.b(Cin),.sum(Sum),.carry(W3)); 
  or(Cout,W1,W3);

endmodule
