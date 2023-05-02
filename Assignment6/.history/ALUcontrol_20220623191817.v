module ALUcontrol(ALUOp, ALU_control_IN, ALU_control_OUT);

input [1:0] ALUOp;
input [3:0] ALU_control_IN;

wire fun3;
wire fun7;
output [3:0] ALU_control_OUT;

assign fun3 = ALU_control_IN[2:0];
assign fun7 = ALU_control_IN[3];

always @(*) begin
    case(ALUOp)
    2'b10: begin
        if(fun7 == 1) ALU_control_OUT = 3'b0110;
        else if(fun3 == 3'b0) ALU_control_OUT = 3'b0010;
        else if(fun3 == 3'b111) ALU_control_OUT = 3'0;
    end
    2'b01:; 
    2'b00:; 
    endcase

    
end

endmodule