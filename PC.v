// Program Counter module


module PC (
    input clk,
    input reset,
    input [31:0] PC_Next,
    output reg [31:0] PC);
    
    always@(posedge clk)begin
        if(reset)
            PC <= 32'b00;
        else
            PC <= PC_Next;
     end

endmodule