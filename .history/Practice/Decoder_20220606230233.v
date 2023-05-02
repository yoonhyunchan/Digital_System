module decoder(Y, A, EN);
    parameter N = 2;
    parameter S = 4;
    input [N-1:0] A;
    input EN;
    output reg [S-1:0]Y;

    always @(*) begin
        Y = 0;
        if (EN == 1) Y[A] = 1;
    end
endmodule