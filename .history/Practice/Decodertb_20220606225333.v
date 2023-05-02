module decodertb();

    reg [2:0] A;
    reg EN;
    wire Y;

    initial begin
        EN = 0;
        A = 4'b0000;
        $display("EN = 0, A = %b ==> Y = %b", A, Y);
        A = 4'b0001;
        #10
        $display("EN = 0, A = %b ==> Y = %b", A, Y);
        A = 4'b0001;
        #10
        $display("EN = 0, A = %b ==> Y = %b", A, Y);
        A = 4'b0001;
        #10
        $display("EN = 0, A = %b ==> Y = %b", A, Y);

        EN = 0;
        A = 4'b0000;
        #10
        $display("EN = 1, A = %b ==> Y = %b", A, Y);
        A = 4'b0001;
        #10
        $display("EN = 1, A = %b ==> Y = %b", A, Y);
        A = 4'b0001;
        #10
        $display("EN = 1, A = %b ==> Y = %b", A, Y);
        A = 4'b0001;
        #10
        $display("EN = 1, A = %b ==> Y = %b", A, Y);

    end


endmodule