module IF_ID(Data, Q);

    input Data;
    output reg Q;

always @(Data) begin
    if(RST) Q <= 0;
    else if Q <= Data;

end



endmodule