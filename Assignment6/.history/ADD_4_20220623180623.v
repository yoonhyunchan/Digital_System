module ADD_4(IN, OUT);

    input [31:0] IN;
    output [31:0] OUT;

    assign OUT = IN +4;
    
    always @(*) begin
        $display("%b", IN, OUT);
    end

endmodule