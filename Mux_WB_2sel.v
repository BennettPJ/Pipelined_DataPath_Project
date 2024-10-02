`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 06:01:48 PM
// Design Name: 
// Module Name: Mux_WB_2sel
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


module Mux_WB_2sel(out, inA, inB,inC, sel_1, sel_2);
input [31:0] inA, inB, inC; 
input sel_1, sel_2; 
output reg [31:0] out; 

always@(*) begin 
out <= 0; 
if(sel_2 == 1) begin 
    out <= inC; //1 on the second mux 
end
else if (sel_1 == 1)begin 
    out <= inB; //1 on the first mux 
end
else begin 
out <= inA; //0 first mux 
end 
end


endmodule