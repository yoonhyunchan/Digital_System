module tb();

    reg [11:0] input;
    wire [31:0] output;

    SignedExtension SignedExtension1(.sign_in(input), .sign_out(output));
    


endmodule