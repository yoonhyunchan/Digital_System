module MEM_WB (RD_mem, AOUT_M, MEM_MemtoReg,
MDR_W, AOUT_W, WB_MemtoReg);
    
    input [31:0] RD_mem;
    input [31:0] AOUT_M;
    input MEM_MemtoReg;

    output reg [31:0] MDR_W;
    output reg [31:0] AOUT_W;
    output reg WB_MemtoReg;


    always @(*) begin
        MDR_W <= RD_mem;
        AOUT_W <= AOUT_M;
        WB_MemtoReg <= MEM_MemtoReg;
    end
endmodule