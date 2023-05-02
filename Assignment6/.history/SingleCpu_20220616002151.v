module SingleCpu(CLK, RST, OUT);
    input CLK;
    input RST;
    reg [31:0] ADDR;
    wire [31:0] INST;
    reg [4:0] RR1; // Read Register1
    reg [4:0] RR2; // Read Register2
    reg [4:0] WR; // Write Register
    reg [31:0] WD; // Write date
    reg 	WE; // Wriet Enable
    wire [31:0] RD1; // Read data1
    wire [31:0] RD2; // Read data2
    output reg [31:0] OUT;

    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));
    Vr_register_file Vr_register_file1(CLK, RST, RR1, RR2, WR, WD, WE, RD1, RD2);

    always @(posedge CLK) begin
        if (RST) ADDR <= 0; else begin
        ADDR <= ADDR + 4'b0100;
        $display("%b %b %b %b %b %b", INST[31:25], INST[24:20], INST[19:15], INST[14:12], INST[11:7], INST[6:0]);
        end
    end

    always @(INST) begin 
        RR1 = INST[19:15];
        RR2 = INST[24:20];
        WR = INST[11:7];
        $display("%d %d", RD2, RD1);
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
            endcase
        // else if (INST[6:0] == 7'0010011) // I-type
        OUT = INST;
    end


endmodule