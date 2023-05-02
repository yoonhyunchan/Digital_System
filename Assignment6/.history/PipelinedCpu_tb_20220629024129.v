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
    #0.5;
    CLK = 1;
    #0.5;
    RST = 0;
    CLK = 0;
    #0.5;
    for(i=0; i<467; i=i+1) begin
        // $display("#############CLK#############");
        CLK = 1;
        #0.5;
        CLK = 0;
        #0.5;
    end


end


// always begin
//     #6 CLK=0;
//     #4 CLK=1;
// end

    
endmodule