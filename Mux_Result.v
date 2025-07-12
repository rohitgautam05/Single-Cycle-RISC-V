`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 15:48:51
// Design Name: 
// Module Name: Mux_Result
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


module Mux_Result(
    input ResultSrc,
    input [31:0] ALUResult,
    input [31:0] ReadData,
    output [31:0] Result
    );
    
    assign Result = ResultSrc? ReadData:ALUResult;

endmodule
