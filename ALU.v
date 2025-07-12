`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 01:43:17
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    output reg zero,
    output reg [31:0] ALUResult
    );
    
    
    always @(*)
    case (ALUControl)
    3'b000:begin
            zero =0;
            ALUResult = SrcA + SrcB;
            end
        
    3'b001:begin
            if(SrcA == SrcB)
            zero=1;
            else
            ALUResult = SrcA - SrcB;
            end
        
    3'b011:begin
            zero=0;
            ALUResult = SrcA | SrcB;
            end
            
    3'b010:begin
            zero=0;
            ALUResult = SrcA & SrcB;
            end     
   
    endcase
endmodule

