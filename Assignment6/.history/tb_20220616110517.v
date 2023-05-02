module tb();

    reg [31:0] in1;
    reg [31:0] in2;
    wire [31:0] out;

    mux mux1(.IN1(in1), .IN2(in2), .OUT(out), .ALUSrc(ALUSrc));


    initial begin
        in = 12'b000110101011;
        #20
        $display("%b", out);
        #20
        in = 12'b111110101011;
        #20
        $display("%b", out);
    end


endmodule