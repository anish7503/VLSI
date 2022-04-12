`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 10:51:03
// Design Name: 
// Module Name: fourBitAdderTB
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


module fourBitAdderTB();
//Taking inputs as register
reg [3:0] A,B;
reg Cin;
//Taking outputs as wire
wire [3:0] S;
wire Cout;

fourBitadder uut(.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout));

  initial 
    begin //Begining the simulation for 400ns
        Cin=1'b0;
        A=4'b0001;
        B=4'b0001;

    #100
        Cin=1'b0;
        A=4'b1111;
        B=4'b1111;
    
    #100
        Cin=1'b1;
        A=4'b0011;
        B=4'b1011;
        
    #100
         Cin=1'b1;
         A=4'b1111;
         B=4'b1111;
             
    #100 $stop; //Stopping the simulation after 400 ns
  end
endmodule
