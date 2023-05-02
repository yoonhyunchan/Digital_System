module Control(ControlIn, branch, memRW, MemtoReg, ALUOp, ALUSrc, RegWrite, RST);


input [6:0] ControlIn;
input RST;
output reg branch;
output reg memRW;
output reg MemtoReg;
output reg [1:0] ALUOp;
output reg ALUSrc;
output reg RegWrite;

always @(*) begin
    if(RST == 1) begin
        branch = 0;
        memRW = 0;
        MemtoReg = 0;
        ALUOp = 0;
        ALUSrc = 0;
        RegWrite = 0;
    end
    else
    case(ControlIn)
    7'b1100011: begin // B-type
        ALUOp = 2'b01; 
        ALUSrc = 0;
        branch = 1;
        RegWrite = 0;
        memRW = 0;
        MemtoReg = 1;
        end
    7'b0110011: begin // R-Type
        ALUOp = 2'b10;  
        ALUSrc = 0;
        branch = 0;
        RegWrite = 1;
        memRW = 0;
        MemtoReg = 1;
        // $display("ControlIn: %b, R-Type", ControlIn);
        end
        7'b0100011: begin // SW-type
        ALUOp = 2'b00; 
        ALUSrc = 1;
        branch = 0;
        RegWrite = 0;
        memRW = 1;
        MemtoReg = 1;
        // $display("ControlIn: %b memRW: %b, SW-Type", ControlIn, memRW);
        
        end
    7'b0010011: begin // I-type
        ALUOp = 2'b10; 
        ALUSrc = 1;
        branch = 0;
        RegWrite = 1;
        memRW = 0;
        MemtoReg = 0;
        // $display("ControlIn: %b, I-Type", ControlIn);
        end
    
    7'b0000011: begin // LW-type
        ALUOp = 2'b00; 
        ALUSrc = 1;
        branch = 0;
        RegWrite = 1;
        memRW = 0;
        MemtoReg = 1;
        // $display("ControlIn: %b, RegWrite: %b, LW-Type", ControlIn, RegWrite);
        
        end



    endcase


end

endmodule