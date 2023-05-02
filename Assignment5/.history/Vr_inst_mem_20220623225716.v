module Vr_inst_mem(ADDR, INST);
  input [31:0] ADDR;
  output reg [31:0] INST;

  always @ (ADDR)
  begin
    case(ADDR)
        0: INST = 32'h00000533; //  add a0, zero, zero
        4: INST = 32'h02800593; 
        8: INST = 32'h00000333; //  add   t1, zero, zero 
       12: INST = 32'h000002b3; //  add t0, zero, zero 
       16: INST = 32'H006003B3; //  add  t2, zero, t1  
       20: INST = 32'h00430313; //  addi  t1, t1, 4  
       24: INST = 32'h00530e33; //  add t3, t1, t0   
       28: INST = 32'h04be0063; //  beq t3, a1, .TLOOP  
       32: INST = 32'h0003A503; //  lw  a0, 0(t2)
       36: INST = 32'h0021D503; //  lw a2, 4(t2)
       40: INST = 32'h0023A503; //  blt a2, a0, .SWAP  
       44: INST = 32'hfcb344e3; //  blt t1, a1, .LOOP   
       48: INST = 32'h00a3a223; //  sw a0, 4(t2)  
       52: INST = 32'h00c3a023; //  sw a2, 0(t2)
       56: INST = 32'hfaa648e3; //  blt a2, a0, .LOOP
       60: INST = 32'h00000333; //  add t1, zero, zero  
       64: INST = 32'h00428293; //  addi t0, t0, 4  
       68: INST = 32'hf8b2cce3; //  blt to, a1, .LOOP
      //  68: INST = 32'h00a54533; //  xor a0, a0, a0
      //  72: INST = 32'h00008067; //  jalr    zero, 0(ra)
        default: INST = 32'h00000000;

    endcase
  end
endmodule