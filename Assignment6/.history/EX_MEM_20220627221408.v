module EX_MEM (counter1, Zero, ALU_OUT, B_E, EX_branch, EX_memRW, nPC_M, MEM_Zero, AOUT_M, B_M, MEM_branch, MEM_memRW);

    input [31:0] counter1;
    input Zero;
    input [31:0] ALU_OUT;
    input [31:0] B_E;
    input EX_branch;
    input EX_memRW;

    output reg [31:0] nPC_M;
    output reg MEM_Zero;
    output reg [31:0] AOUT_M;
    output reg [31:0] B_M;
    output reg MEM_branch;
    output reg MEM_memRW;

    always @(*) begin
        nPC_M <= counter1;
        MEM_Zero <= Zero;
        AOUT_M <= ALU_OUT;
        B_M <= B_E;
        MEM_branch <= EX_branch;
    end


endmodule