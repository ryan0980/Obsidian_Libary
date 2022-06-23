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
    
    output Out_wreg,
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
    

    wire [1:0] pcsrc;
    wire [31:0] ra, jpcFull, bpc, dpc;
    wire wpcir;

    wire [4:0] CmdestReg;
    wire Cmm2Reg, Cmwreg;
    wire [4:0] CedestReg;
    wire Cem2Reg, Cewreg;
    wire [31:0] dpc4, Dr, Dmr, Dmdo;
    wire ejal, eshift;
    wire [31:0] epc4;
        
    InstFetch if1(clk, wpcir, bpc, ra, jpcFull, pcsrc, inst, dpc);
    InstDecode id(inst, WB_wreg, WB_destReg, WB_wbData, clk, CmdestReg, Cmm2Reg, Cmwreg, CedestReg, Cem2Reg, Cewreg, dpc, Dr, Dmr, Dmdo,
         wreg, m2reg, wmem, aluc, aluimm, destReg, qa, qb, imm32, wpcir, pcsrc, jpcFull, bpc, ra, ejal, eshift, epc4);
    Exe ex(wreg, m2reg, wmem, aluc, aluimm, destReg, qa, qb, imm32, clk, ejal, eshift, epc4,
        mwreg, mm2reg, mwmem, mdestReg, mr, mqb, Dr, CedestReg, Cewreg, Cem2Reg);
    Mem me(mwreg, mm2reg, mwmem, mdestReg, mr, mqb, clk, wwreg, wm2reg1, wdestReg, wr, wdo, Dmr, Dmdo, CmdestReg, Cmwreg, Cmm2Reg);
    WB w(wwreg, wm2reg1, wdestReg, wr, wdo, WB_wreg, WB_destReg, WB_wbData);
    
    //Just for schematics    
    assign Out_wreg = WB_wreg;
    assign Out_destReg = WB_destReg;
    assign Out_wbData = WB_wbData;
	
endmodule
