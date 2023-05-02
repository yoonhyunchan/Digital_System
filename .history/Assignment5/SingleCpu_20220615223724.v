module SingleCpu(CLK, OUT);
    input CLK;
    reg [31:0] ADDR;
    wire [31:0] INST;
    output reg [31:0] OUT;

    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(OUT));


    always @(posedge CLK) begin
        ADDR = ADDR + 4;
        $display("%b", ADDR);
    end

    always @(INST)




endmodule