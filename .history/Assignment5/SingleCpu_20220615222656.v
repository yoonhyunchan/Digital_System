module SingleCpu(CLK, INST);
    input CLK;
    output reg [31:0] INST;
    reg [31:0] ADDR;


always @(posedge CLK) begin
    ADDR = ADDR + 4;
end




endmodule