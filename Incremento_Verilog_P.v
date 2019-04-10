`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2019 21:02:51
// Design Name: 
// Module Name: Incremento_Verilog_P
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


module Incremento_Verilog_P (A,B,Y,Cin,Cout,Zout);
    parameter N = 4;
    input [N-1:0] A;
    input [N-1:0] B;
    output [N-1:0] Y;
    input Cin;
    output Cout;
    output Zout;
    
    reg [N-1:0] Y_reg;
    reg [N-1:0] i;
    reg [N:0] carry;
    reg t1, t2, t3;
 
    reg Z_out;
 
    always @*
    begin
    for(i = 0; i < N; i = i + 1) 
            if (Cin == 0)
            begin
            carry [0] = 1;
            Y_reg[i] = A[i] ^ carry[i];
            t1 = A[i] & carry[i];
            t2 = t1 & carry[i];
            carry[i+1] = t1 | t2;
           
            end else if (Cin == 1)
                        begin
                        carry [0] = 1;
                        Y_reg[i] = B[i] ^ carry[i];
                        t1 = B[i] & carry[i];
                        t2 = t1 & carry[i];
                        carry[i+1] = t1 | t2;
              
                        end
    end
    
    
    always @*
     begin
            if (Y_reg == 0) begin
                Z_out = 1;
            end else begin
                Z_out = 0;
            end
        
     end
   
    
    assign Y = Y_reg;
    assign Cout = carry[N];
    assign Zout = Z_out;
    
endmodule

