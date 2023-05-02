module HGame(CLK, RST, A, B, C, WINNER_DISP, A_DISP, B_DISP, C_DISP);

    input CLK, RST, A, B, C;
    output reg [2:0] WINNER_DISP;
    output reg A_DISP, B_DISP, C_DISP;
    reg [2:0] Sreg;
    parameter S_INIT = 3'b000;
    parameter S_AS = 3'b100;
    parameter S_BS = 3'b010;
    parameter S_CS = 3'b001;
    parameter S_AW = 3'b100;
    parameter S_BW = 3'b010;
    parameter S_CW = 3'b001;
    parameter S_ABW = 3'b110;
    parameter S_ACW = 3'b101;
    parameter S_BCW = 3'b011;
    parameter S_DRAW = 3'b111;

    always @ (posedge CLK) begin
        @(A, B, C)
        if (RST == 1) begin
            {A_DISP, B_DISP, C_DISP} <=S_INIT;
            WINNER_DISP <=S_INIT;
        end
        else if ({A_DISP, B_DISP, C_DISP} == S_AS)
            case({A,B,C})
                S_INIT: WINNER_DISP <=S_INIT;
                S_AS: 
                    begin
                        {A_DISP, B_DISP, C_DISP} <= S_AS;
                        WINNER_DISP <=S_INIT;
                    end
                S_BS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_BS + S_AS;
                        WINNER_DISP <=S_ABW;
                    end
                S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_CS+ S_AS;
                        WINNER_DISP <=S_ACW;
                    end
                S_AS + S_BS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS;
                        WINNER_DISP <=S_ABW;
                    end
                S_AS +S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_CS;
                        WINNER_DISP <=S_ACW;
                    end
                S_BS+S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS + S_CS;
                        WINNER_DISP <=S_AW;
                    end
                S_AS + S_BS + S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS + S_CS;
                        WINNER_DISP <=S_AW;
                    end
            endcase
        else if ({A_DISP, B_DISP, C_DISP} == S_BS)
            case({A,B,C})
                S_INIT: WINNER_DISP <=S_INIT;
                S_AS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_BS + S_AS;
                        WINNER_DISP <=S_ABW;
                    end
                S_BS: 
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_BS;
                        WINNER_DISP <=S_INIT;
                    end
                S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_CS+ S_BS;
                        WINNER_DISP <=S_BCW;
                    end
                S_AS + S_BS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS;
                        WINNER_DISP <=S_ABW;
                    end
                S_AS +S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS + S_CS;
                        WINNER_DISP <=S_BW;
                    end
                S_BS+S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} =S_BS + S_CS;
                        WINNER_DISP <=S_BCW;
                    end
                S_AS + S_BS + S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS + S_CS;
                        WINNER_DISP <=S_BW;
                    end
            endcase
        else if ({A_DISP, B_DISP, C_DISP} == S_CS)
            case({A,B,C})
                S_INIT: WINNER_DISP <=S_INIT;
                S_AS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_CS;
                        WINNER_DISP <=S_ACW;
                    end
                S_BS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_BS + S_CS;
                        WINNER_DISP <=S_BCW;
                    end
                S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <= S_CS;
                        WINNER_DISP <=S_INIT;
                    end
                S_AS + S_BS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS + S_CS;
                        WINNER_DISP <=S_CW;
                    end
                S_AS +S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_CS;
                        WINNER_DISP <=S_ACW;
                    end
                S_BS+S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_BS + S_CS;
                        WINNER_DISP <=S_BCW;
                    end
                S_AS + S_BS + S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS + S_CS;
                        WINNER_DISP <=S_CW;
                    end
            endcase

        else begin
            case({A,B,C})
                S_INIT: 
                    begin 
                        {A_DISP, B_DISP, C_DISP} <=S_INIT;
                        WINNER_DISP <=S_INIT;
                    end
                S_AS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS;
                        WINNER_DISP <=S_INIT;
                    end
                S_BS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_BS;
                        WINNER_DISP <=S_INIT;
                    end
                S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_CS;
                        WINNER_DISP <=S_INIT;
                    end
                S_AS + S_BS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS;
                        WINNER_DISP <=S_CW;
                    end
                S_AS +S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS +S_CS;
                        WINNER_DISP <=S_BW;
                    end
                S_BS+S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_BS+S_CS;
                        WINNER_DISP <=S_AW;
                    end
                S_AS + S_BS + S_CS:
                    begin
                        {A_DISP, B_DISP, C_DISP} <=S_AS + S_BS + S_CS;
                        WINNER_DISP <=S_DRAW;
                    end
                default:;
            endcase
        end

    end



endmodule