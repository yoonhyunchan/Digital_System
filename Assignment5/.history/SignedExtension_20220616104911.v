module SignedExtension();

    input sign_in;
    output reg sign_out;

    sign_out[15:0] = sign_in;
    sign_out[31:16] = sign_in[15] ? 16'b1111_1111_1111_1111: 16'b0; // Signed-Extension




endmodule