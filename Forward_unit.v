`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group-members: Bennett Jackson (33.3%), Chris Karceski (33.3%), Ruben Galdean (33.3%)
//////////////////////////////////////////////////////////////////////////////////


module Forward_unit(Reset, EX_rs, EX_rt, MEM_rd, WB_rd, MEM_RegWrite, WB_RegWrite, A, B);
input Reset;
input MEM_RegWrite, WB_RegWrite;
input [4:0] MEM_rd, WB_rd, EX_rs, EX_rt;
output reg [1:0] A, B;

//A is the rs input into the EX stage
//B is the rt input into the EX stage

//A <= 2'b00 -> no forwarding
//A <= 2'b01 -> forward from MEM stage
//A <= 2'b10 -> forward from WB stage

//B <= 2'b00 -> no forwarding
//B <= 2'b01 -> forward from MEM stage
//B <= 2'b10 -> forward from WB stage
 
initial begin
A <= 2'b00;
B <= 2'b00;
end

always@(*)begin 
A <= 2'b00;
B <= 2'b00;
if(Reset == 1'b1) begin 
A <= 2'b00;
B <= 2'b00;
end 

else begin 
//if (WB_RegWrite == 1'b1 || MEM_RegWrite == 1'b1) begin
    if(MEM_rd == EX_rs && MEM_rd != 0 && MEM_RegWrite == 1'b1) begin
    //rs in mem
    A <= 2'b01;
 
    end
        else if(WB_rd == EX_rs && WB_rd != 0 && WB_RegWrite == 1'b1)begin
        //rs in wb
        A <= 2'b10;
        end
        else begin
        //default
        A <= 2'd00;
          
        end
    
    if(MEM_rd == EX_rt && MEM_rd != 0 && MEM_RegWrite == 1'b1)begin
    //rt in mem
  
    B <= 2'b01;
    end
        else if(WB_rd == EX_rt && WB_rd != 0 && WB_RegWrite == 1'b1)begin
        //rt in wd
     
        B <= 2'b10;
        end
        else begin
        //default
       
        B <= 2'd00;
        end
 //end
     
end 
end
endmodule


//    if (WB_RegWrite == 1'b1 && MEM_rd != 0 && MEM_rd == EX_rs) begin
//        A <= 2'b01;
//    end
//        else begin 
//           A <= 2'd0;
//        end 
    
//    if (WB_RegWrite == 1'b1 && MEM_rd != 0 && MEM_rd == EX_rt) begin
//        B <= 2'b01;
//    end
//        else begin 
//           B <= 2'd0;
//        end 
//    ////////////////////////////////////////////////////////////////////////
//    if (MEM_RegWrite == 1'b1 && WB_rd != 0 && WB_rd == EX_rs) begin
//        A <= 2'b10;
//    end
//       else begin 
//           A <= 2'd0;
//        end 
//    if (MEM_RegWrite == 1'b1 && WB_rd != 0 && WB_rd == EX_rt) begin
//        B <= 2'b10;
//    end
//       else begin 
//           B <= 2'd0;
//        end 
//////////////////////////////////////////////////////////////////////////
//    if (MEM_RegWrite == 1'b1 && WB_rd != 0 && WB_rd == EX_rs) begin
//        A <= 2'b10;
//    end 
//        else if (WB_RegWrite == 1'b1 && MEM_rd != 0 && MEM_rd == EX_rs) begin
//            A <= 2'b01;
//        end
//        else begin 
//           A <= 2'd0;
//        end 
              
//    if (MEM_RegWrite == 1'b1 && WB_rd != 0 && WB_rd == EX_rt) begin
//        B <= 2'b10;
//    end
//        else  if (WB_RegWrite == 1'b1 && MEM_rd != 0 && MEM_rd == EX_rt) begin
//            B <= 2'b01;
//        end
//        else begin 
//               B <= 2'd0;
//            end 
//   end 
 
//else begin 
// A <= 2'd0;
// B <= 2'd0;
//end 