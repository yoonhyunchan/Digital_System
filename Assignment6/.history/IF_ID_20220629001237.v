module IF_ID(INST, PC, IR_D, PC_D4, CLK, RST);

    input CLK;
    input RST;
    input [31:0] INST;
    input [31:0] PC;
    output reg [31:0] IR_D;
    output reg [31:0] PC_D4;

always @(CLK) begin
    if(RST) begin
        IR_D <= 0;
        PC_D4 <= 0;
    end else if (CLK)begin
     IR_D <= INST;
     PC_D4 <= PC;
    end
end



endmodule