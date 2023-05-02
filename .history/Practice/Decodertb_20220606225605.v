module decodertb();

    reg [1:0] A;
    reg EN;
    wire [3:0] Y;

    decoder decoder(Y, A, EN);

    initial begin
        EN = 0;
        A = 2'b00;
        #10
        $display("EN = 0, A = %b ==> Y = %b", A, Y);
        A = 2'b01;
        #10
        $display("EN = 0, A = %b ==> Y = %b", A, Y);
        A = 2'b10;
        #10
        $display("EN = 0, A = %b ==> Y = %b", A, Y);
        A = 2'b11;
        #10
        $display("EN = 0, A = %b ==> Y = %b", A, Y);

        EN = 0;
        A = 2'b00;
        #10
        $display("EN = 1, A = %b ==> Y = %b", A, Y);
        A = 2'b01;
        #10
        $display("EN = 1, A = %b ==> Y = %b", A, Y);
        A = 2'b10;
        #10
        $display("EN = 1, A = %b ==> Y = %b", A, Y);
        A = 2'b11;
        #10
        $display("EN = 1, A = %b ==> Y = %b", A, Y);

    end


endmodule