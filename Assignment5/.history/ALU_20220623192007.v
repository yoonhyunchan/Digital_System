module ALU(ALUIN1, ALUIN2, ALUC, ALU_OUT, Zero);
    input [31:0] ALUIN1;
    input [31:0] ALUIN2;
    input [3:0] ALUC;
    output Zero;
    output reg [31:0] ALU_OUT;


    always @(*) begin
        
    end

    assign Zero = 0;
    
endmodule