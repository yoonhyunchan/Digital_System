module SingleCpu(CLK, INST);
    input CLK;
    output reg INST;

Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));

always @(posedge CLK) begin
    ADDR = ADDR + 4;
end




endmodule