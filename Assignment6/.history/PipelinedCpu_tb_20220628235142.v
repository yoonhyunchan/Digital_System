`timescale 1ps/1ps
module PipelinedCpu_tb ();

reg CLK;
wire [31:0] OUT;
reg RST;
integer i;
PipelinedCpu PipelinedCpu1 (.CLK(CLK), .RST(RST), .OUT(OUT));

initial begin
    RST = 1;
    CLK = 0;
    #100000;
    CLK = 1;
    #100000;
    RST = 0;
    CLK = 0;
    #100000;
    for(i=0; i<900; i=i+1) begin
        // $display("#############CLK#############");
        CLK = 1;
        #100000;
        CLK = 0;
        #100000;
    end


end


// always begin
//     #6 CLK=0;
//     #4 CLK=1;
// end

    
endmodule