module moduleName ();

reg CLK;
wire [31:0] OUT;
reg RST;
integer i;
SingleCpu SingleCpu1 (.CLK(CLK), .RST(RST), .OUT(OUT));

initial begin
    CLK = 1;
    #5
    CLK = 0;
    #5;
    for(i=0; i<32; i=i+1)


end


// always begin
//     #6 CLK=0;
//     #4 CLK=1;
// end

    
endmodule