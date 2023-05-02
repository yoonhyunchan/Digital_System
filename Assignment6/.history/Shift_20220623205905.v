module Shift(ShiftIn, ShiftOut);

    input [31:0] ShiftIn;
    output [31:0] ShiftOut;


    assign ShiftOut = ShiftIn >> 3;
always @(*) begin
    $display("ShiftIn: %b,ShiftOut: %b ", ShiftIn, ShiftOut);
    
end


endmodule