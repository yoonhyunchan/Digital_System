module IF_ID(INST, PC, P_INST, P_PC);

    input [31:0] INST;
    input [31:0] PC;
    output reg [31:0] P_INST;
    output reg [31:0] P_PC;

always @(INST or PC) begin
     P_INST <= INST;
     P_PC <= PC;
end



endmodule