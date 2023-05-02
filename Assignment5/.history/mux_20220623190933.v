module mux(MUXIN1, MUXIN2, MUXOUT, SEL, RST);

input RST;
input SEL;
input [31:0] MUXIN1;
input [31:0] MUXIN2;

output reg [31:0] MUXOUT;

always @(RST or SEL) begin
    if(RST == 0) MUXOUT = 32'b0; else
        MUXOUT = SEL ? MUXIN1 : MUXIN2;
        
end

endmodule