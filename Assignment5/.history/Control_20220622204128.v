module Control(ControlIn, RegWrite, ALUSrc);


input [6:0] ControlIn;
output reg ALUSrc;
output reg RegWrite;

always @(*) begin
    case(ControlIn)
    7'b0110011: begin
        $display("R-Type")
        ALUSrc = 0; 
        end
    7'b0010011: begin 
        $display("I-Type")
        ALUSrc = 1; 
        end
    7'b1100011: $display("B-Type");
    7'b0100011: $display("S-Type");
    7'b0000011: $display("I(Load)-Type");



    endcase


end

endmodule