module Control(
    input [5:0] op,
    input [5:0] func,
    
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg [3:0] aluc,
    output reg aluImm,
    output reg regrt
);

always @(*) begin
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
                    end
//                6'b100010:  //sub
//                    begin
//                        wreg <= 1;
//                        m2reg <= 0;
//                        wmem <= 0;
//                        aluc <= 0110;
//                        aluImm <= 0;
//                        regrt <= 0;
//                    end
//                6'b100100:  //and
//                    begin 
//                        wreg <= 1;
//                        m2reg <= 0;
//                        wmem <= 0;
//                        aluc <= 0000;
//                        aluImm <= 0;
//                        regrt <= 0;                    
//                    end
//                6'b100101:  //or
//                    begin 
//                        wreg <= 1;
//                        m2reg <= 0;
//                        wmem <= 0;
//                        aluc <= 0001;
//                        aluImm <= 0;
//                        regrt <= 0;                    
//                    end
//                6'b100110:  //xor   // not sure
//                    begin 
//                        wreg <= 1;
//                        m2reg <= 0;
//                        wmem <= 0;
//                        aluc <= 0110;   //Unsure
//                        aluImm <= 0;
//                        regrt <= 0;                    
//                    end
//                6'b000000: //sll
//                    begin 
//                    end
//                6'b000010: //srl
//                    begin
//                    end
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
            end
//        6'b101011: //sw
//            begin 
//                wreg <= 0;
//                m2reg <= 0;
//                wmem <= 1;
//                aluc <= 0010;
//                aluImm <= 1;
//                regrt <= 1;
//            end
//        6'b001000: //addi   //not sure
//            begin
//                wreg <= 1;
//                m2reg <= 0;
//                wmem <= 0;
//                aluc <= 0010;
//                aluImm <= 1;
//                regrt <= 1;  
//            end
//        6'b001100:  //andi  //not sure
//            begin
//                wreg <= 1;
//                m2reg <= 0;
//                wmem <= 0;
//                aluc <= 0000;
//                aluImm <= 1;
//                regrt <= 1;  
//            end
//        6'b001101: //ori    //not sure
//            begin 
//                wreg <= 1;
//                m2reg <= 0;
//                wmem <= 0;
//                aluc <= 0001;
//                aluImm <= 1;
//                regrt <= 1;  
//            end
//        6'b001110: //xori
//            begin 
//            end
//        6'b000100: //beq
//            begin 
//            end
//        6'b000101: //bne
//            begin 
//            end
//        6'b001111: //lui
//            begin 
//            end
//        6'b000010: //j
//            begin 
//            end
//        6'b000011: //jal
//            begin 
//            end
    endcase
end

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
    
    output reg [31:0] imm32
);

always @ (*) begin
    imm32 <= {{17{imm[15]}}, imm[14:0]};
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
    
    output reg owreg,
    output reg om2reg,
    output reg owmem,
    output reg [3:0] oaluc,
    output reg oaluimm,
    output reg [4:0] odestReg,
    output reg [31:0] oqa,
    output reg [31:0] oqb,
    output reg [31:0] oimm32
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
end
endmodule

module InstDecode(
    input [31:0] dinstOut,
    input wwreg,
    input [4:0] wdestReg,
    input [31:0] wbData,
    input clk,
    
    output owreg,
    output om2reg,
    output owmem,
    output [3:0] oaluc,
    output oaluimm,
    output [4:0] odestReg,
    output [31:0] oqa,
    output [31:0] oqb,
    output [31:0] oimm32
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

Control c(dinstOut[31:26], dinstOut[5:0], wreg, wm2reg, wwmem, waluc, waluimm, wrtMUX);
regRTMux rtMux(dinstOut[20:16], dinstOut[15:11], wrtMUX, destReg);
regFile rf(dinstOut[25:21], dinstOut[20:16], wwreg, wdestReg, wbData, clk, wqa, wqb);
ImmExt extend(dinstOut[15:0], wimm32);
IDEXEreg idexe1(wreg, wm2reg, wwmem, waluc, waluimm, destReg, wqa, wqb, wimm32, clk, owreg, om2reg, 
    owmem, oaluc, oaluimm, odestReg, oqa, oqb, oimm32);

endmodule