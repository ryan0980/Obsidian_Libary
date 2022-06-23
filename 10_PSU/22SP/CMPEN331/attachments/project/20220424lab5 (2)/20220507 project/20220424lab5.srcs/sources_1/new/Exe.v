module aluMUX (
    input [31:0] eqb,
    input [31:0] eimm,
    input ealuimm,
    
    output reg [31:0] b
    );
    
    always @ (*)
    begin 
    
    if (ealuimm) b <= eimm;
    else b <= eqb;
    
    end
endmodule

module Alu(
    input [31:0] eqa,
    input [31:0] b,
    input [3:0] ealuc,
    
    output reg [31:0] r
    );
    
    always @(*)
    begin
    
    case (ealuc)
    4'b0000: r <= eqa & b;
    4'b0001: r <= eqa | b;
    4'b0010: r <= eqa + b;
    4'b0110: r <= eqa - b;
    4'b0111: r <= eqa ^ b; //xor
    4'b1010: r <= b << eqa[10:6]; //sll
    4'b1100: r <= b >> eqa[10:6]; //srl
    4'b1011: r <= b >>> eqa[10:6]; //sra
    4'b1110: r <= {b[31:16], 15'd0};
    
    endcase
    end
endmodule

module exemem(
    input ewreg,
    input em2reg,
    input ewmem,
    input [4:0] edestReg,
    input [31:0] r,
    input [31:0] eqb,
    input clk,
    
    output reg mwreg,
    output reg mm2reg,
    output reg mwmem,
    output reg [4:0] mdestReg,
    output reg [31:0] mr,
    output reg [31:0] mqb
    );
    
    always @ (posedge clk) begin
    
           mwreg <= ewreg;
           mm2reg <= em2reg;
           mwmem <= ewmem;
           mdestReg <= edestReg;
           mr <= r;
           mqb <= eqb;  
  
    end
endmodule
module jal(
    input [31:0] epc4, ealu,
    input ejal,
    
    output [31:0] er
);

assign er = (ejal) ? (epc4 + 32'd4) : ealu;

endmodule
module shiftMux(
    input [31:0] sa, eqa,
    input shift,
    output [31:0] a
); 
assign a = (shift) ? sa : eqa;

endmodule

module f(
    input jal,
    input [4:0] destReg,
    output [4:0] edestReg
);
assign edestReg = (jal) ? 5'd31 : destReg;

endmodule




module Exe(
    input ewreg,
    input em2reg,
    input ewmem,
    input [3:0] ealuc,
    input ealuimm,
    input [4:0] edestReg,
    input [31:0] eqa,
    input [31:0] eqb,
    input [31:0] eimm32,
    input clk,

    input ejal, eshift,
    input [31:0] epc4,

    output mwreg,
    output mm2reg,
    output mwmem,
    output [4:0] mdestReg,
    output [31:0] mr,
    output [31:0] mqb,

    output [31:0] er,

    output [4:0] CEdestReg,
    output CEwreg, CEm2reg
);

    wire [31:0] rWire;
    wire [31:0] bWire;
    wire [31:0] aluOut, a;
    wire [4:0] fdestReg;
    
    assign CEdestReg = fdestReg;
    assign CEwreg = ewreg;
    assign CEm2reg = em2reg;
    assign er = rWire;
 
    aluMUX almu(eqb, eimm32, ealuimm, bWire);
    shiftMux sft(eimm32, eqa, eshift, a);
    Alu alu(a, bWire, ealuc, aluOut);
    jal jl(epc4, aluOut, ejal, rWire);
    f ff(ejal, edestReg, fdestReg);
    exemem em(ewreg, em2reg, ewmem, fdestReg, rWire, eqb, clk, mwreg, mm2reg, mwmem, mdestReg, mr, mqb);

endmodule
    