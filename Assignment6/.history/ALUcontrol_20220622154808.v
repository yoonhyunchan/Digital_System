module ALUcontrol(ALU_CIN, ALU_COUT);

input [3:0] ALU_CIN;
output ALU_COUT;

always @(*) begin
    $display("%b %b", ALU_CIN[3], ALU_CIN[2:0]);
    
end

endmodule