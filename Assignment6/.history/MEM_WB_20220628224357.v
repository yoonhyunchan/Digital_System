module MEM_WB (RD_mem, AOUT_M, MEM_MemtoReg, MEM_RegWrite,
MDR_W, AOUT_W, WB_MemtoReg, WB_RegWrite);
    
    input [31:0] RD_mem;
    input [31:0] AOUT_M;
    input MEM_MemtoReg;
    input MEM_RegWrite;

    output reg [31:0] MDR_W;
    output reg [31:0] AOUT_W;
    output reg WB_MemtoReg;
    output reg WB_RegWrite;


    always @(*) begin
        MDR_W <= RD_mem;
        AOUT_W <= AOUT_M;
        WB_MemtoReg <= MEM_MemtoReg;
        WB_RegWrite <= MEM_RegWrite;
        // $display("%2t: MEM_WB", $time);
    end
endmodule