module IF_ID(INST, PC, IR_D, P_PC);

    input [31:0] INST;
    input [31:0] PC;
    output reg [31:0] IR_D;
    output reg [31:0] P_PC;

always @(INST or PC) begin
     IR_D <= INST;
     P_PC <= PC;
end



endmodule