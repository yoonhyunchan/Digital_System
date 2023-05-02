module Vr_inst_mem(ADDR, INST);
  input [31:0] ADDR;
  output reg [31:0] INST;

  integer i;


  always @ (ADDR)
  begin
    case(ADDR)
      // Bubble Sort
      0 : INST = 32'h00400713;//  addi a4, zero, 4
      4 : INST = 32'h00900593;//  addi a1, zero, 9
      8 : INST = 32'h00259593;//  slli a1, a1, 2
      12: INST = 32'h00000533;//  add a0, zero, zero
      16: INST = 32'h000002b3;//  add t0, zero, zero 
      20: INST = 32'h00000333;//  add t1, zero, zero
      24: INST = 32'h000003b3;//  add t2, zero, zero 
      // .LOOP
      28: INST = 32'h006483b3;//  add  t2, s1, t1  
      32: INST = 32'h00430313;//  addi  t1, t1, 4
      36: INST = 32'h00530e33;//  add t3, t1, t0  
      40: INST = 32'h04be0063;//  beq t3, a1, .TLOOP  
      44: INST = 32'h0003A503;//  lw a0, 0(t2)
      48: INST = 32'h000010ec;//  lw a2, 4(t2)
      52: INST = 32'h00a64863;//  blt a2, a0, .SWAP  
      56: INST = 32'hfc0004e3;//  beq zero, zero, .LOOP 
      // .SWAP 
      60: INST = 32'h00a3a223;//  sw a0, 4(t2)  
      64: INST = 32'h00c3a023;//  sw a2, 0(t2)
      68: INST = 32'hfa0008e3;//  beq zero, zero, .LOOP
      // .TLOOP
      72: INST = 32'h00000333;//  add t1, zero, zero  
      76: INST = 32'h00428293;//  addi t0, t0, 4  
      80: INST = 32'hf8b2cce3;//  blt t0, a1, .LOOP
      default: INST = 32'h00000000;
    endcase
    for (i=0; i<84; i=i+4)
        $display("\n%d, %b %b %b %b %b %b", ADDR, INST[31:25], INST[24:20], INST[19:15], INST[14:12], INST[11:7], INST[6:0]);
  end
endmodule