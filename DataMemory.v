`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 01:54:16 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input [1:0]MemWrite; 		// Control signal for memory write 
    input [1:0]MemRead;             // Control signal for memory read 

    output reg [31:0] ReadData; // Contents of memory location at Address

    /* Please fill in the implementation here */
    reg [31:0] mem [16384:0]; 

    initial begin 
       $readmemh("data_memory.mem", mem, 0, 16384);
    end

    
    always @(posedge Clk) begin
        if (MemWrite == 2'b01) begin
            mem[Address[16:2]] <= WriteData;
        end
        else if (MemWrite == 2'b10) begin
            mem[Address[16:2]] <= {mem[Address[16:2]][31:8], WriteData[7:0]};
            //We always want to store into the right most byte (according to TA)
            //Store byte
        end
        else if (MemWrite == 2'b11) begin
             mem[Address[16:2]]<= {mem[Address[16:2]][31:16], WriteData[15:0]};
             //We always want to store into the right most half (according to TA)
             //store half
        end
        else begin
        //do nothing
        end
    end
    
    always @ (Address, MemRead) begin
        if (MemRead == 2'b01) begin
           ReadData <= mem[Address[16:2]]; //lw
        end
        else if (MemRead == 2'b10) begin
            if (Address[1:0] == 2'b00) begin 
                if(mem[Address[16:2]][7] == 0) begin
                    ReadData <= {24'd0,mem[Address[16:2]][7:0]}; //lb
                end
                else begin
                    ReadData <= {24'hFFFFFF,mem[Address[16:2]][7:0]}; //lb
                end
            end
            
            else if (Address[1:0] == 2'b01) begin
                if (mem[Address[16:2]][15] == 0) begin
                    ReadData <= {24'd0, mem[Address[16:2]][15:8]}; //lb
                end
                else begin
                    ReadData <= {24'hFFFFFF,mem[Address[16:2]][15:8]}; //lb
                end
            end
            else if (Address[1:0] == 2'b10) begin
                if(mem[Address[16:2]][23] == 0) begin
                    ReadData <= {24'd0,mem[Address[16:2]][23:16]}; //lb
                end
                else begin
                    ReadData <= {24'hFFFFFF,mem[Address[16:2]][23:16]}; //lb
                end
            end
            else if(Address[1:0] == 2'b11) begin
               if(mem[Address[16:2]][31] == 0) begin
                    ReadData <= {24'd0,mem[Address[16:2]][31:24]}; //lb
                end
                else begin
                    ReadData <= {24'hFFFFFF,mem[Address[16:2]][31:24]}; //lb
                end
            end
            else begin
               ReadData <= 32'b0; //we never exectue this it is just to fix a latch
               //We use bits 1:0 to determine which byte to read
            end
        end
        else if (MemRead == 2'b11) begin
            if (Address[1] == 0) begin
                if (mem[Address[16:2]][15] == 0) begin
                    ReadData <= {16'd0, mem[Address[16:2]][15:0]}; //lh
                end
                else begin
                    ReadData <= {16'hFFFF, mem[Address[16:2]][15:0]};
                end
            end
            else begin
                if (mem[Address[16:2]][31] == 0) begin
                    ReadData <= {16'd0, mem[Address[16:2]][31:16]}; //lh
                end
                else begin
                    ReadData <= {16'hFFFF, mem[Address[16:2]][31:16]};
                end
            end
        //load half
        end
        else begin 
            ReadData <= 32'd0;
        end
        
    end
    

endmodule