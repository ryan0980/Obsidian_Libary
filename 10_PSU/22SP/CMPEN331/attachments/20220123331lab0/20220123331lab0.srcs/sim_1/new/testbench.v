`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2020 12:27:00 PM
// Design Name: 
// Module Name: testbench
// Project Name: 7 segment display
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

// Module      : Testbench
// Description : Using the test sequence given generate the output of the 7 segment display by calling dff3 and counter modules
module testbench();
    reg clrn_tb;
    reg clk_tb;
    reg u_tb;
    wire [2:0] q_tb;
    wire [2:0] ns_tb;
    wire a,b,c,d,e,f,g;
    dff3 dff3_tb(ns_tb, clrn_tb, clk_tb, q_tb);
    counter counter_tb(q_tb, u_tb, ns_tb, a, b, c, d, e, f, g);
    initial begin
        clrn_tb = 0;        
        clk_tb = 1;
        u_tb = 1; 
        #1 clrn_tb = 1;
        #16 u_tb = 0;        
    end   
    always begin
        #1;
        clk_tb = ~clk_tb;
    end
endmodule