`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 14:39:43
// Design Name: 
// Module Name: Control_logic
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


module Control_logic(
    input [6:0] opcode,
    output reg RegWrite,
    output reg [1:0] ImmSrc,
    output reg ALUSrc,
    output reg MemWrite,
    output reg ResultSrc,
    output reg Branch,
    output reg [1:0] ALUOp

    );
    
    always @(*) begin
    casex (opcode)
    7'b0000011: {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp} = 9'b1_00_1_0_1_0_00;  // load instruction
    7'b0100011: {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp} = 9'b0_01_1_1_x_0_00;  // store instruction
    7'b0110011: {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp} = 9'b1_xx_0_0_0_0_10;  // R-Type
    7'b1100011: {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp} = 9'b0_10_0_0_x_1_01;  // beq
    

    
    endcase
    
    end
endmodule

