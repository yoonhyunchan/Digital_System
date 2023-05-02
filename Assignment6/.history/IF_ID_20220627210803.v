module IF_ID(INST, Qq);

    input INST;
    output reg Qq;

always @(INST) begin
     Qq <= INSTs;
end



endmodule