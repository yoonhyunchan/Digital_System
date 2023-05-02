module moduleName ();

reg CLK;
wire [31:0] OUT;
reg RST;
SingleCpu SingleCpu1 (.CLK(CLK), .RST(RST), .OUT(OUT));

initial begin
    CLK = 1;
    #10
    CLK = 0;
    #10
        RST = 1;
        #10
    CLK = 1;
    #10
    CLK = 0;
    #10
        RST = 0;
    #10
    CLK = 1;
    #10
    CLK = 0;
    #10
    CLK = 1;
    #10
    CLK = 0;
    #10
    CLK = 1;
    #10
    CLK = 0;
    CLK = 1;
    #10
    CLK = 0;
    #10
    CLK = 1;
    #10
    CLK = 0;
    #10
    CLK = 1;
    #10
    CLK = 0;
end


// always begin
//     #6 CLK=0;
//     #4 CLK=1;
// end

    
endmodule