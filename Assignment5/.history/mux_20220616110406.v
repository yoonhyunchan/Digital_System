module mux(IN1, IN2, OUT, ALUSrc);

input ALUSrc;
input [31:0] IN1;
input [31:0] IN2;

output reg [31:0] OUT;

assign OUT = ALUSrc ? IN1 : IN2;

endmodule