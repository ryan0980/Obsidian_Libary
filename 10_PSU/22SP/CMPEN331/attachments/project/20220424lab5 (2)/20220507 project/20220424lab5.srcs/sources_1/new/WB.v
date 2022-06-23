`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create : 2022/04/10 13:18:23
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
module WbMUX(
    input wm2reg,
    input [31:0] wr,
    input [31:0] wdo,
    
    output [31:0] wbData
);

assign wbData = wm2reg ? wdo : wr;
//always @ (*) begin
//if (wm2reg) 
//begin
//   assign wbData = wdo;
//end 
//else 
//begin
//   assign wbData = wr;
//end
//end

endmodule


module WB(
    input wwreg,
    input wm2reg,
    input [4:0] wdestReg,
    input [31:0] wr,
    input [31:0] wdo,
   
    output wreg,
    output [4:0] destReg,
    output [31:0] wbData
);

assign wreg = wwreg;
assign destReg = wdestReg;
WbMUX wbm(wm2reg, wr, wdo, wbData);

endmodule
