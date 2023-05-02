module moduleName ();

reg CLK;
wire [31:0] INST;
wire [31:0] ADDR;
SingleCpu SingleCpu1 (.CLK(CLK), .ADDR(ADDR));

initial begin
    CLK = 1;
end


always begin
    #600 CLK=0;
    $display("%b", CLK);
    #400 CLK=1;
    $display("%b", CLK);
end

    
endmodule