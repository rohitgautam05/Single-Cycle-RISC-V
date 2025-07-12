`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 15:36:39
// Design Name: 
// Module Name: Mux_ALU
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


module Mux_ALU(
    input ALUSrc,
    input [31:0] ImmExt,
    input [31:0] RD2,
    output [31:0] SrcB

    );
    
    assign SrcB = ALUSrc? ImmExt:RD2;
endmodule
