module SingleCpu(CLK, RST, OUT);
    input CLK;
    input RST;

    // Vr_inst_mem
    wire [31:0] ADDR;
    wire [31:0] INST;

    // Vr_register_file
    reg [4:0] RR1; // Read Register1
    reg [4:0] RR2; // Read Register2
    reg [4:0] WR; // Write Register
    wire [31:0] WD; // Write date
    wire 	WE; // Wriet Enable
    wire [31:0] RD1; // Read data1
    wire [31:0] RD2; // Read data2

    // Signed Extension
    reg [31:0] sign_in;
    wire [31:0] sign_out;

    reg [31:0] EA;

    // Vr_data_mem
    wire [31:0] ADDR_mem;
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
    wire andout;


    output reg [31:0] OUT;

    PC PC1(.ADDR(MUXOUT_PC), .ADDROUT(ADDR), .CLK(CLK), .RST(RST));
    ADD_4 ADD_4_1(.IN(ADDR), .OUT(counter0));
    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));
    Vr_register_file Vr_register_file1(CLK, RST, RR1, RR2, WR, WD, WE, RD1, RD2);
    Vr_data_mem Vr_data_mem1(.CLK(CLK), .ADDR(ADDR_mem), .RW(RW_mem), .WD(RD2), .RD(RD_mem));
    SignedExtension SignedExtension1(sign_in, sign_out);
    Control Control1(.ControlIn(ControlIn), .branch(branch), .memRW(RW_mem), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .RegWrite(WE), .RST(RST));
    ALUcontrol ALUcontrol1(ALUOp, ALU_control_IN, ALU_control_OUT);
    ALU ALU1(.ALUIN1(RD1), .ALUIN2(MUXOUT), .ALUC(ALU_control_OUT), .ALU_OUT(ADDR_mem), .Zero(Zero));
    mux mux1(.MUXIN1(RD2), .MUXIN2(sign_out), .MUXOUT(MUXOUT), .SEL(ALUSrc), .RST(RST));
    Shift Shift1(.ShiftIn(sign_out), .ShiftOut(ShiftOut));
    ALU_ADD ALU_ADD1(.IN1(ADDR), .IN2(ShiftOut), .Counter1(counter1));
    mux mux2(.MUXIN1(counter0), .MUXIN2(counter1), .MUXOUT(MUXOUT_PC), .SEL(andout), .RST(RST));
    ANDGATE ANDGATE1(.branch(branch), .Zero(Zero), .andout(andout));
    mux mux3(.MUXIN1(RD_mem), .MUXIN2(ADDR_mem), .MUXOUT(WD), .SEL(MemtoReg), .RST(RST));

    always @(posedge CLK) begin
        $display("\n%d, %b %b %b %b %b %b", ADDR, INST[31:25], INST[24:20], INST[19:15], INST[14:12], INST[11:7], INST[6:0]);
        $display("%d %d WE: %b", RD1, RD2, WE);
    end
    always @(INST) begin 
        // $display("\n%d, %b %b %b %b %b %b", ADDR, INST[31:25], INST[24:20], INST[19:15], INST[14:12], INST[11:7], INST[6:0]);
        // $display("INST: %b", INST);
        // $display("RD1: %b, MUXOUT: %b, ALU_control_OUT: %b, ADDR_mem: %b", RD1, MUXOUT, ALU_control_OUT, ADDR_mem);
        // $display("ADDR: %b, ShiftOut: %b, counter1: %b", ADDR, ShiftOut, counter1);
        ControlIn = INST[6:0];
        RR1 = INST[19:15]; // Read Register1 입력 => RD1
        RR2 = INST[24:20]; // Read Register2 입력 => RD2
        WR = INST[11:7]; // Write Register 입력 (데이터를 쓸 레지스터 주소)
        sign_in = INST[31:0];
        ALU_control_IN = {INST[30], INST[14:12]};
        


        OUT = INST;
        


    end

    
    

endmodule