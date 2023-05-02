module IF_ID(Data, RST);

    input Data;
    input RST;
    output reg Q;

always @(Data or RST) begin
    if(RST) Q <= 0;
    else if Q <= Data;

end



endmodule