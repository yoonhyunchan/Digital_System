`timescale 1ns/10ps
module PipelinedCpu_tb ();

reg CLK;
wire [31:0] OUT;
reg RST;
integer i;
PipelinedCpu PipelinedCpu1 (.CLK(CLK), .RST(RST), .OUT(OUT));

initial begin
    RST = 1;
    CLK = 0;
    #0.005;
    CLK = 1;
    #0.005;
    RST = 0;
    CLK = 0;
    #0.005;
    for(i=0; i<467; i=i+1) begin
        CLK = 1;
        #0.005;
        CLK = 0;
        #0.005;
    end


end


// always begin
//     #6 CLK=0;
//     #4 CLK=1;
// end

    
endmodule