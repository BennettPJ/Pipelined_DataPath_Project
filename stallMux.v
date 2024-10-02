`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group-members: Bennett Jackson (33.3%), Chris Karceski (33.3%), Ruben Galdean (33.3%)
//////////////////////////////////////////////////////////////////////////////////


module stallMux(stall, ALUOp, RegWrite, ALUSrc, RegDst, MemToReg, Jump, JumpReg, RegDst2, MemToReg2, Rdata1ShiftMux, MemWrite, MemRead,
ALUOp_o, RegWrite_o, ALUSrc_o, RegDst_o, MemToReg_o, Jump_o, JumpReg_o, RegDst2_o, MemToReg2_o, Rdata1ShiftMux_o, MemWrite_o, MemRead_o);
input [4:0] ALUOp; 
input RegWrite, ALUSrc, RegDst, MemToReg, Jump, JumpReg, RegDst2, MemToReg2, Rdata1ShiftMux, stall; //These are all 1 bit 
input [1:0] MemWrite, MemRead;
output reg [4:0] ALUOp_o; 
output reg RegWrite_o, ALUSrc_o, RegDst_o, MemToReg_o, Jump_o, JumpReg_o, RegDst2_o, MemToReg2_o, Rdata1ShiftMux_o; //These are all 1 bit 
output reg [1:0] MemWrite_o, MemRead_o;

initial begin
ALUOp_o <= 5'b10000;
RegWrite_o <= 1'b0;
ALUSrc_o <= 1'b0;
RegDst_o <= 1'b0;
MemToReg_o <= 1'b0;
 Jump_o <= 1'b0; 
JumpReg_o <= 1'b0;
RegDst2_o <= 1'b0;
MemToReg2_o <= 1'b0;
Rdata1ShiftMux_o <= 1'b0;
MemWrite_o <= 2'b0;
MemRead_o <= 2'b0;
end

always@(*)begin
if(stall == 1'b1) begin
ALUOp_o <= 5'b10000;
RegWrite_o <= 1'b0;
ALUSrc_o <= 1'b0;
RegDst_o <= 1'b0;
MemToReg_o <= 1'b0;
 Jump_o <= 1'b0; 
JumpReg_o <= 1'b0;
RegDst2_o <= 1'b0;
MemToReg2_o <= 1'b0;
Rdata1ShiftMux_o <= 1'b0;
MemWrite_o <= 2'b0;
MemRead_o <= 2'b0;
end
else begin 
ALUOp_o <= ALUOp;
RegWrite_o <= RegWrite;
ALUSrc_o <= ALUSrc;
RegDst_o <= RegDst;
MemToReg_o <= MemToReg;
Jump_o <= Jump; 
JumpReg_o <= JumpReg;
RegDst2_o <= RegDst2;
MemToReg2_o <= MemToReg2;
Rdata1ShiftMux_o <= Rdata1ShiftMux;
MemWrite_o <= MemWrite;
MemRead_o <= MemRead;
end
end
endmodule
