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


module Pipeline_IF_ID(Clk, Reset, Instruction, PC, Instruction_output, PC_output, IFID_writeOff, flush);
input Clk, Reset, IFID_writeOff, flush;
input [31:0] Instruction, PC;
output reg [31:0] Instruction_output, PC_output;

reg [31:0] Previous_Instruction_output, Previous_PC_output;

initial begin 
Previous_Instruction_output <= 32'd0;
Previous_PC_output <= 32'd0;
end

always@(posedge Clk, posedge Reset) begin 
if (Reset == 1) begin
    Instruction_output <= 32'd0;
    PC_output <= 32'd0;
    Previous_Instruction_output <= 32'd0;
    Previous_PC_output <= 32'd0;
    end
else if(IFID_writeOff == 1'b1) begin
    Instruction_output <= Previous_Instruction_output;
    PC_output <= Previous_PC_output;
    end
else if(flush == 1'b1) begin
    Instruction_output <= 32'd0;
    PC_output <= PC;
end
else begin 
    Instruction_output <= Instruction;
    PC_output <= PC;
    Previous_Instruction_output <= Instruction;
    Previous_PC_output <= PC;
    end
end
endmodule
