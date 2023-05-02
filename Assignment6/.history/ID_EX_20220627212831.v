module ID_EX(PC_D4, RD1, RD2, signout, PC_E4, A_E, B_E, IMM_E);

    input [31:0] PC_D4;
    input [31:0] RD1;
    input [31:0] RD2;
    input [31:0] signout;
    output reg [31:0] PC_E4;
    output reg [31:0] A_E;
    output reg [31:0] B_E;
    output reg [31:0] IMM_E;

    always @(*) begin
        PC_E4 <= PC_D4;
        A_E <= RD1;
        B_E <= RD2;
        IMM_E <= signout;
    end


endmodule