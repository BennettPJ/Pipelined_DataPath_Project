`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2023 11:45:45 AM
// Design Name: 
// Module Name: Pipeline_ID_EX
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


module Pipeline_EX_MEM(Clk, Reset, RegWriteSig, MemWriteSig, MemReadSig, MemToRegSig, ALUresult, rdata2, regDstMux,
 RegWriteSig_o, MemWriteSig_o, MemReadSig_o, MemToRegSig_o, ALUresult_o, rdata2_o, regDstMux_o, PC4, PC4_o
 ,MemToReg2Mux, MemToReg2Mux_o);
input Clk, Reset;
input RegWriteSig, MemToRegSig, MemToReg2Mux;
input [31:0] ALUresult, rdata2, PC4;
input [4:0] regDstMux;
input [1:0] MemReadSig, MemWriteSig;
output reg RegWriteSig_o, MemToRegSig_o, MemToReg2Mux_o;
output reg [31:0] ALUresult_o, rdata2_o, PC4_o;
output reg [4:0] regDstMux_o;
output reg [1:0] MemReadSig_o, MemWriteSig_o;

always@(posedge Clk)begin
if(Reset == 1)begin
RegWriteSig_o <= 1'd0;
MemWriteSig_o <= 2'd0;
MemReadSig_o <= 2'd0;
MemToRegSig_o <= 1'd0;
ALUresult_o <= 32'd0;
rdata2_o <= 32'd0;
regDstMux_o <= 5'd0;
PC4_o <= 32'd0;
MemToReg2Mux_o <= 1'd0;
end
else begin
RegWriteSig_o <= RegWriteSig;
MemWriteSig_o <= MemWriteSig;
MemReadSig_o <= MemReadSig;
MemToRegSig_o <= MemToRegSig;
ALUresult_o <= ALUresult;
rdata2_o <= rdata2;
regDstMux_o <= regDstMux;
PC4_o <= PC4 - 4; //FIXME -4 
MemToReg2Mux_o <= MemToReg2Mux;
end
end
endmodule
