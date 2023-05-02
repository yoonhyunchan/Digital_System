module SingleCpu(CLK, OUT);
    input CLK;
    reg [31:0] ADDR;
    output reg [31:0] OUT;
    wire INST;

    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));


    always @(posedge CLK) begin
        ADDR = ADDR + 4;
        $display("%b", ADDR);
    end




endmodule