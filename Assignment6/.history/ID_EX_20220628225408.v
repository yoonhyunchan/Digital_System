module ID_EX(PC_D4, RD1, RD2, signout, ALUSrc, ALUOp, branch, RW_mem, MemtoReg, WE, WR,   
PC_E4, A_E, B_E, IMM_E, EX_ALUSrc, EX_ALUOp, EX_branch, EX_memRW, EX_MemtoReg, EX_RegWrite, EX_WR);

    input [31:0] PC_D4;
    input [31:0] RD1;
    input [31:0] RD2;
    input [31:0] signout;
    input ALUSrc;
    input [1:0] ALUOp;
    input branch;
    input RW_mem;
    input MemtoReg;
    input WE;
    input [4:0] WR;

    output reg [31:0] PC_E4;
    output reg [31:0] A_E;
    output reg [31:0] B_E;
    output reg [31:0] IMM_E;
    output reg EX_ALUSrc;
    output reg [1:0] EX_ALUOp;
    output reg EX_branch;
    output reg EX_memRW;
    output reg EX_MemtoReg;
    output reg EX_RegWrite;
    output reg [4:0] EX_WR;
    



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
        EX_RegWrite <= WE;
        EX_WR <= WR;
        // $display("%2t: ID_EX", $time);
    end

// iverilog -o test Vr_inst_mem.v PipelinedCpu.v PipelinedCpu_tb.v Vr_register_file.v SignedExtension.v Vr_data_mem.v Control.v ALUcontrol.v mux.v ALU.v Shift.v ALU_ADD.v PC.v ADD_4.v ANDGATE.v IF_ID.v ID_EX.v EX_MEM.v MEM_WB.v
endmodule