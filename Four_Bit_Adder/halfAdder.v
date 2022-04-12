`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2022 16:04:00
// Design Name: 
// Module Name: halfAdder
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

module halfAdder(a,b,sum,carry);
  //assigning input parameters pin
  input a,b;
  //assigning output parameters pin
  output sum,carry;
 
  //Implementing our model of Half Adder
  xor(sum,a,b);
  and(carry,a,b);
  
endmodule
