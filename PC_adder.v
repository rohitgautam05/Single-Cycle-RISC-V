`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 15:02:12
// Design Name: 
// Module Name: PC_adder
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


module PC_adder( 
    input [31:0] PC,
    output [31:0] PCPlus4
    );
    
    assign PCPlus4 = PC + 4;

   
endmodule
