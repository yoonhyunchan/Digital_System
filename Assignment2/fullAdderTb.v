module fullAdderTb();

    reg [3:0] A1, A0;
    reg [3:0] CIN;
    wire [3:0] Co, S;
    integer i;

    fullAdder U1 (.A1(A1), .A0(A0), .CIN(CIN), .S(S), .Co(Co));
    fullAdder U2 (.A1(A1), .A0(A0), .CIN(CIN), .S(S), .Co(Co));
    fullAdder U3 (.A1(A1), .A0(A0), .CIN(CIN), .S(S), .Co(Co));
    fullAdder U4 (.A1(A1), .A0(A0), .CIN(CIN), .S(S), .Co(Co));

    initial begin
        for(i=0; i<4; i=i+1) begin
            {A1, A0} = i;
            CIN = 1'b1;
            #20
            $display("%b + %b = %b%b", A1, A0, Co, S);
        end
    end

endmodule