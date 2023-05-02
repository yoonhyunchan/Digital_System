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
        in1 = 32'b00001111111111111111111111111111;
        in1 = 32'b00000000000000000000000000000000;
        $display("in1: %b", in1);
        $display("in2: %b", in2);
        #10
        RST = 1;
        #20
        ALUSrc = 0;
        #10
        $display("%b   %b", RST, out);
        #20
        ALUSrc = 1;
        #10
        $display("%b   %b", RST, out);
    end


endmodule