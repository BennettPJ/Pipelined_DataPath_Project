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


module Pipeline_MEM_WB(Clk, Reset, RegWriteSig, MemToRegSig, DmemRdata, EX_MEM_output_ALUResult, EX_MEM_output_regDstMux,
RegWriteSig_o, MemToRegSig_o, DmemRdata_o, EX_MEM_output_ALUResult_o, EX_MEM_output_regDstMux_o, PC4WB, PC4WB_o, MemToReg2, MemToReg2_o);
input Clk, Reset;
input RegWriteSig, MemToRegSig, MemToReg2;
input [4:0] EX_MEM_output_regDstMux;
input [31:0] DmemRdata, EX_MEM_output_ALUResult, PC4WB;
output reg RegWriteSig_o, MemToRegSig_o, MemToReg2_o;
output reg [4:0] EX_MEM_output_regDstMux_o;
output reg [31:0] DmemRdata_o, EX_MEM_output_ALUResult_o, PC4WB_o;


always@(posedge Clk)begin
if (Reset == 1)begin
RegWriteSig_o <= 1'd0;
MemToRegSig_o <= 1'd0;
DmemRdata_o <= 32'd0;
EX_MEM_output_ALUResult_o <= 32'd0;
EX_MEM_output_regDstMux_o <= 5'd0;
PC4WB_o <= 32'd0;
MemToReg2_o <= 1'd0;
end
else begin 
RegWriteSig_o <= RegWriteSig;
MemToRegSig_o <= MemToRegSig;
DmemRdata_o <= DmemRdata;
EX_MEM_output_ALUResult_o <= EX_MEM_output_ALUResult;
EX_MEM_output_regDstMux_o <= EX_MEM_output_regDstMux;
PC4WB_o <= PC4WB;
MemToReg2_o <= MemToReg2;
end
end
endmodule
