module moduleName ();

reg CLK;
wire [31:0] OUT;
SingleCpu SingleCpu1 (.CLK(CLK), .OUT(OUT));

initial begin
    CLK = 1;
end


always begin
    #600 CLK=0;
    #400 CLK=1;
end

    
endmodule