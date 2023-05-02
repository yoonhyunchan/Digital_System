`timescale 1ns/1ps
module HGameTb();

    reg A, B, C, CLK, RST;
    wire [2:0] WINNER_DISP;
    wire A_DISP, B_DISP, C_DISP;
    integer i;

    HGame HGame1(CLK, RST, A, B, C, WINNER_DISP, A_DISP, B_DISP, C_DISP);
    Display Display1 (CLK, RST, WINNER_DISP, A_DISP, B_DISP, C_DISP);

initial begin
    CLK <= 1;

    #20 {A,B,C} = 3'b000;
    #20 {A,B,C} = 3'b011;
    #20 {A,B,C} = 3'b101;
    #20 {A,B,C} = 3'b110;
    #20 {A,B,C} = 3'b111;

    #20 {A,B,C} = 3'b001;
    #20 {A,B,C} = 3'b100;

    #20 {A,B,C} = 3'b001;
    #20 {A,B,C} = 3'b010;

    #20 {A,B,C} = 3'b001;
    #20 {A,B,C} = 3'b110;

    #20 {A,B,C} = 3'b001;
    #20 {A,B,C} = 3'b101;

    #20 {A,B,C} = 3'b001;
    #20 {A,B,C} = 3'b011;

    #20 {A,B,C} = 3'b001;
    #20 {A,B,C} = 3'b111;


    #20 {A,B,C} = 3'b010;
    #20 {A,B,C} = 3'b100;

    #20 {A,B,C} = 3'b010;
    #20 {A,B,C} = 3'b010;

    #20 {A,B,C} = 3'b010;
    #20 {A,B,C} = 3'b101;

    #20 {A,B,C} = 3'b010;
    #20 {A,B,C} = 3'b110;

    #20 {A,B,C} = 3'b010;
    #20 {A,B,C} = 3'b111;




    #20 {A,B,C} = 3'b100;
    #20 {A,B,C} = 3'b010;


    #20 {A,B,C} = 3'b100;
    #20 {A,B,C} = 3'b101;

    #20 {A,B,C} = 3'b100;
    #20 {A,B,C} = 3'b100;

    #20 {A,B,C} = 3'b100;
    #20 {A,B,C} = 3'b110;

    #20 {A,B,C} = 3'b100;
    #20 {A,B,C} = 3'b011;

    #20 {A,B,C} = 3'b100;
    #20 {A,B,C} = 3'b111;
    
    
end

always begin
    #5 CLK =0; #5 CLK=1;

end

endmodule