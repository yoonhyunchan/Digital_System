module ALU(ALU_COUT);
    input ALU_COUT;

    always @(*) begin
        $display("%b", ALU_COUT);
    end
    
endmodule