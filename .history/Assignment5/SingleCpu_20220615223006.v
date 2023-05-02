module SingleCpu(CLK, ADDR);
    input CLK;
    output reg [31:0] ADDR;

    
    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));

    always @(posedge CLK) begin
        ADDR = ADDR + 4;
    end




endmodule