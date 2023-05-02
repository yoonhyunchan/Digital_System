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
        if (RST) ADDR = 0; else begin
        ADDR <= ADDR + 4'b0100;
        $display("%b", INST);
        end
    end

    always @(INST) begin 
        RR1 = INST[19:15];
        RR2 = INST[24:20];
        WR = INST[11:7];
        $display("%d %d", RD1, RD2);
        // Control
        if(INST[6:0] == 7'b0110011) // Rtype
            case(INST[14:12])
            3'b000: if (INST[31:25]==7'b0000000)$display("add");
                    else if (INST[32:26]==7'b0100000)$display("sub");
            3'b001: $display("sll");
            3'b010: $display("slt");
            3'b011: $display("sltu");
            3'b100: $display("xor");
            3'b101: if (INST[31:25]==7'b0000000)$display("srl");
                    else if (INST[32:26]==7'b0100000)$display("srt");
            3'b110: $display("or");
            3'b111: $display("and");
            endcase

        OUT = INST;
    end


endmodule