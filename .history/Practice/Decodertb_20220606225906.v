module decodertb();

    reg [1:0] A;
    reg EN;
    wire [3:0] Y;

    decoder decoder1 (.Y(Y), .A(A), .EN(EN));

    initial begin
        EN = 0;
        A = 2'b00;
        #20
        $display("EN = 0, A = %b ==> Y = %b", A, Y);
        A = 2'b01;
        #20
        $display("EN = 0, A = %b ==> Y = %b", A, Y);
        A = 2'b10;
        #20
        $display("EN = 0, A = %b ==> Y = %b", A, Y);
        A = 2'b11;
        #20
        $display("EN = 0, A = %b ==> Y = %b", A, Y);

        EN = 0;
        A = 2'b00;
        #20
        $display("EN = 1, A = %b ==> Y = %b", A, Y);
        A = 2'b01;
        #20
        $display("EN = 1, A = %b ==> Y = %b", A, Y);
        A = 2'b10;
        #20
        $display("EN = 1, A = %b ==> Y = %b", A, Y);
        A = 2'b11;
        #20
        $display("EN = 1, A = %b ==> Y = %b", A, Y);

    end


endmodule