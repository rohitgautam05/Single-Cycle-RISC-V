`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 23:44:47
// Design Name: 
// Module Name: Imm_gen
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


module Immediate_generator(
    input [31:0] Instr,
    input [1:0] Imm_Src,
    output reg [31:0]Imm_Ext
    );
    
always @(*) 
begin    
    case (Imm_Src)
    2'b00: Imm_Ext = {{20{Instr[31]}},Instr[31:20]}; // I-type
    2'b01: Imm_Ext = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]}; // S-Type
    2'b10: Imm_Ext = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8],1'b0}; //B-Type
    2'b11: Imm_Ext = {{12{Instr[31]}}, Instr[19:12], Instr[20],Instr[30:21],1'b0}; //J-Type
    
    endcase
end
endmodule


