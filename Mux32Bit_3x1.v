`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////
// Bennett Jackson (33.3%) , Chris Karceski (33.3%) , Ruben Galdean (33.3%)
///////////////////////////////////////////////////////////////////////////

module Mux32Bit_3x1(in0, in1, in2, sel, out);

    output reg [31:0] out;
    input [31:0] in0, in1, in2;
    input [1:0] sel;

    always@(*) begin
        out <= 0; 
        if(sel == 2'b00) begin
            out <= in0;
            end
        else if (sel == 2'b01) begin
            out <= in1;
        end
        else if (sel == 2'b10) begin
            out <= in2;
        end
        else begin 
        out <= 0; 
        end
        
    end
endmodule
