module Control(ControlIn, RegWrite, ALUSrc);


input [6:0] ControlIn;

output reg branch;
output reg memRead;
output reg MemtoReg;
output reg ALUOp;
output reg
output reg
output reg
output reg 
output reg ALUSrc;
output reg RegWrite;

always @(*) begin
    case(ControlIn)
    7'b0110011: begin

        ALUSrc = 0;
        end
    7'b0010011: begin 
        ALUSrc = 1;
        end
    // 7'b1100011: $display("B-Type");
    // 7'b0100011: $display("S-Type");
    // 7'b0000011: $display("I(Load)-Type");



    endcase


end

endmodule