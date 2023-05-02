module Control(ControlIn, RegWrite);


input [6:0] ControlIn;
output reg RegWrite;

always @(ControlIn) begin
    case(ControlIn)
    7'b0110011:


    endcase


end

endmodule