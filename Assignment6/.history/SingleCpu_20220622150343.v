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

    output reg [31:0] OUT;

    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));
    Vr_register_file Vr_register_file1(CLK, RST, RR1, RR2, WR, WD, WE, RD1, RD2);
    // Vr_data_mem Vr_data_mem1(.CLK(CLK), .ADDR(ADDR_mem), .RW(RW_mem), .WD(WD_mem), .RD(RD_mem));
    // SignedExtension SignedExtension1(sign_in, sign_out);

    always @(posedge CLK) begin
        if (RST) ADDR <= 0; else begin
        ADDR <= ADDR + 4'b0100; // INST가 저장된다.
        $display("%d, %b %b %b %b %b %b", ADDR, INST[31:25], INST[24:20], INST[19:15], INST[14:12], INST[11:7], INST[6:0]);
        end
    end

    always @(INST) begin 
        RR1 = INST[19:15]; // Read Register1 입력 => RD1
        RR2 = INST[24:20]; // Read Register2 입력 => RD2
        WR = INST[11:7]; // Write Register 입력 (데이터를 쓸 레지스터 주소)

        // Control
        if(INST[6:0] == 7'b0110011) // Rtype
            case(INST[14:12])
            3'b000: if (INST[31:25]==7'b0000000) WD = RD1 + RD2;
                    else if (INST[32:26]==7'b0100000) WD = RD1 - RD2;
            3'b001: WD = RD1 << RD2;
            3'b010: WD = (RD1 < RD2) ? 1:0;
            3'b011: WD = (RD1 < RD2) ? 1:0;
            3'b100: WD = RD1 ^ RD2;
            3'b101: if (INST[31:25]==7'b0000000) WD = RD1 >> RD2;
                    else if (INST[32:26]==7'b0100000) WD = RD1 >> RD2;
            3'b110: WD = RD1 | RD2;
            3'b111: WD = RD1 & RD2;
            default:;
            endcase
        else if (INST[6:0] == 7'b0010011) begin// I-type
            
            sign_in = INST[31:20];
            case(INST[14:12])
            3'b000: WD = RD1 + sign_out; //addi
            3'b101: WD = RD1 >> sign_out; // SRLI: rs >> imm
            3'b010: begin  // LW
                EA = RD1 + sign_out;
                ADDR_mem = EA;
                WD = RD_mem;
            end
            default;
            endcase
        end
        OUT = INST;
    end
    

endmodule