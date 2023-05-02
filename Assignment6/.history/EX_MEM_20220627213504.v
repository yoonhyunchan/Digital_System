module EX_MEM (counter1, Zero, ALU_OUT, B_E, nPC_M, AOUT_M, B_M);

    input [31:0] counter1;
    input [31:0] Zero;
    input [31:0] ALU_OUT;
    input [31:0] B_E;

    output reg [31:0] nPC_M;
    output reg [31:0] AOUT_M;
    output reg [31:0] B_M;

    always @(*) begin
        nPC_M <= counter1;
        AOUT_M <= ALU_OUT;
        B_M <= B_E;
    end


endmodule