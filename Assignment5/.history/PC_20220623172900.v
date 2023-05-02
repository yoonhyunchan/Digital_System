module PC(ADDR, ADDROUT, CLK);
    input CLK;
    input [31:0] ADDR;
    output reg [31:0] ADDROUT;

    
    always @(posedge CLK) begin
        if (RST) ADDR <= 0; else begin
        ADDROUT <= ADDR + 4'b0100; // INST가 저장된다.
        end
    end


endmodule