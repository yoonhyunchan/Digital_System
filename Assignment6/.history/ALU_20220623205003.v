module ALU(ALUIN1, ALUIN2, ALUC, ALU_OUT, Zero);
    input [31:0] ALUIN1;
    input [31:0] ALUIN2;
    input [3:0] ALUC;
    output Zero;
    output reg [31:0] ALU_OUT;


    always @(*) begin
        case(ALUC)
            4'b0000:ALU_OUT = ALUIN1 & ALUIN2;
            4'b0001:ALU_OUT = ALUIN1 | ALUIN2;
            4'b0010:ALU_OUT = ALUIN1 + ALUIN2;
            4'b0110:ALU_OUT = ALUIN1 - ALUIN2;
            4'b1000:
            begin
                ALU_OUT = ALUIN1 - ALUIN2;
                if (ALU_OUT == 0) Zero = 1;
            end
            
            4'b1100: begin
                ALU_OUT = ALUIN1 - ALUIN2;
                if (ALU_OUT == 0) Zero = 1;
            end
        endcase
    end

    
endmodule