module Mux(Y, D0, D1, S, EN);

    input [7:0] D0, D1;
    input S, EN;
    output [7:0]Y;

    assign Y = EN ? (S ? D1 : D0) : 8'b00000000;





endmodule