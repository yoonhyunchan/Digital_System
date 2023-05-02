module mux(MUXIN1, MUXIN2, MUXOUT, SEL, RST);

input RST;
input SEL;
input [31:0] MUXIN1;
input [31:0] MUXIN2;

output reg [31:0] MUXOUT;

always @(RST or MUXIN2) begin
    if(RST == 1) MUXOUT = 32'b0; else
        MUXOUT = SEL ? MUXIN2 : MUXIN1;
    $display("IN1: %d, IN2: %d, SEL: %b, OUT: %d", MUXIN1, MUXIN2, SEL, MUXOUT);
        
end

endmodule