`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create I_Outte: 2022/03/20 18:49:13
// Design Name: 
// Module Name: TB
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


module TB();

    reg clk;

    wire twreg;
    wire tm2eg;
    wire TB_twmeml;
    wire [3:0] taluc;
    wire [5:0] talu;
    wire [4:0] tdestReg;
    wire [31:0] tqa;
    wire [31:0] tqb;
    wire [31:0] imm32;

    I_OuttaPath dp (clk, twreg, tm2eg, TB_twmeml, talu, tdestReg, tqa, tqb, imm32);

    initial begin
        clk = 0;

        #100 $finish;
    end

    always begin
        #5;
        clk = ~clk;
    end

endmodule

