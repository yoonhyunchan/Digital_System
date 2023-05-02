module ALUcontrol(ALU_CIN, ALU_COUT);

input [3:0] ALU_CIN;

wire fun3;
wire fun7;
output ALU_COUT;

assign fun3 = ALU_CIN[2:0];
assign fun7 = ALU_CIN[3];

always @(*) begin
    case(fun3)
    3'b000: $display("ADD");


    endcase

    
end

endmodule