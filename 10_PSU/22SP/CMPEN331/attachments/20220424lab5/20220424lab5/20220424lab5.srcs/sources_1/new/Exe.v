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
    4'b0000: r <= eqa + b;
    4'b0001: r <= eqa + b;
    4'b0010: r <= eqa + b;
    
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

module Exe(
    input wreg,
    input em2reg,
    input ewmem,
    input [3:0] ealuc,
    input ealuimm,
    input [4:0] edestReg,
    input [31:0] eqa,
    input [31:0] eqb,
    input [31:0] eimm32,
    input clk,

    output mwreg,
    output mm2reg,
    output mwmem,
    output [4:0] mdestReg,
    output [31:0] mr,
    output [31:0] mqb
);

    wire [31:0] rWire;
    wire [31:0] bWire;
 
    aluMUX almu(eqb, eimm32, ealuimm, bWire);
    Alu alu(eqa, bWire, ealuc, rWire);
    exemem em(wreg, em2reg, ewmem, edestReg, rWire, eqb, clk, mwreg, mm2reg, mwmem, mdestReg, mr, mqb);

endmodule
    