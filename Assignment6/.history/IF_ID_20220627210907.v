module IF_ID(INST, PC, P_INST, P_PC);

    input INST;
    input PC;
    output reg P_INST;
    output reg P_PC;

always @(INST or PC) begin
     P_INST <= INST;

end



endmodule