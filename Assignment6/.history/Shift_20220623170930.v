module Shift()

    input [31:0] ShiftIn;
    output [31:0] ShiftOut;


    assign ShiftOut = ShiftIn << 2;


endmodule