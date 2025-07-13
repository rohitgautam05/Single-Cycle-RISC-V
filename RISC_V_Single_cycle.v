module RISC_V_Single_cycle(
    input clk,
    input reset
);

//Declarations

//Program Counter 
wire [31:0] PC;

//PC Adder
wire PCPlus4;

//Instruction Memory
wire [31:0] Instr;

//Register
wire [31:0] SrcA;
wire [31:0] RD2_out;


//Immediate Generator
wire [31:0] ImmExt;

//Control Logic
wire Branch, ResultSrc, MemWrite, ALUSrc ;
wire [1:0] ImmSrc, ALUOp;
wire RegWrite;

//ALU
wire [31:0] ALUResult;
wire Zero;

// ALU PCTarget
wire [31:0] PCTarget;

// Data Memory
wire [31:0] ReadData;

//Mux_PC
wire [31:0] PCNext;

//Mux ALU
wire [31:0] SrcB;

//Mux Result
wire [31:0] Result;

// ALU Decoder 
wire [2:0] ALUControl;

//AND gate
wire PCSrc;


// Instantiation of modules are done here

// Program Counter (PC)

PC PC1 (.clk(clk), .reset(reset), .PC_Next(PCNext), .PC(PC));

// PC_Adder 

PC_adder PC_adder(.PC(PC), .PCPlus4(PCPlus4));

//Instruction Memory

Instruction Instruction (.clk(clk), .reset(reset), .A(PC), .RD(Instr));

//Register File

Register Reg(.clk(clk), .reset(reset), .WE3(RegWrite), .A1(Instr[19:15]), .A2(Instr[24:20]), .A3(Instr[11:7]), .WD3(), .RD1(SrcA), .RD2(RD2_out));

//Immediate generator

Immediate_generator Imm_gen (.Instr(Instr[31:7]), .Imm_Src(Imm_Src),.Imm_Ext(Imm_Ext));

// Control Unit

Control_logic CL (.opcode(Instr[6:0]), .RegWrite(RegWrite), .ImmSrc(ImmSrc), .ALUSrc(ALUSrc), .MemWrite(MemWrite), .ResultSrc(ResultSrc), .Branch(Branch), .ALUOp(ALUOp));

//ALU 
ALU ALU (.SrcA(SrcA),.SrcB(),.ALUControl(),.zero(),.ALUResult(ALUResult));

// Data Memory
Datamemory Datamem (.clk(clk), .reset(reset), .A(ALUResult), .WD(RD2_out), .WE(MemWrite), .RD(ReadData));

// ALU PCTarget
ALU_PCTarget ALU_PC_T (.PC(PC), .ImmExt(ImmExt), .PCTarget(PCTarget));

// Mux for Program Counter (Mux PC) 
Mux_PC MuxPC (.PCSrc(PCSrc),.PCPlus4(PCPlus4),.PCTarget(PCTarget),.PCNext(PCNext));

//Mux ALU
Mux_ALU MuxALU ( .ALUSrc(ALUSrc), .ImmExt(ImmExt), .RD2(RD2_out), .SrcB(SrcB));

//Mux Result
Mux_Result MuxResult(.ResultSrc(ResultSrc), .ALUResult(ALUResult), .ReadData(ReadData), .Result(Result));

// ALU Decoder 
ALU_Decoder ALU_decoder (.ALUOp(ALUOP), .opcode5(Instr[5]), .funct3(Instr[14:12]), .funct7(Instr[30]), .ALUControl(ALUControl));

// AND gate
AND_gate And(.branch(Branch), .zero(Zero), .PCSrc(PCSrc));

endmodule