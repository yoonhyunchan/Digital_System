module moduleName ();

reg CLK;
wire [31:0] INST;
SingleCpu SingleCpu1 (.CLK(CLK), .ADDR(ADDR));
Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));

initial begin
    CLK = 1;
end


always begin
    #6 CLK=0;
    #4 CLK=1;
    $display("%h", INST);
end

    
endmodule