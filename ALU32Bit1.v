`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult);

	input [4:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs

	output reg [31:0] ALUResult;	// answer

    /* Please fill in the implementation here... */

    always @(ALUControl, A, B) begin
    	case(ALUControl)
	    	5'b00000: begin //addition
	  			ALUResult <= A + B;
	    	    end
	    	5'b00001: begin // Subtract
	    		ALUResult <= A - B;
	    		end
	    	5'b00010: begin // Multiply
	    		ALUResult <= A * B;
	    		end	
	    	5'b00011: begin // or operation
	    		ALUResult <= A | B;
	    		end
	    	5'b00100: begin // NOT or
	    		ALUResult <= ~(A | B);
	    		end	
	    	5'b00101: begin // Set on less than
	    		ALUResult <= ($signed(A) < $signed(B)) ? 32'b01 : 32'b00; //Conditional statement (if true execute the statement before the colon else the one after) //FIXME: maybe an issue
	    		end
	    	5'b00110: begin // shift logical left
	    		ALUResult <= B << A;
	    		end
	    	5'b00111: begin // shift logical right 
	    		ALUResult <= B >> A;
	    		end
	    	5'b01000: begin // and operation
	    		ALUResult <= A & B;
	    		end
	    	5'b01001: begin // exclusive or
	    		ALUResult <= A ^ B;
	    		end	
            default: begin 
              ALUResult <= 0;
             end    
    	endcase  	
  	end
  	
endmodule

