module ALUcontrol(ALU_CIN, ALU_COUT);

input [3:0] ALU_CIN;

wire fun3;
wire fun7;
output ALU_COUT;

always @(*) begin
    fun3 = ALU_CIN[2:0];
    fun7 = ALU_CIN[3];
    case(fun3)

    
    endcase

    
end

endmodule