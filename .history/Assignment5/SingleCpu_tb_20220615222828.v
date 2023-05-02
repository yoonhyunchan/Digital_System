module moduleName ();

reg CLK;
wire [31:0] INST;
wire [31:0] ADDR;
SingleCpu SingleCpu1 (.CLK(CLK), .ADDR(ADDR));
Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));

initial begin
    CLK = 1;
end


always begin
    #6 CLK=0;
    #4 CLK=1;
    $display("%b", CLK);
end

    
endmodule