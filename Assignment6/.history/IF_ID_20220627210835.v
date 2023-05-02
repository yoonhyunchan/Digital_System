module IF_ID(INST, PC, P_INST, P_PC);

    input INST;
    output reg Q1;

always @(INST) begin
     Q1 <= INST;
end



endmodule