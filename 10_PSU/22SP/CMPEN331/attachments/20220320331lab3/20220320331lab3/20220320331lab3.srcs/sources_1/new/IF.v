`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create I_Outte: 2022/03/20 18:23:14
// Design Name: 
// Module Name: IF
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


module pc(
    input [31:0] nextPC ,
    input clk,
    output reg [31:0] pc
);    initial pc = 100;
always @(posedge clk) begin
        pc <= nextPC;
    end
endmodule

module instMem(
    input [31:0] pc,

    output reg [31:0] I_Out
);

    reg [31:0] mem [0:511];

    initial begin // Temp Assigned value
        mem[100] = {
        6'b100011,
        5'b00001,
        5'b00010,
        5'b00000,
        5'b00000,
        6'b000000
        };
        mem[104] = {
        6'b100011,
        5'b00001,
        5'b00011,
        5'b00000,
        5'b00000,
        6'b000100
        };
    end

    always @ (*) begin
        I_Out <= mem[pc[7:2]];
    end
endmodule

module pcAdder(
    input [31:0] pc,
    //input [31:0] increment,     reserved for j inst

    output reg [31:0] nextPC
);

    always @ (*) begin
        nextPC <= pc + 4;
    end
endmodule

module IFIDreg(
    input [31:0] I_Out,
    input clk,

    output reg [31:0] dI_Out,
    output reg [5:0] op,
    output reg [5:0] func,
    output reg [4:0] rd,
    output reg [4:0] rt,
    output reg [4:0] rs,
    output reg [15:0] imm
);

    always @ (*) begin
        dI_Out <= I_Out;
        op = I_Out[31:26];
        func = I_Out[5:0];
        rd = I_Out[15:11];
        rt = I_Out[20:16];
        rs = I_Out[25:21];
        imm = I_Out[15:0];
    end
endmodule

module InstFetch(
    input clk,

    output [31:0] dI_Out
);

    wire [31:0] wpc;
    wire [31:0] wnextPC;
    wire [31:0] wI_Out;

    pc pc1(wnextPC, clk, wpc);
    pcAdder pcadd(wpc, wnextPC);
    instMem inmem(wpc, wI_Out);
    IFIDreg IFID(wI_Out, clk, dI_Out);

endmodule
