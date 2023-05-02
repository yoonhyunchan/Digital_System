module ID_EX();

    input P_PC;
    input RD1;
    input RD2;
    input signout;
    output reg [31:0] P_PC2;
    output reg [31:0] P_RD1;
    output reg [31:0] P_RD2;
    output reg [31:0] P_signout;

    always @(*) begin
        P_PC2 <= P_PC;
        P_RD1 <= RD1;
    end


endmodule