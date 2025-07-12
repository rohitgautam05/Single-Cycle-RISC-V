module Datamemory (
    input clk,
    input reset,
    input [31:0] A,
    input [31:0] WD,
    input WE,
    output [31:0]RD
    );
      
    integer i;
    reg [31:0] D_Memory [63:0];
    
    always@(posedge clk or posedge reset) begin
    if(reset)
        begin
            for(i=0;i<64;i= i+1)
            D_Memory[i] <= 32'b00;
        end
    else if(WE) 
            D_Memory[A] <= WD;
    end
assign   RD = D_Memory[A];

endmodule