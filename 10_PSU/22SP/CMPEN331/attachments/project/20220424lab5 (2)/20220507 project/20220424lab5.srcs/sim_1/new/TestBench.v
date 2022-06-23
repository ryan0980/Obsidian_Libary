`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/10 12:09:47
// Design Name: 
// Module Name: TestBench
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


module TestBench();//√‘√£

    reg clk;
    
    DataPath dp (clk);

    initial begin
       clk = 0;
       
    end
    
    always begin 
        #5; 
        clk = ~clk;
    end
    
endmodule
