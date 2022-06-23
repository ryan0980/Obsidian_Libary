`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create I_Outte: 2022/03/20 18:23:14
// Design Name: 
// Module Name: ID
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


module Control(
    input [5:0] op,
    input [5:0] func,

    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg [3:0] aluc,
    output reg aluImm,
    output reg regrt
);

    always @(*) begin
        wreg <= 1;
        m2reg <= 1;
        wmem <= 0;
        aluc <= 4'b0010;
        aluImm <= 1;
        regrt <= 1;
    end

endmodule

module regRTMux(
    input [4:0] rt,
    input [4:0] rd,
    input regrt,

    output reg [4:0] destReg
);

    always @ (*) begin
        if (~regrt) destReg <= rd;
        else if (regrt) destReg <= rt;
    end
endmodule

module regFile(
    input [4:0] rs,
    input [4:0] rt,

    output reg [31:0] qa,
    output reg [31:0] qb
);

    reg [31:0] registers [0:31];
    integer i;

    initial //Initialize RegFile
    begin
        for (i=0; i<32; i=i+1) begin
            registers[i] <= 32'd0;
        end
    end

    always @ (*) begin
        qa = registers[rs];
        qb = registers[rt];
    end
endmodule

module ImmExt(
    input [15:0] imm,

    output reg [31:0] imm32
);

    always @ (*) begin
        imm32 <= {imm[15], {16{1'b0}}, imm[14:0]};
    end
endmodule

module IDEXEreg(
    input wreg,
    input m2reg,
    input wmem,
    input [3:0] aluc,
    input aluimm,
    input [4:0] destReg,
    input [31:0] qa,
    input [31:0] qb,
    input [31:0] imm32,
    input clk,

    output reg ewreg,
    output reg em2reg,
    output reg ewmem,
    output reg [3:0] ealuc,
    output reg ealuimm,
    output reg [4:0] edestReg,
    output reg [31:0] eqa,
    output reg [31:0] eqb,
    output reg [31:0] eimm32
);

    always @ (posedge clk) begin
        ewreg <= wreg;
        em2reg <= m2reg;
        ewmem <= wmem;
        ealuc <= aluc;
        ealuimm <= aluimm;
        edestReg <= destReg;
        eqa <= qa;
        eqb <= qb;
        eimm32 <= imm32;
    end
endmodule

module InstDecode(
    input [31:0] dI_Out,
    input clk,

    output ewreg,
    output em2reg,
    output ewmem,
    output [3:0] ealuc,
    output ealuimm,
    output [4:0] edestReg,
    output [31:0] eqa,
    output [31:0] eqb,
    output [31:0] eimm32
);

    wire wwreg;
    wire wm2reg;
    wire wwmem;
    wire [3:0] waluc;
    wire waluimm;
    wire [4:0] wdestReg;
    wire [31:0] wqa;
    wire [31:0] wqb;
    wire [31:0] wimm32;

    wire wrtMUX;

    Control c(dI_Out[31:26], dI_Out[5:0], wwreg, wm2reg, wwmem, waluc, waluimm, wrtMUX);
    regRTMux rtMux(dI_Out[20:16], dI_Out[15:11], wrtMUX, wdestReg);
    regFile rf(dI_Out[25:21], dI_Out[20:16], wqa, wqb);
    ImmExt extend(dI_Out[15:0], wimm32);
    IDEXEreg idexe1(wwreg, wm2reg, wwmem, waluc, waluimm, wdestReg, wqa, wqb, wimm32, clk, ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32);

endmodule
