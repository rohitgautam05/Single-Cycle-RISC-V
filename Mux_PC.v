`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 15:36:05
// Design Name: 
// Module Name: Mux_PC
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


module Mux_PC(
    input PCSrc,
    input [31:0] PCPlus4,
    input [31:0] PCTarget,
    output [31:0] PCNext

    );
    
    assign PCNext = PCSrc? PCTarget:PCPlus4;
endmodule
