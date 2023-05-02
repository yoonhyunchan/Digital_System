module MEM_WB (RD_mem, AOUT_M, MDR_W, AOUT_W);
    
    input [31:0] RD_mem;
    input [31:0] AOUT_M;

    output reg [31:0] MDR_W;
    output reg [31:0] AOUT_W;


    always @(*) begin
        MDR_W <= RD_mem;
        AOUT_W <= AOUT_M;
    end
endmodule