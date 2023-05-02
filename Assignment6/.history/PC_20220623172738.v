module PC(ADDR, ADDROUT);

    input [31:0] ADDR;
    output reg [31:0] ADDROUT;


    always @(posedge CLK) begin
        ADDROUT <= ADDR;
    end


endmodule