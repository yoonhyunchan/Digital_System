module tb();

    reg [11:0] in;
    wire [31:0] out;

    SignedExtension SignedExtension1(.sign_in(in), .sign_out(out));


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