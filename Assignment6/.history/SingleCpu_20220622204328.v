module SingleCpu(CLK, RST, OUT);
    input CLK;
    input RST;

    // Vr_inst_mem
    reg [31:0] ADDR;
    wire [31:0] INST;

    // Vr_register_file
    reg [4:0] RR1; // Read Register1
    reg [4:0] RR2; // Read Register2
    reg [4:0] WR; // Write Register
    reg [31:0] WD; // Write date
    reg 	WE; // Wriet Enable
    wire [31:0] RD1; // Read data1
    wire [31:0] RD2; // Read data2

    // Signed Extension
    reg [11:0] sign_in;
    wire [31:0] sign_out;

    reg [31:0] EA;

    // Vr_data_mem
    reg [31:0] ADDR_mem;
    reg RW_mem; /* 0: Read, 1: Write */
    wire [31:0] WD_mem;
    wire [31:0] RD_mem;

    // Control
    reg [6:0] ControlIn;
    wire RegWrite;
    wire ALUSrc;

    // ALUCIN
    reg [3:0] ALU_control_IN;

    //MUX
    wire [31:0] MUXOUT;


    output reg [31:0] OUT;

    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));
    Vr_register_file Vr_register_file1(CLK, RST, RR1, RR2, WR, WD, WE, RD1, RD2);
    Vr_data_mem Vr_data_mem1(.CLK(CLK), .ADDR(ADDR_mem), .RW(RW_mem), .WD(WD_mem), .RD(RD_mem));
    SignedExtension SignedExtension1(sign_in, sign_out);
    Control Control1(ControlIn, RegWrite, ALUSrc);
    ALUcontrol ALUcontrol1(ALU_control_IN, ALU_control_OUT);
    // ALU ALU1(ALU_COUT);
    mux mux1(.MUXIN1(RD2), .MUXIN2(sign_out), .MUXOUT(MUXOUT), .SEL(ALUSrc), .RST(RST));

    always @(posedge CLK) begin
        if (RST) ADDR <= 0; else begin
        ADDR <= ADDR + 4'b0100; // INST가 저장된다.
        end
    end
    always @(INST) begin 
        $display("%d, %b %b %b %b %b %b", ADDR, INST[31:25], INST[24:20], INST[19:15], INST[14:12], INST[11:7], INST[6:0]);
        ControlIn = INST[6:0];
        RR1 = INST[19:15]; // Read Register1 입력 => RD1
        RR2 = INST[24:20]; // Read Register2 입력 => RD2
        WR = INST[11:7]; // Write Register 입력 (데이터를 쓸 레지스터 주소)
        sign_in = INST[31:20];
        ALU_control_IN = {INST[30], INST[14:12]};
        $display("%b", MUXOUT);
        


        OUT = INST;
        


    end

    
    

endmodule