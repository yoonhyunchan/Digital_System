module MuxTb ();

    reg [7:0] D0, D1;
    reg EN, S;
    wire [7:0] Y;


    Mux Mux1 (.Y(Y), .D0(D0), .D1(D1), .S(S), .EN(EN));
    initial begin
        D0 = 8'b00000000;
        D1 = 8'b11111111;
        EN = 0;
        #20
        S=0;
        #20
        $display("EN:%b, S=%b, Y=%b", EN, S, Y);
        S=1;
        #20
        $display("EN:%b, S=%b, Y=%b", EN, S, Y);
        EN = 1;
        #20
        S = 0;
        #20
        $display("EN:%b, S=%b, Y=%b", EN, S, Y);
        S=1;
        #20
        $display("EN:%b, S=%b, Y=%b", EN, S, Y);


    end

endmodule