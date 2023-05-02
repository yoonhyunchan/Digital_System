module ID_EX(PC_D4, RD1, RD2, signout, ALUSrc, ALUOp, branch, RW_mem, MemtoReg,   
PC_E4, A_E, B_E, IMM_E, EX_ALUSrc, EX_ALUOp, EX_branch, EX_memRW, EX_MemtoReg);

    input [31:0] PC_D4;
    input [31:0] RD1;
    input [31:0] RD2;
    input [31:0] signout;
    input ALUSrc;
    input [1:0] ALUOp;
    input branch;
    input RW_mem;
    input MemtoReg;

    output reg [31:0] PC_E4;
    output reg [31:0] A_E;
    output reg [31:0] B_E;
    output reg [31:0] IMM_E;
    output reg EX_ALUSrc;
    output reg [1:0] EX_ALUOp;
    output reg EX_branch;
    output reg EX_memRW;
    output reg EX_MemtoReg;
    



    always @(*) begin
        PC_E4 <= PC_D4;
        A_E <= RD1;
        B_E <= RD2;
        IMM_E <= signout;
        EX_ALUSrc <= ALUSrc;
        EX_ALUOp <= ALUOp;
        EX_branch <= branch;
        EX_memRW <= RW_mem;
        EX_MemtoReg <= MemtoReg;
    end


endmodule