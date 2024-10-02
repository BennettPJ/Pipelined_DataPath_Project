`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group-members: Bennett Jackson (33.3%), Chris Karceski (33.3%), Ruben Galdean (33.3%)
//////////////////////////////////////////////////////////////////////////////////

///not the actuall one need to change everything 
   module top_level(Clk, Rst, PCwire, WB2Out, v0_wire, v1_wire, curr_min_SAD_wire);
    input Clk, Rst;
    //Wires
    (* mark_debug = "true" *) wire [31:0] ALUSrcToALU;
    (* mark_debug = "true" *) wire [31:0] instruction;
    (* mark_debug = "true" *) wire [31:0] PCSrcToPC, JumpToPC, JRPC;
    output wire [31:0] WB2Out, PCwire, v0_wire, v1_wire, curr_min_SAD_wire;
    (* mark_debug = "true" *) wire [31:0] PCAddwire;
    (* mark_debug = "true" *) wire [31:0] Rdata1Wire, Rdata2Wire, rData1ToShiftMux;
    (* mark_debug = "true" *) wire [31:0] signExt_out;
    (* mark_debug = "true" *) wire [31:0] sll_output;
    (* mark_debug = "true" *) wire [31:0] EX_adder_out;
    (* mark_debug = "true" *) wire [4:0] EX_regdst_mux_out, temp_reg_wire;
    (* mark_debug = "true" *) wire zero_Flag;
    (* mark_debug = "true" *) wire [31:0] ALUResultWire;
    (* mark_debug = "true" *) wire [31:0] DM_read_data;
    (* mark_debug = "true" *) wire [31:0] mem_to_reg_mux_out;
    (* mark_debug = "true" *) wire comparator_output;
    (* mark_debug = "true" *) wire [31:0] jumpTargetAddress_out, shiftInstructionOut;
    
    //pipeline reg output wires
    (* mark_debug = "true" *) wire [31:0] IFID_Iout, IFID_PCout;
    (* mark_debug = "true" *) wire [31:0] IDEX_rdata1, IDEX_rdata2;
    (* mark_debug = "true" *) wire [15:0] IDEX_inst15_0;
    (* mark_debug = "true" *) wire [4:0] IDEX_inst20_16, IDEX_instr_15_11; 
    (* mark_debug = "true" *) wire [31:0] IDEX_PCout;
    (* mark_debug = "true" *) wire EXMEM_zero_out;
    (* mark_debug = "true" *) wire [31:0] EXMEM_ALUResult_out, EXMEM_adder_out, EXMEM_rdata2_out;
    (* mark_debug = "true" *) wire [4:0] EXMEM_RegDst_out;
    (* mark_debug = "true" *) wire [31:0] MEMWB_rdata_out, MEMWB_ALU_result;
    (* mark_debug = "true" *) wire [4:0] MEMWB_RegDst_out;
    (* mark_debug = "true" *) wire [31:0] IDEX_signExt_15_0_out;
    
    //Wire control signals
    (* mark_debug = "true" *) wire jumpRegSig, shiftMuxSig, MemToReg2Wire;
    (* mark_debug = "true" *) wire RegDst2wire, IDEX_regDst2_out;
    (* mark_debug = "true" *) wire MemToReg2, IDEX_MemToReg2;
    (* mark_debug = "true" *) wire [4:0] IDIF_ALUOpSig_wire;
    (* mark_debug = "true" *) wire IDIF_RegWriteSig_wire, IDIF_ALUSrcSig_wire, IDIF_RegDstSig_wire, IDIF_BranchSig_wire, IDIF_MemToRegSig_wire, IDIF_JumpSig_wire;
    (* mark_debug = "true" *) wire [1:0] IDIF_MemWriteSig_wire, IDIF_MemReadSig_wire, IDIF_MemWriteSig_wire_o, IDIF_MemReadSig_wire_o, EXMEM_MemWriteSig_wire_o, EXMEM_MemReadSig_wire_o;
    (* mark_debug = "true" *) wire [4:0] IDIF_ALUOpSig_wire_o;
    (* mark_debug = "true" *) wire IDIF_RegWriteSig_wire_o, IDIF_ALUSrcSig_wire_o, IDIF_RegDstSig_wire_o, IDIF_BranchSig_wire_o, IDIF_MemToRegSig_wire_o;
    (* mark_debug = "true" *) wire EXMEM_RegWriteSig_wire_o, EXMEM_BranchSig_wire_o, EXMEM_MemToRegSig_wire_o, EXMEM_JumpSig_wire_o;
    (* mark_debug = "true" *) wire MEMWB_RegWriteSig_wire_o, MEMWB_MemToRegSig_wire_o;
    (* mark_debug = "true" *) wire [25:0] IDEX_jumpAddress_out, EXMEM_jumpAddress_out;
    (* mark_debug = "true" *) wire [31:0] EXMEM_PC4_out, MEMWB_PC4_out;
    (* mark_debug = "true" *) wire IDEX_regDst2wire_out, IDEX_MemToReg2_mux_wire;
    (* mark_debug = "true" *) wire EXMEM_MemToReg2_mux_wire;
    (* mark_debug = "true" *) wire MEMWB_MemToReg2_mux_wire;
    (* mark_debug = "true" *) wire [31:0] Calc_branch;
    (* mark_debug = "true" *) wire [4:0] RD_wire;
    (* mark_debug = "true" *) wire stall_mux_wire, flush_wire, PCoff_wire, IFID_writeOff_wire;
    (* mark_debug = "true" *) wire [4:0] ALUop_wire_stall;
    (* mark_debug = "true" *) wire regWrite_wire_stall, ALUSrc_wire_stall, regdst_wire_stall, memToReg_wire_stall, jump_wire_stall, JumpReg_wire_stall, regdst2_wire_stall, memToReg2_wire_stall, Rdata1Shift_wire_stall;
    (* mark_debug = "true" *) wire [1:0] memWrite_wire_stall, memRead_wire_stall;
    (* mark_debug = "true" *) wire yes_branch_wire;
    (* mark_debug = "true" *) wire [1:0] A_wire, B_wire;
    (* mark_debug = "true" *) wire [4:0] ex_rs_wire, ex_rt_wire;
    (* mark_debug = "true" *) wire [31:0] FA_wire, FB_wire;

     
    Mux32Bit2To1 PCMux(
        .out(PCSrcToPC), 
        .inA(PCAddwire), 
        .inB(Calc_branch), 
        .sel(comparator_output)); 
    Mux32Bit2To1 JumpMux(
        .out(JumpToPC), 
        .inA(PCSrcToPC), 
        .inB(jumpTargetAddress_out), 
        .sel(jump_wire_stall));  
    Mux32Bit2To1 JRMux(
        .out(JRPC), 
        .inA(JumpToPC), 
        .inB(rData1ToShiftMux), 
        .sel(JumpReg_wire_stall)); 
         
    ProgramCounter PC1(
        .Address(JRPC), 
        .PCResult(PCwire), 
        .Reset(Rst), 
        .Clk(Clk),
        .PCoff(PCoff_wire)); 
    InstructionMemory u1(
        .Address(PCwire), 
        .Instruction(instruction));
    PCAdder PCA1(
        .PCResult(PCwire), 
        .PCAddResult(PCAddwire));
        
        
    Pipeline_IF_ID IFID1(
        .Clk(Clk),
        .Reset(Rst), 
        .Instruction(instruction),
        .PC(PCAddwire), 
        .Instruction_output(IFID_Iout), 
        .PC_output(IFID_PCout),
        .IFID_writeOff(IFID_writeOff_wire), 
        .flush(flush_wire)); 
        
   Hazard_unit H1(
   .Reset(Rst),
   .ID_Instruction(IFID_Iout), 
   .comp_in(comparator_output), 
   .EX_Rd(EX_regdst_mux_out), 
   .EX_regWrite(IDIF_RegWriteSig_wire_o), 
   .EX_memRead(IDIF_MemReadSig_wire_o), 
   .MEM_Rd(EXMEM_RegDst_out), 
   .MEM_regWrite(EXMEM_RegWriteSig_wire_o), 
   .MEM_memRead(EXMEM_MemReadSig_wire_o), 
   .stall_mux(stall_mux_wire), 
   .flush(flush_wire), 
   .PCoff(PCoff_wire), 
   .IFID_writeOff(IFID_writeOff_wire),
   .branch_instruction(yes_branch_wire));
                
     ShiftLeft2 sll2(
       .A(IFID_Iout[15:0]), 
       .Result(sll_output)); 
     Adder a1(
       .A(IFID_PCout), 
       .B(sll_output), 
       .Result(Calc_branch));


    JumpTarget Jtarg(
        .jumpAddress(IFID_Iout[25:0]), 
        .targetAddress(jumpTargetAddress_out)); 
    RegisterFile regFile(
        .ReadRegister1(IFID_Iout[25:21]), 
        .ReadRegister2(IFID_Iout[20:16]), 
        .WriteRegister(MEMWB_RegDst_out), 
        .WriteData(WB2Out), 
        .RegWrite(MEMWB_RegWriteSig_wire_o), 
        .Clk(Clk), 
        .ReadData1(rData1ToShiftMux),
        .ReadData2(Rdata2Wire),
        .v0(v0_wire), 
        .v1(v1_wire),
        .current_min_SAD(curr_min_SAD_wire));

    Comparator c1(
        .A(rData1ToShiftMux), 
        .B(Rdata2Wire), 
        .instruction(IFID_Iout), 
        .Com_out(comparator_output),
        .yes_branch(yes_branch_wire)); 
    
     
    SignExtension sign1(
        .in(IFID_Iout[15:0]), 
        .out(signExt_out)); 
     SignExtend_shift_instructions shiftExt(
     .in(IFID_Iout[10:6]), 
     .out(shiftInstructionOut));
     Mux32Bit2To1 ShiftMux(
          .out(Rdata1Wire), 
          .inA(rData1ToShiftMux), 
          .inB(shiftInstructionOut), 
          .sel(Rdata1Shift_wire_stall)); 
    controller control(
        .Instruction(IFID_Iout), 
        .RegWrite(IDIF_RegWriteSig_wire), 
        .ALUSrc(IDIF_ALUSrcSig_wire), 
        .ALUOp(IDIF_ALUOpSig_wire), 
        .RegDst(IDIF_RegDstSig_wire), 
        .MemWrite(IDIF_MemWriteSig_wire), 
        .MemRead(IDIF_MemReadSig_wire), 
        .MemToReg(IDIF_MemToRegSig_wire), 
        .Jump(IDIF_JumpSig_wire), 
        .JumpReg(jumpRegSig), 
        .RegDst2(RegDst2wire), 
        .MemToReg2(MemToReg2Wire),
        .Rdata1ShiftMux(shiftMuxSig));
        
    stallMux stall(
        .stall(stall_mux_wire), 
        .ALUOp(IDIF_ALUOpSig_wire), 
        .RegWrite(IDIF_RegWriteSig_wire), 
        .ALUSrc(IDIF_ALUSrcSig_wire), 
        .RegDst(IDIF_RegDstSig_wire), 
        .MemToReg(IDIF_MemToRegSig_wire), 
        .Jump(IDIF_JumpSig_wire), 
        .JumpReg(jumpRegSig), 
        .RegDst2(RegDst2wire), 
        .MemToReg2(MemToReg2Wire), 
        .Rdata1ShiftMux(shiftMuxSig), 
        .MemWrite(IDIF_MemWriteSig_wire), 
        .MemRead(IDIF_MemReadSig_wire),
        .ALUOp_o(ALUop_wire_stall), 
        .RegWrite_o(regWrite_wire_stall), 
        .ALUSrc_o(ALUSrc_wire_stall), 
        .RegDst_o(regdst_wire_stall), 
        .MemToReg_o(memToReg_wire_stall), 
        .Jump_o(jump_wire_stall), 
        .JumpReg_o(JumpReg_wire_stall), 
        .RegDst2_o(regdst2_wire_stall), 
        .MemToReg2_o(memToReg2_wire_stall), 
        .Rdata1ShiftMux_o(Rdata1Shift_wire_stall), 
        .MemWrite_o(memWrite_wire_stall), 
        .MemRead_o(memRead_wire_stall));
        
//    Mux5Bit2to1 RegDstMux(
//       .out(temp_reg_wire), 
//       .inA(IFID_Iout[20:16]), 
//       .inB(IFID_Iout[15:11]), 
//       .sel(regdst_wire_stall)); 
//    Mux5Bit2to1 RegDstMux2(
//       .out(RD_wire), 
//       .inA(temp_reg_wire), 
//       .inB(5'b11111), 
//       .sel(regdst2_wire_stall)); 
       //5'b11111 is 31 which is ra register address
        Mux2sel_3x1 MuxRegDst(
       .out(RD_wire), 
       .inA(IFID_Iout[20:16]), 
       .inB(IFID_Iout[15:11]),
       .inC(5'b11111), 
       .sel_1(regdst_wire_stall), 
       .sel_2(regdst2_wire_stall));
  
  
    Pipeline_ID_EX IDEX1(
        .Clk(Clk), 
        .Reset(Rst),
        .ALUOpSig(ALUop_wire_stall), 
        .RegWriteSig(regWrite_wire_stall), 
        .ALUSrcSig(ALUSrc_wire_stall), 
        .MemWriteSig(memWrite_wire_stall), 
        .MemReadSig(memRead_wire_stall), 
        .MemToRegSig(memToReg_wire_stall), 
        .Rdata1(Rdata1Wire), 
        .Rdata2(Rdata2Wire), 
        .Inst15_0(signExt_out), 
        .ALUOpSig_o(IDIF_ALUOpSig_wire_o), 
        .RegWriteSig_o(IDIF_RegWriteSig_wire_o), 
        .ALUSrcSig_o(IDIF_ALUSrcSig_wire_o), 
        .MemWriteSig_o(IDIF_MemWriteSig_wire_o), 
        .MemReadSig_o(IDIF_MemReadSig_wire_o), 
        .MemToRegSig_o(IDIF_MemToRegSig_wire_o), 
        .Rdata1_o(IDEX_rdata1), 
        .Rdata2_o(IDEX_rdata2), 
        .Inst15_0_o(IDEX_signExt_15_0_out),
         .PC_carry(IFID_PCout), 
         .PC_carry_out(IDEX_PCout), 
         .MemToReg2Mux(memToReg2_wire_stall), 
         .MemToReg2Mux_o(IDEX_MemToReg2_mux_wire),
         .RD(RD_wire),
         .RD_o(EX_regdst_mux_out), 
         .ex_rs(IFID_Iout[25:21]), 
         .ex_rs_o(ex_rs_wire), 
         .ex_rt(IFID_Iout[20:16]), 
         .ex_rt_o(ex_rt_wire));
         
         
   Forward_unit F1(
        .Reset(Rst), 
        .EX_rs(ex_rs_wire), 
        .EX_rt(ex_rt_wire), 
        .MEM_rd(EXMEM_RegDst_out), 
        .WB_rd(MEMWB_RegDst_out), 
        .MEM_RegWrite(EXMEM_RegWriteSig_wire_o), 
        .WB_RegWrite(MEMWB_RegWriteSig_wire_o), 
        .A(A_wire), 
        .B(B_wire));
        
   Mux32Bit_3x1 M3x1A( 
        .in0(IDEX_rdata1), 
        .in1(EXMEM_ALUResult_out), 
        .in2(WB2Out), 
        .sel(A_wire), 
        .out(FA_wire));
        
        
   Mux32Bit_3x1 M3x1B( 
        .in0(IDEX_rdata2), 
        .in1(EXMEM_ALUResult_out), 
        .in2(WB2Out), 
        .sel(B_wire), 
        .out(FB_wire));
     
    Mux32Bit2To1 ALUSrcMux(
        .out(ALUSrcToALU), 
        .inA(FB_wire), 
        .inB(IDEX_signExt_15_0_out), 
        .sel(IDIF_ALUSrcSig_wire_o)); 
    ALU32Bit ALU1(
        .ALUControl(IDIF_ALUOpSig_wire_o), 
        .A(FA_wire),
        .B(ALUSrcToALU), 
        .ALUResult(ALUResultWire));
   
   
    Pipeline_EX_MEM EXMEM1(
        .Clk(Clk), 
        .Reset(Rst),
        .RegWriteSig(IDIF_RegWriteSig_wire_o), 
        .MemWriteSig(IDIF_MemWriteSig_wire_o), 
        .MemReadSig(IDIF_MemReadSig_wire_o), 
        .MemToRegSig(IDIF_MemToRegSig_wire_o), 
        .ALUresult(ALUResultWire), 
        .rdata2(IDEX_rdata2), 
        .regDstMux(EX_regdst_mux_out), 
        .RegWriteSig_o(EXMEM_RegWriteSig_wire_o), 
        .MemWriteSig_o(EXMEM_MemWriteSig_wire_o), 
        .MemReadSig_o(EXMEM_MemReadSig_wire_o), 
        .MemToRegSig_o(EXMEM_MemToRegSig_wire_o), 
        .ALUresult_o(EXMEM_ALUResult_out), 
        .rdata2_o(EXMEM_rdata2_out), 
        .regDstMux_o(EXMEM_RegDst_out), 
        .PC4(IDEX_PCout), 
        .PC4_o(EXMEM_PC4_out),
        .MemToReg2Mux(IDEX_MemToReg2_mux_wire), 
        .MemToReg2Mux_o(EXMEM_MemToReg2_mux_wire));
    
    
    DataMemory DM(
        .Address(EXMEM_ALUResult_out), 
        .WriteData(EXMEM_rdata2_out), 
        .Clk(Clk), 
        .MemWrite(EXMEM_MemWriteSig_wire_o), 
        .MemRead(EXMEM_MemReadSig_wire_o), 
        .ReadData(DM_read_data)); 
     
    Pipeline_MEM_WB MEMWB1(
        .Clk(Clk), 
        .Reset(Rst),
        .RegWriteSig(EXMEM_RegWriteSig_wire_o), 
        .MemToRegSig(EXMEM_MemToRegSig_wire_o), 
        .DmemRdata(DM_read_data), 
        .EX_MEM_output_ALUResult(EXMEM_ALUResult_out), 
        .EX_MEM_output_regDstMux(EXMEM_RegDst_out), 
        .RegWriteSig_o(MEMWB_RegWriteSig_wire_o), 
        .MemToRegSig_o(MEMWB_MemToRegSig_wire_o), 
        .DmemRdata_o(MEMWB_rdata_out), 
        .EX_MEM_output_ALUResult_o(MEMWB_ALU_result), 
        .EX_MEM_output_regDstMux_o(MEMWB_RegDst_out), 
        .PC4WB(EXMEM_PC4_out), 
        .PC4WB_o(MEMWB_PC4_out), 
        .MemToReg2(EXMEM_MemToReg2_mux_wire), 
        .MemToReg2_o(MEMWB_MemToReg2_mux_wire));
    
    
//    Mux32Bit2To1 WBMux(
//        .out(mem_to_reg_mux_out), 
//        .inA(MEMWB_rdata_out), 
//        .inB(MEMWB_ALU_result), 
//        .sel(MEMWB_MemToRegSig_wire_o));
//    Mux32Bit2To1 WBMux2(
//        .out(WB2Out), 
//        .inA(mem_to_reg_mux_out), 
//        .inB(MEMWB_PC4_out), 
//        .sel(MEMWB_MemToReg2_mux_wire)); 
        
    Mux_WB_2sel MuxWB(
        .out(WB2Out), 
        .inA(MEMWB_rdata_out), 
        .inB(MEMWB_ALU_result),
        .inC(EXMEM_PC4_out), 
        .sel_1(MEMWB_MemToRegSig_wire_o), 
        .sel_2(MEMWB_MemToReg2_mux_wire));
endmodule 
