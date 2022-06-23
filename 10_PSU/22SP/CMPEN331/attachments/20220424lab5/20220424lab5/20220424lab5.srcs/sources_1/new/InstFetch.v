`timescale 1ns/1ps

module pc(
    input [31:0] nextPC ,
    input clk,
    output reg [31:0] pc 
);
    initial pc = 100;
    always @(posedge clk) begin
    pc <= nextPC;
    end
endmodule
module IFIDreg(
    input [31:0] instOut,
    input clk,
    
    output reg [31:0] dinstOut
);
    always @ (posedge clk) begin
        dinstOut <= instOut;
    end
endmodule
module pcAdder(
    input [31:0] pc,
    output reg [31:0] nextPC
);
    always @ (*) begin
        nextPC <= pc + 4;
    end
endmodule

module instMem(
    input [31:0] pc,
    output reg [31:0] instOut
);
reg [31:0] memory [0:63];

initial begin
//lw $2, 00($1)lw $2, 00($1)  # $2 ?? memory[$1+00]; load x[0] 
//  lw $3, 04($1)  # $3 ?? memory[$1+04]; load x[1] 
//lw $4, 08($1)  # $4 ?? memory[$1+08]; load x[2] 
//lw $5, 12($1)   # $5 ?? memory[$1+12]; load x[3] 
//add $6, $2, $10
    memory[25] = {
        6'b100011,
        5'b00001,
        5'b00010,
        5'b00000,
        5'b00000,
        6'b000000
    };
    memory[26] = {
        6'b100011,
        5'b00001,
        5'b00011,
        5'b00000,
        5'b00000,
        6'b000100
    };    
    memory[27] = {
        6'b100011,
        5'b00001,
        5'b00100,
        5'b00000,
        5'b00000,
        6'b001000
    };  
    memory[28] = {
        6'b100011,
        5'b00001,
        5'b00101,
        5'b00000,
        5'b00000,
        6'b001100
    };  
    memory[29] = {
        6'b000000,
        5'b00010,
        5'b01010,
        5'b00110,
        5'b00000,
        6'b100000
    };  
end
    always @ (*) begin
        instOut <= memory[pc[7:2]];
    end
endmodule





module InstFetch(
    input clk,
    output [31:0] dinstOut
);

wire [31:0] wpc;
wire [31:0] wnextPC;
wire [31:0] winstOut;

pc pc1(wnextPC, clk, wpc);
pcAdder pcadd(wpc, wnextPC);
instMem inmem(wpc, winstOut);
IFIDreg IFID(winstOut, clk, dinstOut);

endmodule


    