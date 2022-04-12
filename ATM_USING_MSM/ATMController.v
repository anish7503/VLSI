`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2022 15:10:48
// Design Name: 
// Module Name: ATM_Controller
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

module ATM_Controller(clk,rst,account,pin,bal,ammount,IC,S,OP,N,Y,balance);

input wire clk,rst,IC,S,N; //IC=insert_card,S=card_scan,N=more_transaction
input wire [3:0] pin;
input wire [4:0] account;
input wire [2:0] bal;
input wire [2:0] ammount;
input wire [1:0] OP; //OP= option that is selected by the user
output reg [11:0] Y;
output reg [2:0] balance;

//Definining all the state of ATM controller
parameter [3:0]  Welcome=4'b0000,           //s0
                 Scan_Card=4'b0001,         //s1
                 Enter_Pin=4'b0010,         //s2
                 Option_For_Txn=4'b0011,    //s3
                 Invalid=4'b0100,           //s4
                 Withdraw=4'b0101,          //s5
                 Balance_Check=4'b0110,     //s6
                 Deposit=4'b0111,           //s7
                 Withdrawn_Ammount=4'b1000, //s8
                 Balance_Show=4'b1001,      //s9
                 Deposited_Ammount=4'b1010, //s10
                 Next=4'b1011;              //s11

reg [3:0] current_state, next_state;
always @(*)
begin
     Y[0]  <= 0;
     Y[1]  <= 0; 
     Y[2]  <= 0;
     Y[3]  <= 0;
     Y[4]  <= 0;
     Y[5]  <= 0;
     Y[6]  <= 0;
     Y[7]  <= 0;
     Y[8]  <= 0;
     Y[9]  <= 0;
     Y[10] <= 0;
     Y[11] <= 0;
     
     next_state <= 0;
     balance <= bal;

case(current_state)
       Welcome:begin
                       if(IC)
                            begin
                            next_state <= Scan_Card;
                            Y[1] <= 1;
                            end
                       else
                            begin
                            next_state <= Welcome;
                            Y[0] <= 1;
                            end
                end
                       
       Scan_Card: begin
                       if(S)
                            begin
                            next_state <= Enter_Pin;
                            Y[2] <= 1;
                            end
                       else
                            begin
                            next_state <= Welcome;
                            Y[0] <= 1;
                            end
                  end
                  
      Enter_Pin: begin
                       if(pin == 4'b1111)
                            begin
                            next_state <= Option_For_Txn;
                            Y[3] <= 1;
                            end
                       else
                            begin
                            next_state <= Invalid;
                            Y[4] <= 1;
                       end
                 end
                 
      Invalid: begin
                       next_state <= Welcome;
                       Y[0] <= 1;
               end
               
      Option_For_Txn: begin
                         if(OP == 2'b01)
                             begin
                             next_state <= Withdraw;
                             Y[5] <= 1;
                             end
                         else if(OP == 2'b10)
                             begin
                             next_state <= Balance_Check;
                             Y[6] <= 1;
                             end
                         else if(OP == 2'b11)
                             begin
                             next_state <= Deposit;
                             Y[7] <= 1;
                             end
                         else
                             begin
                             next_state <= Invalid;
                             Y[4] <= 1;
                             end
                 end
                         
      Withdraw: begin
                        if(ammount <= bal) 
                             begin
                             balance<=bal-ammount;
                             next_state <= Withdrawn_Ammount;
                             Y[8] <= 1;
                             end
                        else
                             begin
                             next_state <= Invalid;
                             Y[4] <= 1;
                             end
                end
                
      Balance_Check: begin
                       next_state <= Balance_Show;
                       Y[9] <= 1;
                     end
                     
      Deposit: begin
                    if(ammount <= 11)
                             begin
                             balance<=bal+ammount;
                             next_state <= Deposited_Ammount;
                             Y[10] <= 1;
                             end
                    else
                             begin
                             next_state <= Invalid;
                             Y[4] <= 1;
                             end
                    end
                    
      Withdrawn_Ammount: begin
                             next_state <= Next;
                             Y[11] <= 1;
                         end
                         
      Balance_Show: begin
                             next_state <= Next;
                             Y[11] <= 1;
                    end
                    
      Deposited_Ammount: begin
                             next_state <= Next;
                             Y[11] <= 1;
                         end
                         
      Next: begin
                   if(N)
                        begin
                        next_state <= Option_For_Txn;
                        Y[3] <= 1;
                        end
                   else
                        begin
                        next_state <= Welcome;
                        Y[0] <= 1;
                        end
            end
 endcase

end

always @(posedge clk or negedge rst)
         begin
              if(!rst)
                     begin
                     current_state<=Welcome;
                     end
              else
                     current_state<=next_state;
                     end
endmodule
