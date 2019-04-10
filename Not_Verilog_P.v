`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2019 19:08:23
// Design Name: 
// Module Name: Not_Verilog_P
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


module Not_Verilog_P (A, B, Y, Cin);

    parameter N = 4;
    input [N-1:0] A;
    input [N-1:0] B;
    output [N-1:0] Y;
    input Cin;
  
    reg [N-1:0] Y_reg;
    reg [N-1:0] i;
    
    always @*
    begin
     for(i = 0; i < N; i = i + 1) 
    begin:r_loop
            if (Cin == 1)
            Y_reg[i] = ~B[i];
            else if (Cin == 0)
            Y_reg[i] = ~A[i];
    end
    end
    assign Y = Y_reg;   
    
endmodule
