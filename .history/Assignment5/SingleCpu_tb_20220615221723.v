module moduleName ();

reg CLK;

SingleCpu SingleCpu1 (CLK);

initial begin
    CLK = 1;
end


always begin
    #6 CLK=0;
    #4 CLK=1;
end

    
endmodule