module SignedExtension(sign_in, sign_out, RST);

    input RST;
    input [31:0] sign_in;
    output reg [31:0] sign_out;
    reg [11:0] immediate;



    always @(*) begin
        if(RST) immediate = 0;
        else begin
        if(sign_in[6:0] == 7'b1100011)
            immediate = {sign_in[31], sign_in[7], sign_in[30:25], sign_in[11:8]};
        else immediate = sign_in[31:20];
        

        sign_out[11:0] = immediate;
        sign_out[31:12] = immediate[11] ? 20'b1111_1111_1111_1111_1111: 20'b0; // Signed-Extension
        $display("sign_in:%b, immediate: %b, sign_out: %b", sign_in, immediate, sign_out);
        end
    end

endmodule