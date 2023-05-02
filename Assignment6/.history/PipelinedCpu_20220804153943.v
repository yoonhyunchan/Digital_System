module PipelinedCpu(CLK, RST, OUT);
    input CLK;
    input RST;

    // Vr_inst_mem
    wire [31:0] ADDR;
    wire [31:0] INST;
    

    // Vr_register_file
    reg [4:0] RR1; // Read Register1
    reg [4:0] RR2; // Read Register2
    wire [31:0] WD; // Write date
    wire 	WE; // Wriet Enable
    reg [4:0] WR;
    wire [31:0] RD1; // Read data1
    wire [31:0] RD2; // Read data2

    // Signed Extension
    reg [31:0] sign_in;
    wire [31:0] sign_out;

    reg [31:0] EA;

    // Vr_data_mem
    wire [31:0] ALU_OUT;
    wire RW_mem; /* 0: Read, 1: Write */
    wire [31:0] WD_mem;
    wire [31:0] RD_mem;

    // Control
    reg [6:0] ControlIn;
    wire RegWrite;
    wire ALUSrc;
    wire [1:0] ALUOp;

    // ALUControl
    reg [3:0] ALU_control_IN;
    wire [3:0] ALU_control_OUT;

    //MUX
    wire [31:0] MUXOUT;

    //MUX2
    wire branch;
    wire MemtoReg;

    //Shift
    wire [31:0] ShiftOut;

    //ALU_ADD
    wire [31:0] counter1;

    // mux2
    wire [31:0] MUXOUT_PC;
    wire Zero;

    // pc+4
    wire [31:0] counter0;

    //AND
    wire PCsrc;

    // IF_ID
    wire [31:0] IR_D;
    wire [31:0] PC_D4;

    //ID_EX
    wire [31:0] PC_E4;
    wire [31:0] A_E;
    wire [31:0] B_E;
    wire [31:0] IMM_E;
    wire EX_ALUSrc;
    wire [1:0] EX_ALUOp;
    wire EX_branch;
    wire EX_memRW;
    wire EX_MemtoReg;
    wire [4:0] EX_WR;

    // EX_MEM
    wire [31:0] nPC_M;
    wire [31:0] AOUT_M;
    wire [31:0] B_M;
    wire MEM_Zero;
    wire MEM_branch;
    wire MEM_memRW;
    wire MEM_MemtoReg;
    wire [4:0] MEM_WR;

    // MEM_WB
    wire [31:0] MDR_W;
    wire [31:0] AOUT_W;
    wire WB_MemtoReg;
    wire [4:0] WB_WR;
   

    output reg [31:0] OUT;


    PC PC1(.ADDR(MUXOUT_PC), .ADDROUT(ADDR), .CLK(CLK), .RST(RST));
    ADD_4 ADD_4_1(.IN(ADDR), .OUT(counter0));
    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));
    mux mux2(.MUXIN1(counter0), .MUXIN2(nPC_M), .MUXOUT(MUXOUT_PC), .SEL(PCsrc), .RST(RST));
    /////////////////////////////////////////////////////////////////////
    IF_ID IF_ID1(.INST(INST), .PC(counter0), .IR_D(IR_D), .PC_D4(PC_D4), .CLK(CLK), .RST(RST));
    /////////////////////////////////////////////////////////////////////
    Control Control1(.ControlIn(ControlIn), .branch(branch), .memRW(RW_mem), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .RegWrite(WE), .RST(RST));
    Vr_register_file Vr_register_file1(.CLK(CLK), .RST(RST), .RR1(RR1), .RR2(RR2), .WR(WB_WR), .WD(WD), .WE(WB_RegWrite), .RD1(RD1), .RD2(RD2));
    SignedExtension SignedExtension1(sign_in, sign_out, RST);
    /////////////////////////////////////////////////////////////////////
    ID_EX ID_EX1(.PC_D4(PC_D4), .RD1(RD1), .RD2(RD2), .signout(sign_out), .ALUSrc(ALUSrc), .ALUOp(ALUOp), .branch(branch), .RW_mem(RW_mem), .MemtoReg(MemtoReg), .WE(WE), .WR(WR), 
    .PC_E4(PC_E4), .A_E(A_E), .B_E(B_E), .IMM_E(IMM_E), .EX_ALUSrc(EX_ALUSrc), .EX_ALUOp(EX_ALUOp), 
    .EX_branch(EX_branch), .EX_memRW(EX_memRW), .EX_MemtoReg(EX_MemtoReg), .EX_RegWrite(EX_RegWrite), .EX_WR(EX_WR), .CLK(CLK), .RST(RST));
    /////////////////////////////////////////////////////////////////////
    ALU_ADD ALU_ADD1(.IN1(ADDR), .IN2(ShiftOut), .Counter1(counter1));
    Shift Shift1(.ShiftIn(IMM_E), .ShiftOut(ShiftOut));
    mux mux1(.MUXIN1(B_E), .MUXIN2(IMM_E), .MUXOUT(MUXOUT), .SEL(EX_ALUSrc), .RST(RST));
    ALUcontrol ALUcontrol1(EX_ALUOp, ALU_control_IN, ALU_control_OUT);
    ALU ALU1(.ALUIN1(A_E), .ALUIN2(MUXOUT), .ALUC(ALU_control_OUT), .ALU_OUT(ALU_OUT), .Zero(Zero));
    /////////////////////////////////////////////////////////////////////
    EX_MEM EX_MEM1(.counter1(counter1), .Zero(Zero), .ALU_OUT(ALU_OUT), .B_E(B_E), .EX_branch(EX_branch), .EX_memRW(EX_memRW), .nPC_M(nPC_M),.EX_MemtoReg(EX_MemtoReg), .EX_RegWrite(EX_RegWrite), .EX_WR(EX_WR), 
    .MEM_Zero(MEM_Zero), .AOUT_M(AOUT_M), .B_M(B_M), .MEM_branch(MEM_branch), .MEM_memRW(MEM_memRW), .MEM_MemtoReg(MEM_MemtoReg), .MEM_RegWrite(MEM_RegWrite), .MEM_WR(MEM_WR), .CLK(CLK), .RST(RST));
    /////////////////////////////////////////////////////////////////////
    Vr_data_mem Vr_data_mem1(.CLK(CLK), .ADDR(AOUT_M), .RW(MEM_memRW), .WD(B_M), .RD(RD_mem));
    /////////////////////////////////////////////////////////////////////
    ANDGATE ANDGATE1(.branch(MEM_branch), .Zero(MEM_Zero), .PCsrc(PCsrc));
    MEM_WB MEM_WB1(.RD_mem(RD_mem), .AOUT_M(AOUT_M),.MEM_MemtoReg(MEM_MemtoReg), .MEM_RegWrite(MEM_RegWrite), .MEM_WR(MEM_WR), .MDR_W(MDR_W), .AOUT_W(AOUT_W), .WB_MemtoReg(WB_MemtoReg), .WB_RegWrite(WB_RegWrite), .WB_WR(WB_WR), .CLK(CLK), .RST(RST));
    /////////////////////////////////////////////////////////////////////
    mux WB(.MUXIN1(MDR_W), .MUXIN2(AOUT_W), .MUXOUT(WD), .SEL(WB_MemtoReg), .RST(RST));
    /////////////////////////////////////////////////////////////////////    

    always @(*) begin 
        ControlIn = IR_D[6:0];
        RR1 = IR_D[19:15]; // Read Register1 입력 => RD1
        RR2 = IR_D[24:20]; // Read Register2 입력 => RD2
        WR = IR_D[11:7]; // Write Register 입력 (데이터를 쓸 레지스터 주소)
        sign_in = IR_D[31:0];
        ALU_control_IN = {IR_D[30], IR_D[14:12]};
        OUT = IR_D;
        if(ADDR == 84) $display("End");
    end


endmodule