module halfAdderTb();

    reg A, B;
    wire Co, HS;
    integer i;

    halfAdder halfAdder1 (.A(A), .B(B), .Co(Co), .HS(HS));

    initial begin
        for(i=0; i<4; i=i+1) begin
            {A, B} = i;
            #20
            $display("%b + %b = %b%b", A, B, Co, HS);
        end
    end

endmodule