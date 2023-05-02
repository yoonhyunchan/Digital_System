module ID_EX(PC_D4, RD1, RD2, signout, PC_E4, P_RD1, P_RD2, P_signout);

    input [31:0] PC_D4;
    input [31:0] RD1;
    input [31:0] RD2;
    input [31:0] signout;
    output reg [31:0] PC_E4;
    output reg [31:0] P_RD1;
    output reg [31:0] P_RD2;
    output reg [31:0] P_signout;

    always @(*) begin
        PC_E4 <= PC_D4;
        P_RD1 <= RD1;
        P_RD2 <= RD2;
        P_signout <= signout;
    end


endmodule