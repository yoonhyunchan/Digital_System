module IF_ID(Data, Q);

    input Data;
    output reg Q;

always @(Data) begin
     Q <= Data;
end



endmodule