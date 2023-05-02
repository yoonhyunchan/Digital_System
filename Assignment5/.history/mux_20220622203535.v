module mux(MUXIN1, MUXIN2, MUXOUT, SEL, RST);

input RST;
input ALUSrc;
input [31:0] MUXIN1;
input [31:0] MUXIN2;

output reg [31:0] MUXOUT;

always @(*) begin
    if(RST == 0) OUT = 32'b0; else
        MUXOUT = ALUSrc ? MUXIN1 : MUXIN2;
end

endmodule