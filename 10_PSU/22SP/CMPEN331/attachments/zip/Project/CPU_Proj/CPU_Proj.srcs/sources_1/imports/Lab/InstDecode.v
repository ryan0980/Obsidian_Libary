module Control(
    input [5:0] op,
    input [5:0] func,
    //For Proj
    input [4:0] rs, rt, mdestReg,
    input mm2Reg, mwreg,
    input [4:0] edestReg,
    input em2Reg, ewreg,
    //For Proj Bonus
    input RsrtEqu, 
    
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg [3:0] aluc,
    output reg aluImm,
    output reg regrt,
    //For Proj
    output reg [1:0] fwd_A, fwd_B,
    output reg wpcir,
    //For Proj Bonus
    output reg jal,
    output reg shift,
    output reg sext,
    output reg [1:0] pcsrc
);

    //For Proj
    reg regUsage;
    
initial begin
    wreg <= 0;
    pcsrc <= 0;
    //regUsage <= 1;  //Just For Testing
end

always @(*) begin

    //Stalling
    if (ewreg && em2Reg && (edestReg != 0) && regUsage && (edestReg == rs || edestReg == rt)) 
        begin
            wreg <= 0;
            wmem <= 0;
            wpcir <= 0;
        end 
    else wpcir <= 1;
                
    //Forwarding
    if (ewreg & (edestReg != 0) & (edestReg == rs) & ~em2Reg) fwd_A <= 1;
    else if (mwreg & (mdestReg != 0) & (mdestReg == rs) & ~mm2Reg) fwd_A <= 2;
    else if (mwreg & (mdestReg != 0) & (mdestReg == rs) & mm2Reg) fwd_A <= 3;
    else fwd_A <= 0;
    
    if (ewreg & (edestReg != 0) & (edestReg == rt) & ~em2Reg) fwd_B <= 1;
    else if (mwreg & (mdestReg != 0) & (mdestReg == rt) & ~mm2Reg) fwd_B <= 2;
    else if (mwreg & (mdestReg != 0) & (mdestReg == rt) & mm2Reg) fwd_B <= 3;
    else fwd_B <= 0;

    //Normal Control
    case (op)
        6'b000000:  //r-type
        begin
            case (func)
                6'b100000:  //Add
                    begin
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b0010;
                        aluImm <= 0;
                        regrt <= 0;
                        jal <= 0;
                        shift <= 0;
                        sext <= 1;
                        pcsrc <= 2'd0;
                        regUsage <= 1;
                    end
                6'b100010:  //sub
                    begin
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b0110;
                        aluImm <= 0;
                        regrt <= 0;
                        jal <= 0;
                        shift <= 0;
                        sext <= 1;
                        pcsrc <= 2'd0;
                        regUsage <= 1;
                    end
                6'b100100:  //and
                    begin 
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b0000;
                        aluImm <= 0;
                        regrt <= 0;
                        jal <= 0;
                        shift <= 0;
                        sext <= 1;
                        pcsrc <= 2'd0;    
                        regUsage <= 1;                
                    end
                6'b100101:  //or
                    begin 
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b0001;
                        aluImm <= 0;
                        regrt <= 0; 
                        jal <= 0;
                        shift <= 0;
                        sext <= 1;
                        pcsrc <= 2'd0; 
                        regUsage <= 1;                  
                    end
                6'b100110:  //xor  
                    begin 
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b0111;  
                        aluImm <= 0;
                        regrt <= 0;  
                        jal <= 0;
                        shift <= 0;
                        sext <= 1;
                        pcsrc <= 2'd0; 
                        regUsage <= 1;                 
                    end
                6'b000000: //sll
                    begin 
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b1010;  
                        aluImm <= 0;
                        regrt <= 0;  
                        jal <= 0;
                        shift <= 1;
                        sext <= 1;
                        pcsrc <= 2'd0; 
                        regUsage <= 1;
                    end
                6'b000010: //srl
                    begin
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b1100;  
                        aluImm <= 0;
                        regrt <= 0;  
                        jal <= 0;
                        shift <= 1;
                        sext <= 1;
                        pcsrc <= 2'd0; 
                        regUsage <= 1;
                    end
                6'b000010: //sra
                    begin
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b1011;  
                        aluImm <= 0;
                        regrt <= 0;  
                        jal <= 0;
                        shift <= 1;
                        sext <= 1;
                        pcsrc <= 2'd0; 
                        regUsage <= 1;
                    end
            endcase
          end
        6'b100011:  //lw
            begin
                wreg <= 1;
                m2reg <= 1;
                wmem <= 0;
                aluc <= 4'b0010;
                aluImm <= 1;
                regrt <= 1;
                jal <= 0;
                shift <= 0;
                sext <= 1;
                pcsrc <= 2'd0; 
                regUsage <= 1;
            end
        6'b101011: //sw
            begin 
                wreg <= 0;
                m2reg <= 0;
                wmem <= 1;
                aluc <= 4'b0010;
                aluImm <= 1;
                regrt <= 1;
                jal <= 0;
                shift <= 0;
                sext <= 1;
                pcsrc <= 2'd0; 
                regUsage <= 1;
            end
        6'b001000: //addi   //not sure
            begin
                wreg <= 1;
                m2reg <= 0;
                wmem <= 0;
                aluc <= 4'b0010;
                aluImm <= 1;
                regrt <= 1;  
                jal <= 0;
                shift <= 0;
                sext <= 0;
                pcsrc <= 2'd0; 
                regUsage <= 1;
            end
        6'b001100:  //andi  //not sure
            begin
                wreg <= 1;
                m2reg <= 0;
                wmem <= 0;
                aluc <= 4'b0000;
                aluImm <= 1;
                regrt <= 1;  
                jal <= 0;
                shift <= 0;
                sext <= 0;
                pcsrc <= 2'd0; 
                regUsage <= 1;
            end
        6'b001101: //ori    //not sure
            begin 
                wreg <= 1;
                m2reg <= 0;
                wmem <= 0;
                aluc <= 4'b0001;
                aluImm <= 1;
                regrt <= 1;  
                jal <= 0;
                shift <= 0;
                sext <= 0;
                pcsrc <= 2'd0; 
                regUsage <= 1;
            end
        6'b001110: //xori
            begin 
                wreg <= 1;
                m2reg <= 0;
                wmem <= 0;
                aluc <= 4'b0111;
                aluImm <= 1;
                regrt <= 1;  
                jal <= 0;
                shift <= 0;
                sext <= 0;
                pcsrc <= 2'd0;
                regUsage <= 1;
            end
        6'b000100: //beq
            begin 
            if (RsrtEqu) pcsrc <= 2'd1;
            else pcsrc <= 2'd0;
            jal <= 0;
            shift <= 0;
            sext <= 1;
            regUsage <= 1;
            end
        6'b000101: //bne
            begin 
            if (RsrtEqu) pcsrc <= 2'd0;
            else pcsrc <= 2'd1;
            jal <= 0;
            shift <= 0;
            sext <= 1;
            regUsage <= 1;
            end
        6'b001111: //lui
            begin
                wreg <= 1;
                m2reg <= 0;
                wmem <= 0;
                aluc <= 4'b1110;
                aluImm <= 1;
                regrt <= 1;  
                jal <= 0;
                shift <= 0;
                sext <= 0;
                pcsrc <= 2'd0; 
                regUsage <= 0;
            end
        6'b000010: //j
            begin 
            pcsrc <= 2'd3;
            jal <= 0;
            shift <= 0;
            sext <= 1;
            wreg <= 0;
            wmem <= 0;
            regUsage <= 0;
            end
        6'b000011: //jal
            begin 
            jal <= 1;
            pcsrc <= 2'd3;
            shift <= 0;
            sext <= 1;
            wreg <= 1;
            wmem <= 0;
            regUsage <= 0;
            m2reg <= 0;
            end
        6'b000011: //jr
            begin 
            pcsrc <= 2'd2;
            jal <= 0;
            shift <= 0;
            sext <= 1;
            wreg <= 0;
            wmem <= 0;
            regUsage <= 0;
            end
    endcase
end

endmodule

module forwardMux(
    input [1:0] fwd,
    input [31:0] regOut, r, mr, mdo,
    
    output reg [31:0] q
);
always @ (*) begin
    case (fwd) 
        2'd0: q <= regOut;
        2'd1: q <= r;
        2'd2: q <= mr;
        2'd3: q <= mdo;
    endcase
end
endmodule

module jump(
    input [25:0] addr,
    input [31:0] dcp4,
    
    output [31:0] jpcFull
);
wire [31:0] jpc;
wire [29:0] temp;

assign temp = {4'd0, addr};
assign jpc = temp << 2;

assign jpcFull = {dcp4[31:28], jpc[27:0]};

endmodule

module Branch(
    input [15:0] imm,
    input [31:0] dpc4,
    
    //output [31:0] imm18
    output [31:0] bpc
);
assign bpc = {{{16'd0}, imm} << 2} + dpc4;

endmodule

module equCheck(
    input [31:0] qa, qb,
    
    output rsrtequ
);

assign rsrtequ = (qa == qb) ? 1'b1 : 1'b0;

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
    input wwreg,
    input [4:0] wdestReg,
    input [31:0] wbData,
    input clk,    
    
    output reg [31:0] qa,
    output reg [31:0] qb
);

reg [31:0] registers [0:31];

initial     //Initialize RegFile
begin
    registers[0] = 32'd0;
    registers[1] = 32'd0;
    registers[2] = 32'd0;
    registers[3] = 32'd0;
    registers[4] = 32'd0;
    registers[5] = 32'd0;
    registers[6] = 32'd0;
    registers[7] = 32'd0;
    registers[8] = 32'd0;
    registers[9] = 32'd0;
    registers[10] = 32'd0;
    registers[11] = 32'd0;
    registers[12] = 32'd0;
    registers[13] = 32'd0;
    registers[14] = 32'd0;
    registers[15] = 32'd0;
    registers[16] = 32'd0;
    registers[17] = 32'd0;
    registers[18] = 32'd0;
    registers[19] = 32'd0;
    registers[20] = 32'd0;
    registers[21] = 32'd0;
    registers[22] = 32'd0;
    registers[23] = 32'd0;
    registers[24] = 32'd0;
    registers[25] = 32'd0;
    registers[26] = 32'd0;
    registers[27] = 32'd0;
    registers[28] = 32'd0;
    registers[29] = 32'd0;
    registers[30] = 32'd0;
    registers[31] = 32'd0;
      
end

always @ (*) begin
    qa = registers[rs];
    qb = registers[rt];
end

always @ (negedge clk) begin
    if (wwreg) begin
        registers[wdestReg] <= wbData;
    end
end

endmodule

module ImmExt(
    input [15:0] imm,
    input sext,
    
    output reg [31:0] imm32
);

always @ (*) begin
    if (sext) imm32 <= {{17{imm[15]}}, imm[14:0]};
    else imm32 <= {{17'd0}, imm[14:0]};
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
    //For Bonus
    input jal, shift,
    input [31:0] dpc4,
    
    output reg owreg,
    output reg om2reg,
    output reg owmem,
    output reg [3:0] oaluc,
    output reg oaluimm,
    output reg [4:0] odestReg,
    output reg [31:0] oqa,
    output reg [31:0] oqb,
    output reg [31:0] oimm32,
    //For Bonus
    output reg ejal, eshift,
    output reg [31:0] epc4
);

always @ (posedge clk) begin
    owreg <= wreg;
    om2reg <= m2reg;
    owmem <= wmem;
    oaluc <= aluc;
    oaluimm <= aluimm;
    odestReg <= destReg;
    oqa <= qa;
    oqb <= qb;
    oimm32 <= imm32;
    ejal <= jal;
    eshift <= shift;
    epc4 <= dpc4;
end
endmodule

module InstDecode(
    input [31:0] dinstOut,
    input wwreg,
    input [4:0] wdestReg,
    input [31:0] wbData,
    input clk,
    //For Proj
    input [4:0] mdestReg,
    input mm2Reg, mwreg,
    input [4:0] edestReg,
    input em2Reg, ewreg,
    //PB
    input [31:0] dpc4, r, mr, mdo,
    
    output owreg,
    output om2reg,
    output owmem,
    output [3:0] oaluc,
    output oaluimm,
    output [4:0] odestReg,
    output [31:0] oqa,
    output [31:0] oqb,
    output [31:0] oimm32,
    //For Proj
    output wpcir,
    //For Proj Bonus
    output [1:0] pcsrc,
    output [31:0] jpcFull, bpc,
    output [31:0] ra,
    output ejal, eshift,
    output [31:0] epc4
);

    wire wreg;
    wire wm2reg;
    wire wwmem;
    wire [3:0] waluc;
    wire waluimm;
    wire [4:0] destReg;
    wire [31:0] wqa;
    wire [31:0] wqb;
    wire [31:0] wimm32;

    wire wrtMUX;
    
    //For Proj
    wire [1:0] fwd_A, fwd_B;
    wire [31:0] Fqa, Fqb;
    //For Proj Bonus
    wire jal, shift, sext;
    wire RsrtEqu;
    
    assign ra = Fqa;
    
Control c(dinstOut[31:26], dinstOut[5:0], dinstOut[25:21], dinstOut[20:16], mdestReg, mm2Reg, mwreg, edestReg, em2Reg, ewreg, RsrtEqu,    //input
     wreg, wm2reg, wwmem, waluc, waluimm, wrtMUX, fwd_A, fwd_B, wpcir, jal, shift, sext, pcsrc);             //Output
forwardMux fwdA(fwd_A, wqa, r, mr, mdo, Fqa);
forwardMux fwdB(fwd_B, wqb, r, mr, mdo, Fqb);
jump j(dinstOut[25:0], dpc4, jpcFull);
Branch b(dinstOut[16:0], dpc4, bpc);
equCheck equ(Fqa, Fqb, RsrtEqu);
regRTMux rtMux(dinstOut[20:16], dinstOut[15:11], wrtMUX, destReg);
regFile rf(dinstOut[25:21], dinstOut[20:16], wwreg, wdestReg, wbData, clk, wqa, wqb);
ImmExt extend(dinstOut[15:0], sext, wimm32);
IDEXEreg idexe1(wreg, wm2reg, wwmem, waluc, waluimm, destReg, Fqa, Fqb, wimm32, clk, jal, shift, dpc4,
     owreg, om2reg, owmem, oaluc, oaluimm, odestReg, oqa, oqb, oimm32, ejal, eshift, epc4);

endmodule