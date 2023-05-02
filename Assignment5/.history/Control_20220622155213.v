module Control(ControlIn, RegWrite);


input [6:0] ControlIn;
output reg RegWrite;

always @(*) begin
    case(ControlIn)
    7'b0110011: $display("R-Type");
    7'b0010011: $display("I-Type");
    7'b1100011: $display("B-Type");
    7'b0100011: $display("S-Type");
    7'b0000011: $display("I(Load)-Type");



    endcase


end

endmodule