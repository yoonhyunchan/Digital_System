module ID_EX(P_PC, RD1, RD2, signout, P_PC2, P_RD1, P_RD2, P_signout);

    input [31:0] P_PC;
    input [31:0] RD1;
    input [31:0] RD2;
    input [31:0] signout;
    output reg [31:0] P_PC2;
    output reg [31:0] P_RD1;
    output reg [31:0] P_RD2;
    output reg [31:0] P_signout;

    always @(*) begin
        P_PC2 <= P_PC;
        P_RD1 <= RD1;
        P_RD2 <= RD2;
        P_signout <= signout;
    end


endmodule