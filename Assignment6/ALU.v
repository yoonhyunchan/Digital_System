module ALU(ALUIN1, ALUIN2, ALUC, ALU_OUT, Zero);
    input [31:0] ALUIN1;
    input [31:0] ALUIN2;
    input [3:0] ALUC;
    output reg Zero;
    output reg [31:0] ALU_OUT;
    reg [31:0] temp;


    always @(*) begin
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
                ALU_OUT = 32'bx;
                temp = ALUIN1 - ALUIN2;
                if (temp == 0) Zero = 1;
                else Zero = 0;
            end
            
            4'b1100: begin
                ALU_OUT = 32'bx;
                temp = ALUIN1 - ALUIN2;
                if (temp[31] == 0) Zero = 0;
                else Zero = 1;
            end
            4'b0011: begin
                Zero = 0;
                ALU_OUT = ALUIN1 << ALUIN2;
            end
            default:;
        endcase
    end

    
endmodule