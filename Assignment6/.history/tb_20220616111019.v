module tb();
    reg ALUSrc;
    reg RST;
    reg [31:0] in1;
    reg [31:0] in2;
    wire [31:0] out;

    mux mux1(.IN1(in1), .IN2(in2), .OUT(out), .ALUSrc(ALUSrc), .RST(RST));

    initial begin
        RST=0;
        $display("%b   %b", RST, out);
        in1 = 32'b11111111111111111111111111111111;
        in1 = 32'b00000000000000000000000000000000;
        #10
        RST = 1;
        #20
        ALUSrc = 0;
        #10
        $display("%b", out);
        #20
        ALUSrc = 1;
        #10
        $display("%b", out);
    end


endmodule