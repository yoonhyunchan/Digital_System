module Display(CLK, RST, WINNER_DISP, A_DISP, B_DISP, C_DISP);

    input CLK, RST;
    input [2:0] WINNER_DISP;
    input A_DISP, B_DISP, C_DISP;

    parameter S_INIT = 3'b000;
    parameter S_AW = 3'b100;
    parameter S_BW = 3'b010;
    parameter S_CW = 3'b001;
    parameter S_ABW = 3'b110;
    parameter S_ACW = 3'b101;
    parameter S_BCW = 3'b011;
    parameter S_DRAW = 3'b111;


    always @ (posedge CLK) begin
        @ (A_DISP, B_DISP, C_DISP) begin
            $display("[%1t]  A: %b, B: %b, C:",$realtime/10000, A_DISP, B_DISP, C_DISP);
            case(WINNER_DISP)
                S_AW: $display("[%1t]  Result: Winner is A!", $realtime/10000); 
                S_BW: $display("[%1t]  Result: Winner is B!", $realtime/10000);
                S_CW: $display("[%1t]  Result: Winner is C!", $realtime/10000);
                S_ABW: $display("[%1t]  Result: Winner is AB!", $realtime/10000);
                S_ACW: $display("[%1t]  Result: Winner is AC!", $realtime/10000);
                S_BCW: $display("[%1t]  Result: Winner is BC!", $realtime/10000);
                S_DRAW: $display("[%1t]  Result: DRAW!", $realtime/10000);
                default:;
            endcase
        end
    end
        



endmodule