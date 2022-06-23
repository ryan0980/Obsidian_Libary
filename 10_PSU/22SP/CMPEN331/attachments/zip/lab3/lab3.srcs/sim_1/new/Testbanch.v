`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/20 22:24:20
// Design Name: 
// Module Name: Testbanch
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


module Testbanch();
    reg clk;
    wire [31:0] TBpc;
    wire [31:0] TBdinstOut;
    wire TBewreg;
    wire TBem2reg;
    wire TBewmem;
    wire [3:0] TBealuc;
    wire TBealuimm;
    wire [4:0] TBedestReg;
    wire [31:0] TBeqa;
    wire [31:0] TBeqb;
    wire [31:0] TBeimm32;
    Datapath df(clk, TBpc, TBewreg, TBem2reg ,TBewmem,
        TBealuc ,TBealuimm ,TBedestReg ,TBeqa ,TBeqb,TBeimm32 ,TBdinstOut );

    initial begin
        clk=0;
        #100 $finish;
    end
    always begin
        #5;
        clk=~clk;
    end
endmodule
