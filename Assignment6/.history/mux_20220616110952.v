module mux(IN1, IN2, OUT, ALUSrc, RST);

input RST;
input ALUSrc;
input [31:0] IN1;
input [31:0] IN2;

output reg [31:0] OUT;
always @(*) begin
    if(RST == 0) OUT = 32'b0; else
        OUT = ALUSrc ? IN1 : IN2;
end

endmodule