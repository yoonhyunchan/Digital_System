module decoder(Y, A, EN);
    parameter N = 3;
    parameter S = 8;
    input [1:0] A;
    input EN;
    output reg [3:0]Y;

    always @(*) begin
        Y = 0;
        if (EN == 1)
    end
endmodule