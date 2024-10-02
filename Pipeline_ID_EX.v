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


module Pipeline_ID_EX(Clk, Reset, ALUOpSig, RegWriteSig, ALUSrcSig, MemWriteSig, MemReadSig, MemToRegSig, Rdata1, Rdata2, Inst15_0, 
ALUOpSig_o, RegWriteSig_o, ALUSrcSig_o, MemWriteSig_o, MemReadSig_o, MemToRegSig_o, Rdata1_o, Rdata2_o, Inst15_0_o, PC_carry, PC_carry_out ,
 MemToReg2Mux, MemToReg2Mux_o, RD, RD_o, ex_rs, ex_rs_o, ex_rt, ex_rt_o);
input Clk, Reset;
input [4:0] ALUOpSig;
input [4:0] RD, ex_rs, ex_rt;
input [31:0] Rdata1, Rdata2;
input RegWriteSig, ALUSrcSig, MemToRegSig, MemToReg2Mux;
input [31:0] Inst15_0, PC_carry;
input [1:0] MemWriteSig, MemReadSig;
output reg [4:0] RD_o, ex_rs_o, ex_rt_o;
output reg [4:0] ALUOpSig_o; 
output reg [31:0] Rdata1_o, Rdata2_o;
output reg RegWriteSig_o, ALUSrcSig_o, MemToRegSig_o, MemToReg2Mux_o;
output reg [31:0] Inst15_0_o, PC_carry_out;
output reg [1:0] MemWriteSig_o, MemReadSig_o;


always@(posedge Clk)begin
if (Reset == 1) begin
ALUOpSig_o <= 5'd0;
RegWriteSig_o <= 1'd0;
ALUSrcSig_o <= 1'd0;
MemWriteSig_o <= 2'd0;
MemReadSig_o <= 2'd0;
MemToRegSig_o <= 1'd0;
 Rdata1_o <= 32'd0;
 Rdata2_o <= 32'd0;
 Inst15_0_o <= 32'd0;
 PC_carry_out <= 32'd0;
 RD_o <= 1'd0;
 MemToReg2Mux_o <= 1'd0;
 ex_rs_o <= 5'b0;
 ex_rt_o <= 5'b0;
end
else begin
ALUOpSig_o <= ALUOpSig;
RegWriteSig_o <= RegWriteSig;
ALUSrcSig_o <= ALUSrcSig;
MemWriteSig_o <= MemWriteSig;
MemReadSig_o <= MemReadSig;
MemToRegSig_o <= MemToRegSig;
 Rdata1_o <= Rdata1;
 Rdata2_o <= Rdata2;
 Inst15_0_o <= Inst15_0;
 PC_carry_out <= PC_carry;
 RD_o <= RD;
 MemToReg2Mux_o <= MemToReg2Mux;
 ex_rs_o <= ex_rs;
 ex_rt_o <= ex_rt;
 end
end
endmodule
