`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/04 16:12:05
// Design Name: 
// Module Name: TestBench
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


module TestBench();

    reg clk;
    
//    wire TB_wreg;
//    wire TB_m2reg;
//    wire [4:0] TB_wdestReg;
//    wire [31:0] TB_wr;
//    wire [31:0] TB_wdo;
    
    DataPath dp (clk);
    //, TB_wreg, TB_m2reg, TB_wdestReg, TB_wr, TB_wdo
    
    initial begin
       clk = 0;
       
       #100 $finish;
    end
    
    always begin 
        #5; 
        clk = ~clk;
    end
    
endmodule
