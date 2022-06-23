## CMPEN	   331	   –	   Computer	   Organization	   and	 

## Design,	   Exam	   1	   Review	   Questions	 

 A. True	   or	   False.	   17	   points,	   1	   each.	   Circle	   T	   or	   F. 

T	   F	   1.	   The	   MIPS	   architecture	   has	   only	   32	   registers. 

T	   F	   2.	   The	   MIPS	   add	  instruction	   operates	   on	   register	   values	   as	   if	   they	   were	   signed	   integers	   in	   2's	 

 complement	   format.	 

T	   F	   3.	   The	   MIPS	   procedure	   call	   conventions	   require	   the	   first	   five	   arguments	   to	   be	   placed	   in	   registers	   $a0,	 

 $a1,	   $a2,	   $a3,	   $a4,	   and	   any	   remaining	   arguments	   to	   be	   placed	   on	   the	   stack. 

T	   F	   4.	   The	   acronym	   ISA	   is	   short	   for	   Instruction	   Set	   Architecture. 

T	   F	   5.	   The	   acronym	   PC	   is	   short	   for	   Program	   Counter.	 

 B. For	   the	   MIPS	   R-­‐format	   instructions,	   what	   are	   the	   field	   names,	   and	   how	   many	   bits	   do	   they	   contain? 

---

op, rs, rt, rd, shamt, funct 

6,	   5,	   5,	   5,	   5,	   6 

 C. Multiple choice. Circle only one of A, B, C, D in each part 1. The	   ________	   specifies	   the	   operation	   to	   be	   performed. 

 A.	   source	   operand	   reference B.	   opcode C.	   next	   instruction	   reference D.	   processor	   register 2. A(n)	   _________	   expresses	   operations	   in	   a	   concise	   algebraic	   form	   using	   variables. 

 A.	   opcode B.	   high-­‐level	   language C.	   machine	   language D.	   register 3. _________	   instructions	   provide	   computational	   capabilities	   for	   processing	   number	   data. 

 A.	   Boolean B.	   Logic C.	   Memory D.	   Arithmetic 

 4. Which	   of	   the	   following	   is	   a	   true	   statement? 

 A. a	   procedure	   can	   be	   called	   from	   more	   than	   one	   location B. a	   procedure	   call	   can	   appear	   in	   a	   procedure C. each	   procedure	   call	   is	   matched	   by	   a	   return	   in	   the	   called	   program D. all	   of	   the	   above 

 5. The	   entire	   set	   of	   parameters,	   including	   return	   address,	   which	   is	   stored	   for	   a	   procedure	 invocation	   is	   referred	   to	   as	   a	   _________. 

 A.	   branch B.	   stack	   frame C.	   pop D.	   push 

 D. Provide the type, assembly language instruction, and binary representation of instruction described by the following MIPS fields: (5 points) op = 0, rs = 3, rt = 2, rd = 3, shamt = 0, funct = 34 

 E. Computer A has an overall CPI of 1.3 and can be run at a clock rate of 600MHz. Computer B has a CPI of 2.5 and can be run at a clock rate of 750 Mhz. We have a particular program we wish to run. When compiled for computer A, this program has exactly 100,000 instructions. How many instructions would the program need to have when compiled for Computer B, in order for the two computers to have exactly the same execution time for this program? (6 points) 

---

F. Assume the following register contents: $t0 = 0xAAAAAAAA, $t1 = 0x12345678 

 i. For the register values shown above, what is the value of $t2 for the following sequence of instructions? (4 points) 

 sll $t2, $t0, 4 or $t2, $t2, $t1 

G. Short	   answer.	 

 write	   one	   MIPS	   assembler	   instruction;	   avoid	   pseudoinstructions.	   Underline	   the	   part	   of	   the	   instruction	 that	   indicates	   the	   addressing	   mode	   that	   you	   are	   illustrating. 

 The	   intent	   was,	   one	   complete	   instruction,	   not	   just	   the	   name	   of	   an	   instruction.	   The	   addressing	   mode	 refers	   to	   the	   operands,	   but	   we	   gave	   credit	   to	   underlined	   instruction	   names that	   were	   of	   the	   correct	 variety. 

 i. Give an example of an instruction that uses PC-Relative Addressing. 

 ii. Give an example of an instruction that uses Register Addressing. 

 iii. Which	   instruction	   should	   be	   used	   to	   load	   a	   single	   byte	   from	   memory	   to	   a	   register?	   (name	   of	 the	   instruction	   is	   sufficient) 

H. Using 32-bit IEEE 754 single precision floating point with one (1) sign bit, eight (8) exponent bits and twenty three (23) mantissa bits, show the representation of -11/16 (-0.6875). 

I. What decimal number does the bit pattern 0X0C000000 represent if it is a floating point number? Use the IEEE 754 standard single precision format. 

---

# Solution 

 A. True	   or	   False.	   17	   points,	   1	   each.	   Circle	   T	   or	   F. 

T	   F	   1.	   The	   MIPS	   architecture	   has	   only	   32	   registers. 

False.	   There	   are	   32	   general	   registers,	   plus	   PC,	   HI,	   LO,	   and	   some	   others	   we	   haven’t	   discussed	   yet,	   such	 

 as	   the	   floating-­‐point	   registers	   in	   Coprocessor	   1,	   and	   the	   interrupt-­‐related	   registers	   in	   Coprocessor	   0. 

T	   F	   2.	   The	   MIPS	   add instruction	   operates	   on	   register	   values	   as	   if	   they	   were	   signed	   integers	   in	   2's	 

 complement	   format. 

True. 

T	   F	   3.	   The	   MIPS	   procedure	   call	   conventions	   require	   the	   first	   five	   arguments	   to	   be	   placed	   in	   registers	   $a0,	 

 $a1,	   $a2,	   $a3,	   $a4,	   and	   any	   remaining	   arguments	   to	   be	   placed	   on	   the	   stack. 

False.	   Only	   four.	   The	   first	   argument	   must	   go	   into	   $a0,	 

T	   F	   4.	   The	   acronym	   ISA	   is	   short	   for	   Instruction	   Set	   Architecture. 

True. 

T	   F	   5.	   The	   acronym	   PC	   is	   short	   for	   Program	   Counter.	 

True. 

---

 B. For	   the	   MIPS	   R-­‐format	   instructions,	   what	   are	   the	   field	   names,	   and	   how	   many	   bits	   do	   they	   contain? 

op, rs, rt, rd, shamt, funct 

6,	   5,	   5,	   5,	   5,	   6 

 C. Multiple choice. Circle only one of A, B, C, D in each part 1. The	   ________	   specifies	   the	   operation	   to	   be	   performed. 

 A.	   source	   operand	   reference B.	   opcode C.	   next	   instruction	   reference D.	   processor	   register B 2. A(n)	   _________	   expresses	   operations	   in	   a	   concise	   algebraic	   form	   using	   variables. 

 A.	   opcode B.	   high-­‐level	   language C.	   machine	   language D.	   register B 3. _________	   instructions	   provide	   computational	   capabilities	   for	   processing	   number	   data. 

 A.	   Boolean B.	   Logic C.	   Memory D.	   Arithmetic D 

 4. Which	   of	   the	   following	   is	   a	   true	   statement? 

 E. a	   procedure	   can be	   called	   from	   more	   than	   one	   location F. a	   procedure	   call	   can	   appear	   in	   a	   procedure G. each	   procedure	   call	   is	   matched	   by	   a	   return	   in	   the	   called	   program H. all	   of	   the	   above D 

 5. The	   entire	   set	   of	   parameters,	   including	   return	   address,	   which	   is	   stored	   for	   a	   procedure	 invocation	   is	   referred	   to	   as	   a	   _________. 

 A.	   branch B.	   stack	   frame C.	   pop D.	   push B 

 D. Provide the type, assembly language instruction, and binary representation of instruction described by the following MIPS fields: (5 points) op = 0, rs = 3, rt = 2, rd = 3, shamt = 0, funct = 34 

---

 r-type, 

rs = $v1, rt = $v0 -> sub $v1, $v1, $v0 

 0x00621822 

 000000 00011 00010 00011 00000 100010 

 E. Computer A has an overall CPI of 1.3 and can be run at a clock rate of 600MHz. Computer B has a CPI of 2.5 and can be run at a clock rate of 750 Mhz. We have a particular program we wish to run. When compiled for computer A, this program has exactly 100,000 instructions. How many instructions would the program need to have when compiled for Computer B, in order for the two computers to have exactly the same execution time for this program? (6 points) 

 (CPUTime)A = (Instruction count)A * (CPI)A * (Clock cycle Time)A = (100,000)*(1.3)/(600*10^6 ) ns (CPUTime)B = (Instruction count)B * (CPI)B * (Clock cycle Time)B 

 = (I)B *(2.5)/(750*10^6 ) ns Since (CPUTime)A = (CPUTime)B, 

 we have to solve for (I)B and get 65000 

 F. Assume the following register contents: $t0 = 0xAAAAAAAA, $t1 = 0x12345678 

 ii. For the register values shown above, what is the value of $t2 for the following sequence of instructions? (4 points) 

 sll $t2, $t0, 4 or $t2, $t2, $t1 

 $t0 = 0xAAAAAAAA 

 $t0 = 1010 1010 1010 1010 1010 1010 1010 1010 

 $t2 = sll $t0 by 4 = 0xAAAAAAA0 

 = 10 10 1010 1010 1010 1010 1010 1010 0000 

 or $t2, $t1 

 $t2 = 10 10 1010 1010 1010 1010 1010 1010 0000 

 $t1 = 0001 0010 0011 0100 0101 0110 0111 1000 

 new $t2 = 1011 1010 1011 1110 1111 1110 1111 1000 

 = 0xBABEFEF8 

---

G. Short	   answer.	 

 write	   one	   MIPS	   assembler	   instruction;	   avoid	   pseudoinstructions.	   Underline	   the	   part	   of	   the	   instruction	 that	   indicates	   the	   addressing	   mode	   that	   you	   are	   illustrating. 

 The	   intent	   was,	   one	   complete	   instruction,	   not	   just	   the	   name	   of	   an	   instruction.	   The	   addressing	   mode	 refers	   to	   the	   operands,	   but	   we	   gave	   credit	   to	   underlined	   instruction	   names	   that	   were	   of	   the	   correct	 variety. 

 iv. Give an example of an instruction that uses PC-Relative Addressing. 

## bne $t0, $t1, Label 

## Jump is not correct example 

 v. Give an example of an instruction that uses Register Addressing. 

 add $t0, $t1, $t2 

 In	   general,	   any	   R-­‐format	   instruction	   (all	   three	   operands)	   or	   I-­‐format	   instruction	   (two	   operands). 

 vi. Which	   instruction	   should	   be	   used	   to	   load	   a	   single	   byte	   from	   memory	   to	   a	   register?	   (name	   of	 the	   instruction	   is	   sufficient) lb,	   or	   lbu 

H. Using 32-bit IEEE 754 single precision floating point with one (1) sign bit, eight (8) exponent bits and twenty three (23) mantissa bits, show the representation of -11/16 (-0.6875). 

 The	   representation	   of	   -­‐0.6875	   is: 

 1	   01111110	   01100000000000000000000000 

---

 I. What decimal number does the bit pattern 0X0C000000 represent if it is a floating-point number? Use the IEEE 754 standard single precision format. 

### 0X0C000000	   =	   0000	   1100	   0000	   0000	   0000	   0000	   0000	   0000 

### =	   0	   0001	   1000	   0000	   0000	   0000	   0000	   0000	   000 

sign	   is	   positive 

exp	   =	   0X18	   =	   24	   -­‐ 127	   =	   -­‐ 103	 

there	   is	   a	   hidden	   1 

mantissa	   =	   0 

answer	   =	   1.0	   X	   2-­‐^103 

Some	   reminders	   about	   MIPS	   instructions,	   derived	   from	   P&H	   COD	   and	   the	   MARS	   help	   information. The	   first	   column	   is	   the	   op value,	   the	   second	   is	   the	   funct value	   if	   needed;	   both	   are	   in	   decimal. 

None	   of	   these	   are	   pseudoinstructions. 

---

Penn	   State University School	   of	   Electrical	   Engineering	   and	   Computer	   Science Page	  **9** of	  **9** 

 0 32 add $t1, $t2, $t3 Memory addresses Segment 8 addi $t1, $t2, 100 0x7ffffffc ê $fp $sp 

 Stack 

 Stack frame Stack top 

 9 addiu $t1, $t2, 100 0 33 addu $t1, $t2, $t3 0 34 sub $t1, $t2, $t3 0 35 subu $t1, $t2, $t3 28 2 mul $t1, $t2, $t3 open 0 24 mult $t1, $t2 0 25 multu $t1, $t2 é 0 26 div $t1, $t2 Dynamic Data 0 27 divu $t1, $t2 0 36 and $t1, $t2, $t3 $gp 0x10000000 

 12 andi $t1, $t2, 100 Static Data 0 39 nor $t1, $t2, $t3 0 37 or $t1, $t2, $t3 0x0ffffffc $pc 0x00400000 

 13 ori $t1, $t2, 100 Text 0 38 xor $t1, $t2, $t3 14 xori $t1, $t2, 100 0x003ffffc 

 0x00000000 

 0 0 sll $t1, $t2, 10 Reserved 0 3 sra $t1, $t2, 10 

0 2 srl $t1, $t2, (^10) Predetermined	   (word)	   address boundaries	   are	   indicated. The	   boundary	   between	   Dynamic	   Data and	   Static	   Data is	   fixed,	   but	   its	   location depends	   on	   the	   program. $gp is	   set	   to	   0x10008000,	   and	   does not	   change. $pc is	   initialized	   to	   0x00400000. 32 lb $t1, 100($t2) 36 lbu $t1, 100($t2) 33 lh $t1, 100($t2) 37 lhu $t1, 100($t2) 15 lui $t1, 100 35 lw $t1, 100($t2) 40 sb $t1, 100($t2) 41 sh $t1, 100($t2) 43 sw $t1, 100($t2) 0 42 slt $t1, $t2, $t3 10 slti $t1, $t2, 100 11 sltiu $t1, $t2, 100 0 43 sltu $t1, $t2, $t3 4 beq $t1, $t2, label 5 bne $t1, $t2, label 2 j target 3 jal target 0 8 jr $t1 

## $zero 0 Constant 0 

## $at 1 Reserved for assembler 

## $v0, $v1 2, 3 Function return values 

## $a0 $a3 4 – 7 Function argument values 

## $t0 $t7 8 – 15 Temporary (caller saved) 

## $s0 $s7 16 – 23 Temporary (callee saved) 

## $t8, $t9 24, 25 Temporary (caller saved) 

## $k0, $k 1 26, 27 Reserved for OS Kernel 

## $gp 28 Pointer to Global Area 

## $sp 29 Stack Pointer 

## $fp 30 Frame Pointer 

## $ra 31 Return Address 

