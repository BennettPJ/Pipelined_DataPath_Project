`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group-members: Bennett Jackson (33.3%), Chris Karceski (33.3%), Ruben Galdean (33.3%)
//////////////////////////////////////////////////////////////////////////////////


module top_level_tb();
    reg Clock;
    reg Reset;
    wire [31:0] PC;
    wire [31:0] RegWriteVal, curr_min_SAD_wire;
    wire [31:0] v0, v1;
    
    top_level top1(.Clk(Clock), .Rst(Reset), .PCwire(PC), .WB2Out(RegWriteVal), .v0_wire(v0), .v1_wire(v1),.curr_min_SAD_wire(curr_min_SAD_wire) );
    
    initial begin
        Clock <= 1'b0;
        forever #5 Clock <= ~Clock;
    end //this initializes the clock
    
    initial begin   
        Reset <= 1; 
        #3; 
        Reset <= 0; 
        #3; 
    end
endmodule
