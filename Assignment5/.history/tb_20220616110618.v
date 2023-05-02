module tb();
    reg ALUSrc;
    reg [31:0] in1;
    reg [31:0] in2;
    wire [31:0] out;

    mux mux1(.IN1(in1), .IN2(in2), .OUT(out), .ALUSrc(ALUSrc));

    initial begin
        in1 = 32'b11111111111111111111111111111111;
        in1 = 32'b00000000000000000000000000000000;
        #20

    end


endmodule