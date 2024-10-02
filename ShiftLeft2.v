`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 02:44:34 PM
// Design Name: 
// Module Name: ShiftLeft2
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


module ShiftLeft2(A, Result);
input[15:0] A;
output reg [31:0] Result;

initial begin
Result <= 0;
end

always@(*) begin
if(A[15] == 1'b0) begin 
    Result <= {16'b0 , A} << 2; //Sign extend + multiply by 4
end
else begin
    Result <= {16'd65535 , A} << 2; //Sign extend + multiply by 4
end
end

endmodule
