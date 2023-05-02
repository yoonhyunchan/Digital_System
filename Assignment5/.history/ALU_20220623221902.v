module ALU(ALUIN1, ALUIN2, ALUC, ALU_OUT, Zero, CLK);
    input [31:0] ALUIN1;
    input [31:0] ALUIN2;
    input [3:0] ALUC;
    output reg Zero;
    output reg [31:0] ALU_OUT;


    always @(posedge CLK) begin
        case(ALUC)
            4'b0000:
            begin
                Zero = 0;
                ALU_OUT = ALUIN1 & ALUIN2;
            end
            4'b0001:begin
                Zero = 0;
                ALU_OUT = ALUIN1 | ALUIN2;
            end
            4'b0010:begin
                Zero = 0;
                ALU_OUT = ALUIN1 + ALUIN2;
            end
            4'b0110:begin
                Zero = 0;
                ALU_OUT = ALUIN1 - ALUIN2;
            end
            4'b1000:
            begin
                ALU_OUT = ALUIN1 - ALUIN2;
                if (ALU_OUT == 0) Zero = 1;
                else Zero = 0;
                $display("%d - %d = %b, Zero=%b", ALUIN1, ALUIN2, ALU_OUT, Zero);
            end
            
            4'b1100: begin
                ALU_OUT = ALUIN1 - ALUIN2;
                if (ALU_OUT < 0) Zero = 1;
                else Zero = 0;
                // $display("%d - %d = %b", ALUIN1, ALUIN2, ALU_OUT);
            end
        endcase
    end

    
endmodule