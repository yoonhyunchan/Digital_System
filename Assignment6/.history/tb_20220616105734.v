module tb();

    reg [11:0] input;
    wire [31:0] output;

    SignedExtension SignedExtension1(.sign_in(input), .sign_out(output));


    initial begin
        input = 12'b000110101011;
        #20
        $display("%b", output);
        #20
        input = 12'b111110101011;
        #20
        $display("%b", output);
    end


endmodule