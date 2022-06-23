`timescale 1ns/1ps

module pc(
    input [31:0] nextPC,
    input clk,
    input wpcir,
    
    output reg [31:0] pc 
);

    initial pc = 100;
    always @(posedge clk) begin
    if (wpcir) pc <= nextPC;
    end 
endmodule


module IFIDreg(
    input [31:0] instOut,
    input clk,
    //P
    input wpcir,
    //PB
    input [31:0] pc4,
    
    output reg [31:0] dinstOut,
    //PB
    output reg [31:0] dpc4
);

    always @ (posedge clk) begin
    if (wpcir) begin
        dinstOut <= instOut;
        dpc4 <= pc4;
        end
    end
endmodule

module pcAdd(
    input [31:0] pc,
    
    output [31:0] pc4
);

    assign pc4 = pc + 32'd4;
    
endmodule

module pcAdd(
    input [31:0] pc,
    
    output [31:0] pc4
);

    assign pc4 = pc + 32'd4;
    
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
memory[25] = 32'h3c010000; // (00) main: lui $1, 0 
memory[26] = 32'h34240050; // (04) ori $4, $1, 80 
memory[27] = 32'h0c00001b; // (08) call: jal sum 
memory[28] = 32'h20050004; // (0c) dslot1: addi $5, $0, 4 
memory[29] = 32'hac820000; // (10) return: sw $2, 0($4) 
memory[30] = 32'h8c890000; // (14) lw $9, 0($4) 
memory[31] = 32'h01244022; // (18) sub $8, $9, $4 
memory[32] = 32'h20050003; // (1c) addi $5, $0, 3 
memory[33] = 32'h20a5ffff; // (20) loop2: addi $5, $5, -1 
memory[34] = 32'h34a8ffff; // (24) ori $8, $5, 0xffff
memory[35] = 32'h39085555; // (28) xori $8, $8, 0x5555
memory[36] = 32'h2009ffff; // (2c) addi $9, $0, -1 
memory[37] = 32'h312affff; // (30) andi $10,$9,0xffff
memory[38] = 32'h01493025; // (34) or $6, $10, $9 
memory[39] = 32'h01494026; // (38) xor $8, $10, $9 
memory[40] = 32'h01463824; // (3c) and $7, $10, $6 
memory[41] = 32'h10a00003; // (40) beq $5, $0, shift 
memory[42] = 32'h00000000; // (44) dslot2: nop 
memory[43] = 32'h08000008; // (48) j loop2 
memory[44] = 32'h00000000; // (4c) dslot3: nop 
memory[45] = 32'h2005ffff; // (50) shift: addi $5, $0, -1 
memory[46] = 32'h000543c0; // (54) sll $8, $5, 15 
memory[47] = 32'h00084400; // (58) sll $8, $8, 16 
memory[48] = 32'h00084403; // (5c) sra $8, $8, 16 
memory[49] = 32'h000843c2; // (60) srl $8, $8, 15 
memory[50] = 32'h08000019; // (64) finish: j finish 
memory[51] = 32'h00000000;  // (68) dslot4: nop 
memory[52] = 32'h00004020; // (6c) sum: add $8, $0, $0 
memory[53] = 32'h8c890000; // (70) loop: lw $9, 0($4) 
memory[54] = 32'h01094020; // (74) stall: add $8, $8, $9 
memory[55] = 32'h20a5ffff; // (78) addi $5, $5, -1 
memory[56] = 32'h14a0fffc; // (7c) bne $5, $0, loop 
memory[57] = 32'h20840004; // (80) dslot5: addi $4, $4, 4 
memory[58] = 32'h03e00008; // (84) jr $31 
memory[59] = 32'h00081000; // (88) dslot6: sll $2, $8, 0

end

    always @ (*) begin
        instOut <= memory[pc[7:2]];
    end
endmodule

module pcMUX(
    input [31:0] pc4,
   
    input [31:0] bpc,
    input [31:0] ra,
    input [31:0] jpcFull,
    input [1:0] pcsrc,
    
    output [31:0] nextPC
);

assign nextPC = (pcsrc == 2'd0)? pc4 : ((pcsrc == 2'd1)? bpc :  ((pcsrc == 2'd2)? ra : jpcFull));


endmodule





module InstFetch(
    input clk,

    input wpcir,

    input [31:0] bpc,
    input [31:0] ra,
    input [31:0] jpcFull,
    input [1:0] pcsrc,
    
    output [31:0] dinstOut,

    output [31:0] dpc4
);

wire [31:0] wpc;
wire [31:0] wnextPC;
wire [31:0] winstOut;
wire [31:0] pc4;
wire [31:0] wpc4;

pc pc1(wnextPC, clk, wpcir, wpc);
pcAdd pa(wpc, wpc4);
pcMUX pcm(wpc4, bpc, ra, jpcFull, pcsrc, wnextPC);
instMem inmem(wpc, winstOut);
IFIDreg IFID(winstOut, clk, wpcir, wpc4, dinstOut, dpc4);

endmodule


    