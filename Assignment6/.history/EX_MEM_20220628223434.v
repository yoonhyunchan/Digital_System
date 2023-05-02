module EX_MEM (counter1, Zero, ALU_OUT, B_E, EX_branch, EX_memRW, EX_MemtoReg, EX_RegWrite,
nPC_M, MEM_Zero, AOUT_M, B_M, MEM_branch, MEM_memRW, MEM_MemtoReg, MEM_RegWrite);

    input [31:0] counter1;
    input Zero;
    input [31:0] ALU_OUT;
    input [31:0] B_E;
    input EX_branch;
    input EX_memRW;
    input EX_MemtoReg;
    input EX_RegWrite;

    output reg [31:0] nPC_M;
    output reg MEM_Zero;
    output reg [31:0] AOUT_M;
    output reg [31:0] B_M;
    output reg MEM_branch;
    output reg MEM_memRW;
    output reg MEM_MemtoReg;
    output reg MEM_RegWrite;

    always @(*) begin
        nPC_M <= counter1;
        MEM_Zero <= Zero;
        AOUT_M <= ALU_OUT;
        B_M <= B_E;
        MEM_branch <= EX_branch;
        MEM_memRW <= EX_memRW;
        MEM_MemtoReg <= EX_MemtoReg;
        MEM_RegWrite <= EX_RegWrite;
    end
    $display("%2t: EX_MEM", $time);

endmodule