`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/20 19:31:02
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
module pc(input [31:0] nextPc, input clk, output reg [31:0] opc);
    initial opc=100;
    always @(posedge clk) begin
        opc<=nextPc ;
    end
endmodule

module InsMem(input [31:0] opc, output reg [31:0] instOut);
    reg [31:0] memory [0:63];
    initial begin
        memory [25]={
        6'b100011,
        5'b00001,
        5'b00010,
        5'b00000,
        5'b00000,
        6'b000000
        };
        memory [26]={
        6'b100011,
        5'b00001,
        5'b00011,
        5'b00000,
        5'b00000,
        6'b000100};
    end

    always @(*) begin
        instOut <=memory [opc[7:2]];
    end
endmodule

module pcAdder(input [31:0] opc, output reg [31:0] nextPc);
    always @(*) begin
        nextPc <=opc+4;
    end

endmodule

module IFID(input [31:0] instOut, input clk, output reg [31:0] dinstOut);
    always @(posedge clk) begin
        dinstOut<= instOut;
    end
endmodule

module IF(
    input clk,
    output  [31:0] odinstOut,
    output [31:0] opc
);
    wire [31:0] wnPC;
    wire [31:0] winstOut;
    pc pci(wnPC , clk,opc );
    pcAdder pcadd(opc,wnPC );
    InsMem imem(opc, winstOut );
    IFID ifid(winstOut,clk,odinstOut );
endmodule
