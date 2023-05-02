module PipelinedCpu_tb ();

reg CLK;
wire [31:0] OUT;
reg RST;
integer i;
PipelinedCpu PipelinedCpu1 (.CLK(CLK), .RST(RST), .OUT(OUT));

initial begin
    RST = 1;
    CLK = 0;
    #0.08;
    CLK = 1;
    #0.08;
    RST = 0;
    CLK = 0;
    #0.08;
    for(i=0; i<400; i=i+1) begin
        CLK = 1;
        #0.08;
        CLK = 0;
        #0.08;
    end


end


// always begin
//     #6 CLK=0;
//     #4 CLK=1;
// end

    
endmodule