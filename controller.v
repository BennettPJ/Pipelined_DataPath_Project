`timescale 1ns / 1ps
module controller(Instruction, RegWrite, ALUSrc, ALUOp, RegDst, MemWrite, MemRead, MemToReg, Jump, JumpReg, RegDst2, MemToReg2, Rdata1ShiftMux);
input [31:0] Instruction; //This is our input which is the current instruction
output reg [4:0] ALUOp; 
output reg RegWrite, ALUSrc, RegDst, MemToReg, Jump, JumpReg, RegDst2, MemToReg2, Rdata1ShiftMux; //These are all 1 bit outputs
output reg [1:0] MemWrite, MemRead;

always@(Instruction) begin
	case(Instruction[31:26]) //Our case statement constists of the actual MIPS ISA op code. This is what we are checking to execute each case
		6'b000000: begin //R-type instructions
			case(Instruction[5:0]) //function code switch statement
				6'b100000:begin //add
						RegWrite <= 1;
						ALUSrc <= 0;
						RegDst <= 1;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 1;
						Jump <= 0;
						ALUOp <= 5'b00000; 
						JumpReg <= 0; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 0;
					end
				6'b100010:begin //sub
						RegWrite <= 1;
						ALUSrc <= 0;
						RegDst <= 1;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 1;
						Jump <= 0;
						ALUOp <= 5'b00001; 
						JumpReg <= 0; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 0;
					end
				6'b100100: begin //and 
						RegWrite <= 1;
						ALUSrc <= 0;
						RegDst <= 1;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 1;
						Jump <= 0;
						ALUOp <= 5'b01000; 
						JumpReg <= 0; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 0;
					end
				6'b100101: begin   //or 
						RegWrite <= 1;
						ALUSrc <= 0;
						RegDst <= 1;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 1;
						Jump <= 0;
						ALUOp <= 5'b00011; 
						JumpReg <= 0; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 0;
					end
				6'b100111: begin  //nor
						RegWrite <= 1;
						ALUSrc <= 0;
						RegDst <= 1;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 1;
						Jump <= 0;
						ALUOp <= 5'b00100; 
						JumpReg <= 0; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 0;
					end
				6'b100110 :begin  //xor
						RegWrite <= 1;
						ALUSrc <= 0;
						RegDst <= 1;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 1;
						Jump <= 0;
						ALUOp <= 5'b01001; 
						JumpReg <= 0; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 0;
					end
				6'b000000: begin //sll
						RegWrite <= 1;
						ALUSrc <= 0;
						RegDst <= 1;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 1;
						Jump <= 0;
						ALUOp <= 5'b00110;
						JumpReg <= 0; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 1;
					end
				6'b000010: begin  //slr
						RegWrite <= 1;
						ALUSrc <= 0;
						RegDst <= 1;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 1;
						Jump <= 0;
						ALUOp <= 5'b00111;	
						JumpReg <= 0; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 1;
					end
				6'b101010: begin //slt
						RegWrite <= 1;
						ALUSrc <= 0;
						RegDst <= 1;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 1;
						Jump <= 0;
						ALUOp <= 5'b00101;
						JumpReg <= 0; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 0;
					end
				6'b001000: begin //jr
						RegWrite <= 0;
						ALUSrc <= 0;
						RegDst <= 0;
						MemWrite <= 2'b00;
						MemRead <= 2'b00;
						MemToReg <= 0;
						Jump<= 0;
						ALUOp <= 5'b10000;  
						JumpReg <= 1; 
						RegDst2 <= 0;
						MemToReg2 <= 0;
						Rdata1ShiftMux <= 0;
					end //FIXME: maybe an issue
				default: begin
                    RegWrite <= 0;
                    ALUSrc <= 0;
                    RegDst <= 0;
                    MemWrite <= 2'b00;
                    MemRead <= 2'b00;
                    MemToReg <= 0;
                    Jump <= 0;
                    ALUOp <= 5'b10000;
                    JumpReg <= 0; 
                    RegDst2 <= 0;
                    MemToReg2 <= 0;
                    Rdata1ShiftMux <= 0;
				end
			endcase		
			end
			
	   6'b011100:begin //mul
            RegWrite <= 1;
            ALUSrc <= 0;
            RegDst <= 1;
            MemWrite <= 2'b00;
            MemRead <= 2'b00;
            MemToReg <= 1;
            Jump <= 0;
            ALUOp <= 5'b00010; 
            JumpReg <= 0; 
            RegDst2 <= 0;
            MemToReg2 <= 0;
            Rdata1ShiftMux <= 0;
        end
		6'b001000: begin //addi 
				RegWrite <= 1;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b00;
				MemToReg <= 1;
				Jump<= 0;
				ALUOp <= 5'b00000; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b100011: begin //lw
				RegWrite <= 1;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b01;
				MemToReg <= 0;
				Jump <= 0;
				ALUOp <= 5'b00000; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b101011: begin //sw
				RegWrite <= 0;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b01;
				MemRead <= 2'b00;
				MemToReg <= 0;
				Jump <= 0;
				ALUOp <= 5'b00000; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b101000: begin //store byte
				RegWrite <= 0;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b10;
				MemRead <= 2'b00;
				MemToReg <= 0;
				Jump <= 0;
				ALUOp <= 5'b00000; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b100001: begin //load half
				RegWrite <= 1;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b11;
				MemToReg <= 0;
				Jump <= 0;
				ALUOp <= 5'b00000; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b100000: begin //lb is the same as add
				RegWrite <= 1;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b10;
				MemToReg <= 0;
				Jump <= 0;
				ALUOp <= 5'b00000; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b101001: begin //store half
				RegWrite <= 0;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b11;
				MemRead <= 2'b00;
				MemToReg <= 0;
				Jump <= 0;
				ALUOp <= 5'b00000; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b000010: begin //j
				RegWrite <= 0;
				ALUSrc <= 0;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b00;
				MemToReg <= 0;
				Jump <= 1;
				ALUOp <= 5'b00000; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b000011: begin  //jal
				RegWrite <= 1;
				ALUSrc <= 0;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b00;
				MemToReg <= 0;
				Jump <= 1;
				ALUOp <= 5'b10000; 
				JumpReg <= 0; 
				RegDst2 <= 1;
				MemToReg2 <= 1;
				Rdata1ShiftMux <= 0;
			end
		6'b001100: begin  //andi
				RegWrite <= 1;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b00;
				MemToReg <= 1;
				Jump <= 0;
				ALUOp <= 5'b01000; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b001101: begin //ori
				RegWrite <= 1;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b00;
				MemToReg <= 1;
				Jump <= 0;
				ALUOp <= 5'b00011; 
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b001110: begin //xori
				RegWrite <= 1;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b00;
				MemToReg <= 1;
				Jump <= 0;
				ALUOp <= 5'b01001;
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		6'b001010 :begin //slti
				RegWrite <= 1;
				ALUSrc <= 1;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b00;
				MemToReg <= 1;
				Jump <= 0;
				ALUOp <= 5'b00101;
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
			end
		default: begin
		      RegWrite <= 0;
				ALUSrc <= 0;
				RegDst <= 0;
				MemWrite <= 2'b00;
				MemRead <= 2'b00;
				MemToReg <= 0;
				Jump <= 0;
				ALUOp <= 5'b10000;
				JumpReg <= 0; 
				RegDst2 <= 0;
				MemToReg2 <= 0;
				Rdata1ShiftMux <= 0;
		end
	endcase
end
endmodule