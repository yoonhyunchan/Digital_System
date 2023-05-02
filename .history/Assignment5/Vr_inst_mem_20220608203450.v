module Vr_inst_mem(ADDR, INST);
  input [31:0] ADDR;
  output reg [31:0] INST;

  always @ (ADDR)
  begin
    case(ADDR)
        /* at the time of reset, registers are initialized with their index
           i.e., $r0 = 0, $r1 = 1, $r2 = 2, ..., $r31 = 31 */
      /* Put your instruction */
      //   0: INST = 32'hAC000064; /* mem[100] <- 0; sw $r0, 100($r0); 101011 base:00000, rt:00000, offset:0000000001100100 */
      //   4: INST = 32'hAC800064; /* mem[104] <- 0; sw $r0, 100($r4); 101011 base:00100, rt:00000, offset:0000000001100100 */
      //   8: INST = 32'h8C070064; /* i(r7) <- mem[100]; lw $r7, 100($r0); 100011 base:00000, rt:00111, offset:0000000001100100 */
      //  12: INST = 32'h8C080068; /* sum(r8) <- mem[104]; lw $r8, 104($r0); 100011 base:00000, rt:01000, offset:0000000001101000 */
      //  16: INST = 32'h00E13820; /* i($r7) = i($r7) + 1($r1); add $r7, $r7, $r1; 000000 rs:00111, rt:00001, rd:00111, shamt:00000, funct:100000  */
      //  20: INST = 32'h01074020; /* sum($r8) = sum($r8) + i($r7); add $r8, $r8, $r7; 000000 rs:01000, rt:00111, rd:01000, shamt:00000, funct:100000  */
      //  24: INST = 32'h00674822; /* sub $r9, $r3, $r7; 000000 rs:00011, rt:00111, rd:01001, shamt:00000, funct:100010 */
      //  28: INST = 32'h1122FFFC; /* beq $r9, $r2, -4; 000100 rs:01001, rt:00010, offset:1111111111111100 */
      //  32: INST = 32'h1121FFFB; /* beq $r9, $r1, -5; 000100 rs:01001, rt:00001, offset:1111111111111011 */
      //  36: INST = 32'h1120FFFA; /* beq $r9, $r0, -6; 000100 rs:01001, rt:00000, offset:1111111111111010 */
      //  40: INST = 32'hAC08006C; /* mem[108] <- r8; sw $r8, 108($r0); 101011 base:00000, rt:01000, offset:0000000001101100 */
      //  44: INST = 32'h8C0A006C; /* return($r10) <- mem[108]; lw $r10, 108($r0); 100011 base:00000, rt:01010, offset:0000000001101100 */
      //  48: INST = 32'h1000FFF3; /* beq $r0, $r0, -13; 000100 rs:00000, rt:00000, offset:1111111111110011 */

        0: INST = 32'h00000533 //  add a0, zero, zero
        4: INST = 32'h00000333 //    add   t1, zero, zero 
        8: INST = 32'h000002b3 //  add t0, zero, zero 
       12: INST = 32'h006483b3 //  add  t2, s1, t1  
       16: INST = 32'h00430313 //  addi  t1, t1, 4  
       20: INST = 32'h00530e33 //  add t3, t1, t0   
       24: INST = 32'h04be0063 //  beq t3, a1, .TLOOP  
       28: INST = 32'h000000ea //  lw  a0, 0(t2)
       32: INST = 32'h000010ec //    lw a2, 4(t2)
       36: INST = 32'h00c55863 //    bge a0, a2, .SWAP  
       40: INST = 32'hfcb314e3 //  bne t1, a1, .LOOP   
       44: INST = 32'h00a3a223 //    sw a0, 4(t2)  
       48: INST = 32'h00c3a023 //    sw a2, 0(t2)
       52: INST = 32'hfac558e3 //    bge a0, a2, .LOOP
       56: INST = 32'h00000333 //  add t1, zero, zero  
       60: INST = 32'h00428293 //  addi t0, t0, 4  
       64: INST = 32'hf8559ce3 //  bne a1, t0, .LOOP
       68: INST = 32'h00a54533 //  xor a0, a0, a0
       72: INST = 32'h00008067 //  jalr    zero, 0(ra)
        default: INST = 32'h00000000;
    endcase
  end
endmodule
