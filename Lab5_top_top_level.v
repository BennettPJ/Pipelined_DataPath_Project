`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group-members: Bennett Jackson (33.3%), Chris Karceski (33.3%), Ruben Galdean (33.3%)
//////////////////////////////////////////////////////////////////////////////////



module Lab5_top_top_level(Clk, Reset, en_out, out7);
input Clk, Reset;
output [7:0] en_out;
output [6:0] out7;
wire [31:0] PC, WriteBack, xcoord_wire, ycoord_wire, curr_min_sad;
wire clk1; 

//ClkDiv u0(.Clk(Clk), .Rst(1'b0), .ClkOut(clk1)); 
top_level u1(.Clk(Clk), .Rst(Reset), .PCwire(PC), .WB2Out(WriteBack), .v0_wire(xcoord_wire), .v1_wire(ycoord_wire), .curr_min_SAD_wire(curr_min_sad));
Two4DigitDisplay u2(.Clk(Clk), .NumberA(ycoord_wire[15:0]), .NumberB(xcoord_wire[15:0]), .out7(out7), .en_out(en_out));

endmodule