module Control(ControlIn, branch, memRW, MemtoReg, ALUOp, ALUSrc, RegWrite);


input [6:0] ControlIn;

output reg branch;
output reg memRW;
output reg MemtoReg;
output reg [1:0] ALUOp;
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