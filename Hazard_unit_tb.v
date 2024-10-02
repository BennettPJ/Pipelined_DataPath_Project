`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 02:06:24 PM
// Design Name: 
// Module Name: Hazard_unit_tb
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


module Hazard_unit_tb();
    
    reg [31:0] ID_Instruction; 
    reg comp_in;  
    reg [4:0] EX_Rd, MEM_Rd; 
    reg [1:0] EX_regWrite, EX_memRead; 
    reg MEM_regWrite, MEM_memRead;
    reg Clk; 
    wire stall_mux, flush, PCoff, IFID_writeOff;
    
    
    
    Hazard_unit h1(
    .ID_Instruction(ID_Instruction), 
    .comp_in(comp_in), 
    .EX_Rd(EX_Rd), 
    .EX_regWrite(EX_regWrite), 
    .EX_memRead(EX_memRead), 
    .MEM_Rd(MEM_Rd), 
    .MEM_regWrite(MEM_regWrite), 
    .MEM_memRead(MEM_memRead), 
    .stall_mux(stall_mux), 
    .flush(flush), 
    .PCoff(PCoff), 
    .IFID_writeOff(IFID_writeOff));
    
    initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin 
	#100;
	EX_regWrite <= 0;
	MEM_regWrite <= 0;
	EX_memRead <= 0;
	MEM_memRead <= 0;
	comp_in <= 0;
	ID_Instruction <= 0;
	EX_Rd <= 0; 
	MEM_Rd <= 0; 
    #100;
    
    EX_regWrite <= 0;
	MEM_regWrite <= 0;
	EX_memRead <= 0;
	MEM_memRead <= 0;
	comp_in <= 0;
	EX_Rd <= 0; 
	MEM_Rd <= 0; 
	ID_Instruction <= 32'b00100000000001000000000000000000;
	#100;
	
	EX_regWrite <= 0;
	MEM_regWrite <= 0;
	EX_memRead <= 2'd1;
	MEM_memRead <= 0;
	comp_in <= 0;
	EX_Rd <= 0; 
	MEM_Rd <= 0; 
	ID_Instruction <= 32'b00100000000001000000000000000001;
	#100;
	
	EX_regWrite <= 0;
	MEM_regWrite <= 0;
	EX_memRead <= 0;
	MEM_memRead <= 0;
	comp_in <= 0;
	EX_Rd <= 0; 
	MEM_Rd <= 0; 
	ID_Instruction <= 32'b00100000000001000000000000000000;
	#100;
	
	end 
    
    
   
    
endmodule
