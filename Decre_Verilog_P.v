`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2019 17:25:21
// Design Name: 
// Module Name: Decre_Verilog_P
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


module Decre_Verilog_P(A,B,Y,Cin,Cout,Zout);
   
    parameter N = 4;
    input [N-1:0] A;
    input [N-1:0] B;
    output [N-1:0] Y;
    input Cin;
    output Cout;
    output Zout;
    
    reg [N-1:0] Y_reg;
    reg [N-1:0] B_aux = 1;
    reg [N-1:0] A_aux = 1;
    reg [N-1:0] i;
    reg [N:0] carry;
    reg t1, t2, t3, t4, t5, t6;
    
    reg Z_out;
    
    always @*
    begin
    for(i = 0; i < N; i = i + 1) 
        begin
        if (Cin == 0)
        begin
            carry [0] = 0;
            t1 = A[i] ^ B_aux[i];
            Y_reg[i] = t1 ^ carry[i];
            t4 = ~A[i];
            t2 = t4 & B_aux[i];
            t3 = t4 & carry[i];
            t5 = B_aux[i] & carry[i];
            t6 = t2 | t3;
            carry[i+1] = t6 | t5;
        end else if (Cin == 1)
        begin 
            carry [0] = 0;
            t1 = B[i] ^ A_aux[i];
            Y_reg[i] = t1 ^ carry[i];
            t4 = ~B[i];
            t2 = t4 & A_aux[i];
            t3 = t4 & carry[i];
            t5 = A_aux[i] & carry[i];
            t6 = t2 | t3;
            carry[i+1] = t6 | t5;
            
        end
        
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
