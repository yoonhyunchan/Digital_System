module mux(MUXIN1, MUXIN2, MUXOUT, SEL, RST, CLK);
input CLK;
input RST;
input SEL;
input [31:0] MUXIN1;
input [31:0] MUXIN2;

output reg [31:0] MUXOUT;

always @(posedge CLK) begin
    if(RST == 1) MUXOUT = 32'b0; 
    else
        MUXOUT = MUXIN1;
        
end

endmodule