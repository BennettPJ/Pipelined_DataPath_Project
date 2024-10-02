`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2023 08:24:38 PM
// Design Name: 
// Module Name: SignExtend_shift_instructions
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


module SignExtend_shift_instructions(in, out);
input [4:0] in;
output reg [31:0] out;
    
 always@(*) begin
     out <= {27'b0 , in}; //We alsways just want to pad with zeros we don't want to sign extend
     //ignore the module name this was a later fix
end
endmodule