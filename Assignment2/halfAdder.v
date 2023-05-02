module halfAdder(A, B, Co, HS);

    input A, B;
    output Co, HS;

    assign {Co, HS} = A+B;

endmodule