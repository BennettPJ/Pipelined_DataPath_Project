`timescale 1ns / 1ps



module PC_Counter_tb();
    reg [31:0] Address;
	reg Reset, Clk, PCoff;

	wire [31:0] PCResult;
	
	ProgramCounter u0(
	.Address(Address), 
	.PCResult(PCResult), 
	.Reset(Reset),
	.Clk(Clk), 
	.PCoff(PCoff)
	);
	
	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	Reset <=1;
	#100;
	Reset <= 0;
	Address <= 0;
	PCoff <= 0;
	#100;
	Reset <= 0;
	Address <= 4;
	PCoff <= 0;
	#100;
	Reset <= 0;
	Address <= 8;
	PCoff <= 1;
	#50;
	Reset <= 0;
	Address <= 8;
	PCoff <= 0;
	#50;
	Reset <= 0;
	Address <= 12;
	PCoff <= 0;
	#100;
	Reset <= 0;
	Address <= 16;
	PCoff <= 0;
	end
	
endmodule
