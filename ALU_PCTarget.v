`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 16:12:02
// Design Name: 
// Module Name: ALU_PCTarget
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


module ALU_PCTarget(
    input [31:0] PC,
    input [31:0] ImmExt,
    output reg [31:0] PCTarget

    );
    
    always@(*)
    PCTarget = PC + ImmExt;
    
endmodule
