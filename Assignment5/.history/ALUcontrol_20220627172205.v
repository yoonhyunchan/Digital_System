module ALUcontrol(ALUOp, ALU_control_IN, ALU_control_OUT);

input [1:0] ALUOp;
input [3:0] ALU_control_IN;

wire [2:0]fun3;
wire fun7;
output reg [3:0] ALU_control_OUT;

assign fun3 = ALU_control_IN[2:0];
assign fun7 = ALU_control_IN[3];

always @(*) begin
    case(ALUOp)
    2'b10: begin
        if(fun7 == 1'b1) ALU_control_OUT = 4'b0110; // SUB
        else if(fun3 == 3'b0) ALU_control_OUT = 4'b0010; // ADD
        else if(fun3 == 3'b111) ALU_control_OUT = 4'b0000; // AND
        else if(fun3 == 3'b110) ALU_control_OUT = 4'b0001; // OR
        else if (fun3 == 3'b001) ALU_control_OUT = 4'b; // SLLi
    end
    2'b01:begin
        case(fun3)
            3'b100: ALU_control_OUT = 4'b1100;
            3'b000: ALU_control_OUT = 4'b1000;
        endcase
    end
        
    2'b00:ALU_control_OUT = 4'b0010; 
    endcase
    
end

endmodule