module SingleCpu(ADDR);
    reg CLK;
    output reg [31:0] ADDR;


    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));



    always begin
        #6 CLK = 1;
        #4 CLK = 0;
    end

    always @(posedge CLK) begin
        ADDR = ADDR + 4;
    end




endmodule