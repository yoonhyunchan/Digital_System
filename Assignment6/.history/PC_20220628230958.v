module PC(ADDR, ADDROUT, CLK, RST);
    input CLK;
    input [31:0] ADDR;
    input RST;
    output reg [31:0] ADDROUT;

    
    always @(ADDR) begin
        if (RST) ADDROUT <= 0; else begin
        ADDROUT <= ADDR;
        end
    end


endmodule