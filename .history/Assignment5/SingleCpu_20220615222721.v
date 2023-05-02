module SingleCpu(CLK);
    input CLK;
    output reg [31:0] ADDR;


always @(posedge CLK) begin
    ADDR = ADDR + 4;
end




endmodule