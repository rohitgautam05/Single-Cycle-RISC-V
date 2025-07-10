
module Instruction(
    input clk,reset,
    input [31:0] A,
    output reg [31:0] RD
);
integer i;
reg [31:0] Instr_mem [63:0];

always @(posedge clk or posedge reset) begin
    if (reset)
        begin
            for(i=0; i<64; i=i+1) begin
            Instr_mem[i] = 32'b00;
            end
        end
    else
            RD <= Instr_mem[A];
    
 end



endmodule