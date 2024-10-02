`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 11:27:23 PM
// Design Name: 
// Module Name: Mux32Bit_4x1
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


module Mux32Bit_4x1(in0, in1, in2, in3, sel, ALUscr, out);

    output reg [31:0] out;
    input [31:0] in0, in1, in2, in3;
    input [1:0] sel;
    input ALUscr; 

    always@(*) begin
        if(sel == 2'b0) begin
            if(ALUscr == 0) begin 
                out <= in0; 
            end
            else begin 
                out <= in3; 
            end
        end
        else if (sel == 2'b01) begin
            out <= in1;
        end
        else if (sel == 2'b10) begin
            out <= in2;
        end
        else begin 
            out <= out; 
        end 
       
        
    end
endmodule
