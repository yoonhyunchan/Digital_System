module IF_ID(INST, Q);

    input Data;
    output reg Q;

always @(Data) begin
     Q <= Data;
end



endmodule