module SignedExtension(sign_in, sign_out);

    input [31:0] sign_in;
    output reg [31:0] sign_out;
    wire [11:0] immediate;

    assign immediate = 
    assign sign_out[11:0] = sign_in;
    assign sign_out[31:12] = sign_in[11] ? 20'b1111_1111_1111_1111_1111: 20'b0; // Signed-Extension

endmodule