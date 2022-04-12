`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2022 16:16:04
// Design Name: 
// Module Name: fourBitadder
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

module fourBitadder(A,B,Cin,S,Cout);
  //assigning input parameters pin (A and B as 4 bit bus)
  input [3:0] A,B;
  input Cin;
  //assigning output parameters pin (S as 4 bit bus)
  output [3:0] S;
  output Cout;
  //assigning wires (inside our model)
  wire C0,C1,C2;
  
  //Implementing our model of 4 bit full Adder
  Adder FA0(.A(A[0]),.B(B[0]),.Cin(Cin),.Sum(S[0]),.Cout(C0));
  Adder FA1(.A(A[1]),.B(B[1]),.Cin(C0),.Sum(S[1]),.Cout(C1));
  Adder FA2(.A(A[2]),.B(B[2]),.Cin(C1),.Sum(S[2]),.Cout(C2));
  Adder FA3(.A(A[3]),.B(B[3]),.Cin(C2),.Sum(S[3]),.Cout(Cout));

endmodule
