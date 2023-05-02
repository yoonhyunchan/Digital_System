module SignedExtension(sign_in, sign_out);

    input [11:0] sign_in;
    output [31:0] sign_out;

    assign sign_out[15:0] = sign_in;
    assign sign_out[31:16] = sign_in[15] ? 16'b1111_1111_1111_1111: 16'b0; // Signed-Extension




endmodule