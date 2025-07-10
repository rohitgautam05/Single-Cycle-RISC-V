`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 15:29:02
// Design Name: 
// Module Name: Register
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


module Register(
    input clk,
    input reset,
    input WE3,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    output reg [31:0] RD1,
    output reg [31:0] RD2
    
    );
integer i;   
reg [31:0] Registers [31:0];

always @(posedge clk or posedge reset) begin
    if(reset)begin
        for (i=0; i<32; i = i+1)begin
            Registers[i] <= 32'b00;
        end
    end
    else if (WE3) begin
            Registers [A3] <= WD3;
    end       
end  
assign RD1 = Registers [A1];
assign RD2 = Registers [A2];
          
endmodule

// Packed type cannot be assigned to unpacked type