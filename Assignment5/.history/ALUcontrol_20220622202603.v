module ALUcontrol(ALU_control_IN, ALU_control_OUT);

input [3:0] ALU_control_IN;

wire fun3;
wire fun7;
output ALU_control_OUT;

assign fun3 = ALU_control_IN[2:0];
assign fun7 = ALU_control_IN[3];

// always @(*) begin
//     case(fun3)
//     3'b000: $display("ADD");


//     endcase

    
// end

endmodule