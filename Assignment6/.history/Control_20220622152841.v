module Control(ControlIn, RegWrite);


input [6:0] ControlIn;
output reg RegWrite;

always @(ControlIn) begin
    $display("%b", ControlIn);

end

endmodule