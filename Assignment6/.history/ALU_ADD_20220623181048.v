module ALU_ADD(IN1, IN2, Counter1);

input [31:0] IN1;
input [31:0] IN2;
output [31:0] Counter1;

assign Counter1 = IN1 + IN2;
always @(*) begin
    // $display("ALU_ADD: %b %b %b", IN1, IN2, Counter1);
end


endmodule