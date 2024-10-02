`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group-members: Bennett Jackson (33.3%), Chris Karceski (33.3%), Ruben Galdean (33.3%)
//////////////////////////////////////////////////////////////////////////////////


module Hazard_unit(Reset, ID_Instruction, comp_in, EX_Rd, EX_regWrite, EX_memRead, MEM_Rd, MEM_regWrite, MEM_memRead, stall_mux, flush, PCoff, IFID_writeOff, branch_instruction);
input [4:0] EX_Rd, MEM_Rd; 
input [1:0] EX_memRead, MEM_memRead; 
input [31:0] ID_Instruction;
input EX_regWrite, MEM_regWrite, comp_in, branch_instruction, Reset;
output reg stall_mux, flush, PCoff, IFID_writeOff;
 
 //ID_Instruction[25:21] is the RS register
 //ID_Instruction[20:16] is the RT register

initial begin
 stall_mux <= 1'b0;
 flush <= 1'b0; 
 PCoff <= 1'b0; 
 IFID_writeOff <= 1'b0;
end
//Set to high if we want to stall or flush

always@(*)begin 
if(Reset == 1'b1) begin 
     stall_mux <= 1'b0;
     flush <= 1'b0; 
     PCoff <= 1'b0; 
     IFID_writeOff <= 1'b0;
end 
else begin 
if(EX_memRead != 2'b0 && (ID_Instruction[25:21] == EX_Rd || ID_Instruction[20:16] == EX_Rd)) begin
    PCoff <= 1'b1;
    IFID_writeOff <= 1'b1; 
    stall_mux <= 1'b1;
    flush <= 1'b0;
end
//else if(MEM_memRead != 2'b0 && (ID_Instruction[25:21] == MEM_Rd || ID_Instruction[20:16] == MEM_Rd)) begin
//    PCoff <= 1'b1;
//    IFID_writeOff <= 1'b1; 
//    stall_mux <= 1'b1;
//    flush <= 1'b0;
//end
//else if (EX_regWrite == 1'b1 && EX_Rd != 5'd0 && (ID_Instruction[25:21] == EX_Rd || ID_Instruction[20:16] == EX_Rd)) begin 
//    PCoff <= 1'b1;
//    IFID_writeOff <= 1'b1; 
//    stall_mux <= 1'b1;
//    flush <= 1'b0;
//end
//else if (MEM_regWrite == 1'b1 && MEM_Rd != 5'd0 && (ID_Instruction[25:21] == MEM_Rd || ID_Instruction[20:16] == MEM_Rd)) begin 
//    PCoff <= 1'b1;
//    IFID_writeOff <= 1'b1; 
//    stall_mux <= 1'b1;
//    flush <= 1'b0;
//end

else if(EX_regWrite == 1'b1 && branch_instruction == 1'b1 && (ID_Instruction[25:21] == EX_Rd || ID_Instruction[20:16] == EX_Rd)) begin //R-type in EX, Branch in ID
    PCoff <= 1'b1;
    IFID_writeOff <= 1'b1; 
    stall_mux <= 1'b1;
    flush <= 1'b0;
end
else if(MEM_regWrite == 1'b1 && branch_instruction == 1'b1 && (ID_Instruction[25:21] == MEM_Rd || ID_Instruction[20:16] == MEM_Rd)) begin //R-type in MEM, Branch in ID
    PCoff <= 1'b1;
    IFID_writeOff <= 1'b1; 
    stall_mux <= 1'b1;
    flush <= 1'b0;
end
else if(EX_memRead != 2'b0 && branch_instruction == 1'b1 && (ID_Instruction[25:21] == EX_Rd || ID_Instruction[20:16] == EX_Rd)) begin //LW in EX, Branch in ID
    PCoff <= 1'b1;
    IFID_writeOff <= 1'b1; 
    stall_mux <= 1'b1;
    flush <= 1'b0;
end
else if(MEM_memRead != 2'b0 && branch_instruction == 1'b1 && (ID_Instruction[25:21] == MEM_Rd || ID_Instruction[20:16] == MEM_Rd)) begin //LW in MEM, Branch in ID
    PCoff <= 1'b1;
    IFID_writeOff <= 1'b1; 
    stall_mux <= 1'b1;
    flush <= 1'b0;
end
else if((ID_Instruction[31:26] == 6'b000000 && ID_Instruction[5:0] == 6'b001000) || (ID_Instruction[31:26] == 6'b000010) || (ID_Instruction[31:26] == 6'b000011)) begin //Check if its a jump instruction
    PCoff <= 1'b0;
    IFID_writeOff <= 1'b0;
    stall_mux <= 1'b0;
    flush <= 1'b1;
end
else if (comp_in == 1'b1) begin
    PCoff <= 1'b0;
    IFID_writeOff <= 1'b0;
    stall_mux <= 1'b0;
    flush <= 1'b1;
end
else begin //our default case where there is no dependency so keep the pipeline going
    PCoff <= 1'b0;
    IFID_writeOff <= 1'b0;
    stall_mux <= 1'b0;
    flush <= 1'b0; 
end //end else
end 
end
endmodule