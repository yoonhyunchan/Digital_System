module Control(ControlIn, RegWrite);


input ControlIn;
output reg RegWrite;

always @(ControlIn) begin
    $display("%b", ControlIn);

end

endmodule