module IF_ID(INST, Q1);

    input INST;
    output reg Q1;

always @(INST) begin
     Q1 <= INST;
end



endmodule