module decoder(Y, A, EN);
    parameter N = 3;
    parameter S = 8;
    input [N-1:0] A;
    input EN;
    output reg [S-1:0]Y;

    always @(*) begin
        Y = 0;
        if (EN == 1)
    end
endmodule