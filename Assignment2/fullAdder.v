module fullAdder(A1, A0, CIN, S, Co);

    input A1, A0, CIN;
    output S, Co;

    assign S = A1 ^ A0 ^ CIN;
    assign Co = A0&CIN | A1&CIN | A1&A0;


endmodule