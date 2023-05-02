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
    7'b0110011: begin // R-Type
        $display("ControlIn: %b, R-Type", ControlIn);
        $display("branch: %b", branch);
        ALUOp = 2'b10;  
        ALUSrc = 0;
        branch = 0;
        RegWrite = 0;
        memRW = 0;
        end
    7'b0010011: begin // I-type
        $display("ControlIn: %b, I-Type", ControlIn);
        ALUOp = 2'b10; 
        ALUSrc = 1;
        branch = 0;
        RegWrite = 0;
        memRW = 0;
        end
    7'b1100011: begin // B-type
        $display("ControlIn: %b, B-Type", ControlIn);
        ALUOp = 2'b01; 
        ALUSrc = 0;
        // branch = 1;
        branch = 0;
        RegWrite = 0;
        memRW = 0;
        end
    7'b0100011: begin // SW-type
        $display("ControlIn: %b, SW-Type", ControlIn);
        ALUOp = 2'b00; 
        ALUSrc = 1;
        branch = 0;
        RegWrite = 0;
        memRW = 1;
        end
    7'b0000011: begin // LW-type
        $display("ControlIn: %b, LW-Type", ControlIn);
        ALUOp = 2'b00; 
        ALUSrc = 1;
        branch = 0;
        RegWrite = 1;
        memRW = 0;
        end



    endcase


end

endmodule