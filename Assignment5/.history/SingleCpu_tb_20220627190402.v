module moduleName ();

reg CLK;
wire [31:0] OUT;
reg RST;
integer i;
SingleCpu SingleCpu1 (.CLK(CLK), .RST(RST), .OUT(OUT));

initial begin
    RST = 1;
    CLK = 0;
    #50;
    CLK = 1;
    #50
    RST = 0;
    CLK = 0;
    #50
    for(i=0; i<200; i=i+1) begin
        CLK = 1;
        #50
        CLK = 0;
        #50;
    end


end


// always begin
//     #6 CLK=0;
//     #4 CLK=1;
// end

    
endmodule