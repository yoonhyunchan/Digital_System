module IF_ID(INST, PC, P_INST, P_PC);

    input INST;
    output reg P_INST;

always @(INST) begin
     P_INST <= INST;

end



endmodule