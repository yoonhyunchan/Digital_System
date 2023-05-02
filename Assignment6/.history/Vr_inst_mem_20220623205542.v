module Vr_inst_mem(ADDR, INST);
  input [31:0] ADDR;
  output reg [31:0] INST;

  always @ (ADDR)
  begin
    case(ADDR)
        0: INST = 32'h00000533; //  add a0, zero, zero
        4: INST = 32'h00000333; //  add   t1, zero, zero 
        8: INST = 32'h000002b3; //  add t0, zero, zero 
       12: INST = 32'h006483b3; //  add  t2, s1, t1  
       16: INST = 32'h00430313; //  addi  t1, t1, 4  
       20: INST = 32'h00530e33; //  add t3, t1, t0   
       24: INST = 32'h04be0063; //  beq t3, a1, .TLOOP  
       28: INST = 32'h000000ea; //  lw  a0, 0(t2)
       32: INST = 32'h000010ec; //  lw a2, 4(t2)
       36: INST = 32'h00a64863; //  blt a2, a0, .SWAP  
       40: INST = 32'hfcb314e3; //blt, a1, .LOOP   
       44: INST = 32'h00a3a223; //  sw a0, 4(t2)  
       48: INST = 32'h00c3a023; //  sw a2, 0(t2)
       52: INST = 32'hfac558e3; //  bge a0, a2, .LOOP
       56: INST = 32'h00000333; //  add t1, zero, zero  
       60: INST = 32'h00428293; //  addi t0, t0, 4  
       64: INST = 32'hf8559ce3; //  bne a1, t0, .LOOP
      //  68: INST = 32'h00a54533; //  xor a0, a0, a0
      //  72: INST = 32'h00008067; //  jalr    zero, 0(ra)
        default: INST = 32'h00000000;

    endcase
  end
endmodule