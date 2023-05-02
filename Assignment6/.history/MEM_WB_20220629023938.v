module MEM_WB (RD_mem, AOUT_M, MEM_MemtoReg, MEM_RegWrite, WB_WR, 
MDR_W, AOUT_W, WB_MemtoReg, WB_RegWrite, MEM_WR, CLK, RST);
    
    input CLK;
    input RST;
    input [31:0] RD_mem;
    input [31:0] AOUT_M;
    input MEM_MemtoReg;
    input MEM_RegWrite;
    input [4:0] MEM_WR;

    output reg [31:0] MDR_W;
    output reg [31:0] AOUT_W;
    output reg WB_MemtoReg;
    output reg WB_RegWrite;
    output reg [4:0] WB_WR;


    always @(*) begin
        if(RST) begin
            MDR_W <= 0;
            AOUT_W <= 0;
            WB_MemtoReg <= 0;
            WB_RegWrite <= 0;
            WB_WR <= 0;
        end else begin
        MDR_W <= RD_mem;
        AOUT_W <= AOUT_M;
        WB_MemtoReg <= MEM_MemtoReg;
        WB_RegWrite <= MEM_RegWrite;
        WB_WR <= MEM_WR;
        // $display("%2t: MEM_WB", $time);
        end
    end
endmodule