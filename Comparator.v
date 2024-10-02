`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2023 02:36:13 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator(A, B, instruction, Com_out, yes_branch);
input [31:0] A, B, instruction; 
//A = RS / B = RT
output reg Com_out, yes_branch; 

initial begin
Com_out <= 0;
yes_branch <= 0;
end


always@(*) begin
//If the branch instruction is satisfied throw a high signal
    case(instruction[31:26]) //op code for instruction
        6'b000100: begin // beq
            Com_out <= (A == B) ? 1'b1 : 1'b0;
            yes_branch <= 1;
        end
        6'b000101: begin //bne
            Com_out <= (A != B) ? 1'b1 : 1'b0;
            yes_branch <= 1;
        end
        6'b000111: begin //bgtz
            Com_out <= ($signed(A) > 0) ? 1'b1 : 1'b0;
             yes_branch <= 1;
        end
        6'b000110: begin //blez
            Com_out <= ($signed(A) <= 0) ? 1'b1 : 1'b0;
             yes_branch <= 1;
        end
        6'b001001: begin //ADDIU (We are using the opcode but redefining the instruction) (Combine beq and slt to do branch on greater than or equal)
            Com_out <= ($signed(A) <= $signed(B)) ? 1'b1 : 1'b0;
            yes_branch <= 1;
        end
        6'b000001: begin //bltz & bgez
            case(instruction[20:16]) 
                5'b00000: begin //bltz
                    Com_out <= ($signed(A) < 0) ? 1'b1 : 1'b0;
                     yes_branch <= 1;
                end
                default begin //bgez
                    Com_out <= ($signed(A) >= 0) ? 1'b1 : 1'b0;
                    yes_branch <= 1;
                end
            endcase
        end
        default: begin
            Com_out <= 0;
            yes_branch <= 0;
        end
    endcase
end
endmodule