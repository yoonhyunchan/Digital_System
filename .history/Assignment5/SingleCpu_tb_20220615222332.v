module moduleName ();

reg CLK;
wire INST;
SingleCpu SingleCpu1 (.CLK(CLK), .INST(INST));

initial begin
    CLK = 1;
end


always begin
    #6 CLK=0;
    #4 CLK=1;
    $display("%h", INST);
end

    
endmodule