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



module DataPath(
    input clk,

    output ewreg,
    output [4:0] Out_destReg,
    output [31:0] Out_wbData
    );
    

    wire [31:0] inst;

    wire [31:0] qa;
	wire [31:0] qb;
	wire [31:0] imm32;
    wire wreg;
	wire m2reg;
	wire wmem;
	wire aluimm;
    wire [3:0] aluc;
    wire [4:0] destReg;

    wire mwreg;
	wire mm2reg;
	wire mwmem;
    wire [4:0] mdestReg;
    wire [31:0] mr, mqb;    

    wire wwreg;
    wire wm2reg1;
    wire [4:0] wdestReg;
    wire [31:0] wr;
    wire [31:0] wdo;

    wire WB_wreg;
    wire [4:0] WB_destReg;
    wire [31:0] WB_wbData;
        
    InstFetch if1(clk, inst);
    InstDecode id(inst, WB_wreg, WB_destReg, WB_wbData, clk, wreg, m2reg, wmem, aluc, aluimm, destReg, qa, qb, imm32);
    Exe ex(wreg, m2reg, wmem, aluc, aluimm, destReg, qa, qb, imm32, clk, mwreg, mm2reg, mwmem, mdestReg, mr, mqb);
    Mem me(mwreg, mm2reg, mwmem, mdestReg, mr, mqb, clk, wwreg, wm2reg1, wdestReg, wr, wdo);
    WB w(wwreg, wm2reg1, wdestReg, wr, wdo, WB_wreg, WB_destReg, WB_wbData);
    
    //Just for schematics
    assign ewreg = WB_wreg;
    assign Out_destReg = WB_destReg;
    assign Out_wbData = WB_wbData;
	
endmodule
