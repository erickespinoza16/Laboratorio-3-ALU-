`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2019 16:10:11
// Design Name: 
// Module Name: And_Verilog_P
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


module And_Verilog_P (A, B, Y);
    parameter N = 4;
    input [N-1:0] A;
    input [N-1:0] B;
    output [N-1:0] Y;
    
    genvar i;
    generate for(i = 0; i < N; i = i + 1) 
    begin:r_loop
        and g1(Y[i], A[i], B[i]);
    end
    endgenerate
    
endmodule
