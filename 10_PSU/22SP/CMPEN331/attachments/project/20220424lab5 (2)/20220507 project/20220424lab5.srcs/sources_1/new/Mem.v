`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create: 2022/04/10 13:18:23
// Design Name: 
// Module Name: 
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


module Main_Mem(
    input [31:0] mr,
    input [31:0] mqb, 
    input mwmem, 
    input clk,
    
    output reg [31:0] mdo
    );
    
    reg [31:0] mem [0:63];
    
    integer i;
    
    initial begin
//        mem[0] = 32'hA00000AA;
//        mem[1] = 32'h10000011;
//        mem[2] = 32'h20000022;
//        mem[3] = 32'h30000033;
//        mem[4] = 32'h40000044;
//        mem[5] = 32'h50000055;
//        mem[6] = 32'h60000066;
//        mem[7] = 32'h70000077;
//        mem[8] = 32'h80000088;
//        mem[9] = 32'h90000099;
    for (i = 0; i < 32; i = i + 1)
        mem[i] = 0;
    
    mem[5'h14] = 32'h000000a3; 
    mem[5'h15] = 32'h00000027; 
    mem[5'h16] = 32'h00000079;
    mem[5'h17] = 32'h00000115;
    end
    
    always @ (*) begin
        mdo <= mem[mr[7:2]];
    end
    
    always @ (negedge clk) begin
        if (mwmem) begin
            mem[mr[7:2]] <= mqb;
        end
    end
    
endmodule

module memwb(
    input mwreg,
    input mm2reg,
    input [4:0] mdestReg,
    input [31:0] mr,
    input [31:0] mdo,
    input clk,
    
    output reg wwreg,
    output reg wm2reg,
    output reg [4:0] wdestReg,
    output reg [31:0] wr,
    output reg [31:0] wdo
);
    always @ (posedge clk) begin
    wwreg <= mwreg;
    wm2reg <=mm2reg;
    wdestReg <= mdestReg;
    wr <= mr;
    wdo <= mdo;
    end
endmodule

module Mem(
    input mwreg,
    input mm2reg,
    input mwmem,
    input [4:0] mdestReg,
    input [31:0] mr,
    input [31:0] mqb,
    input clk,
    
    output wwreg,
    output wm2reg,
    output [4:0] wdestReg,
    output [31:0] wr,
    output [31:0] wdo,

    output [31:0] Cmr, Cmdo,

    output [4:0] CMdestReg,
    output CMwreg, CMm2reg
);

    wire [31:0] doWire;
    
    assign Cmr = mr;
    assign Cmdo = doWire;
    
    assign CMdestReg = mdestReg;
    assign CMwreg = mwreg;
    assign CMm2reg = mm2reg;
    
    Main_Mem m(mr, mqb, mwmem, clk, doWire);
    memwb mw(mwreg, mm2reg, mdestReg, mr, doWire, clk, wwreg, wm2reg, wdestReg, wr, wdo);
    
endmodule