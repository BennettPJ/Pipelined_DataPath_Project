`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 11:06:33 AM
// Design Name: 
// Module Name: JumpTarget
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


module JumpTarget(jumpAddress, targetAddress);
input [25:0] jumpAddress;
output reg [31:0] targetAddress;

always@(jumpAddress) begin
targetAddress <= {jumpAddress[25:22],jumpAddress} << 2;
end
endmodule
