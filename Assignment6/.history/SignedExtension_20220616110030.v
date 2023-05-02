module SignedExtension(sign_in, sign_out);

    input [11:0] sign_in;
    output [31:0] sign_out;

    assign sign_out[11:0] = sign_in;
    assign sign_out[31:12] = sign_in[11] ? 20'b1111_1111_1111_1111_1111: 20'b0; // Signed-Extension




endmodule