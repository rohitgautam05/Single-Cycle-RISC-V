`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 13:47:52
// Design Name: 
// Module Name: ALU_Decoder
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


module ALU_Decoder(
    input [1:0] ALUOp,
    input opcode5,
    input [2:0] funct3,
    input funct7,
    output reg [2:0] ALUControl

    );
    always @(*) begin
    casex ({ALUOp, funct3, opcode5, funct7}) // Case accepts only one expression so we need to concatenate it.
    7'b00_xxx_xx: ALUControl = 3'b000; //add ->lw,sw
    7'b01_xxx_xx: ALUControl = 3'b001; //sub -> beq
    7'b10_000_0x: ALUControl = 3'b000; //add -> add
    7'b10_000_11: ALUControl = 3'b001; //sub -> sub
    7'b10_010_xx: ALUControl = 3'b101; //set less than -> slt
    7'b10_110_xx: ALUControl = 3'b011; //or -> or
    7'b10_111_xx: ALUControl = 3'b010; //and -> and
    default: ALUControl = 3'b000; 
    endcase
    end

endmodule
