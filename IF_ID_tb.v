`timescale 1ns / 1ps

module IF_ID_tb();
    reg Clk, Reset, IFID_writeOff, flush;
    reg [31:0] Instruction, PC;
    wire [31:0] Instruction_output, PC_output;
    
    Pipeline_IF_ID u0 (
    .Clk(Clk),
    .Reset(Reset), 
    .Instruction(Instruction),
    .PC(PC), 
    .Instruction_output(Instruction_output), 
    .PC_output(PC_output), 
    .IFID_writeOff(IFID_writeOff), 
    .flush(flush)
    );
    
    initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
    initial begin
        Reset <= 1;
        flush <= 0;
        IFID_writeOff <= 0;
        #100;
        Reset <= 0;
        PC <= 0;
        Instruction <= 32'b00001111000011110000111100001111;
        flush <= 0;
        IFID_writeOff <= 0;
        #100;
        Reset <= 0;
        PC <= 4;
        Instruction <= 32'b00001111000011000000111100001111;
        flush <= 1;
        IFID_writeOff <= 0;
        #100;
        Reset <= 0;
        PC <= 8;
        Instruction <= 32'b00001100000011110000111100001111;
        flush <= 0;
        IFID_writeOff <= 0;
        #100;
        Reset <= 0;
        PC <= 12;
        Instruction <= 32'b00000000000000000000000000001111;
        flush <= 0;
        IFID_writeOff <= 1;
        #50;
        Reset <= 0;
        PC <= 12;
        Instruction <= 32'b00000000000000000000000000001111;
        flush <= 0;
        IFID_writeOff <= 0;
        #50;
        Reset <= 0;
        PC <= 16;
        Instruction <= 32'b00000000000000000100000000001111;
        flush <= 0;
        IFID_writeOff <= 0;
        #100;
    end
    
endmodule
