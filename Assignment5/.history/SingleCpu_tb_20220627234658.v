module moduleName ();

reg CLK;
wire [31:0] OUT;
reg RST;
integer i;
SingleCpu SingleCpu1 (.CLK(CLK), .RST(RST), .OUT(OUT));

initial begin
    RST = 1;
    CLK = 0;
    #5;
    CLK = 1;
    #5
    RST = 0;
    CLK = 0;
    #5
    for(i=0; i<200; i=i+1) begin
        CLK = 1;
        #5
        CLK = 0;
        #5;
    end


end


// always begin
//     #6 CLK=0;
//     #4 CLK=1;
// end

    
endmodule