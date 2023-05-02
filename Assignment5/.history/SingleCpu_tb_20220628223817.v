module moduleName ();

reg CLK;
wire [31:0] OUT;
reg RST;
integer i;
SingleCpu SingleCpu1 (.CLK(CLK), .RST(RST), .OUT(OUT));

initial begin
    RST = 1;
    CLK = 0;
    #0.3;
    CLK = 1;
    #0.3;
    RST = 0;
    CLK = 0;
    #0.3;
    for(i=0; i<400; i=i+1) begin
        CLK = 1;
        #0.3;
        CLK = 0;
        #0.3;
    end


end
// iverilog -o test Vr_inst_mem.v SingleCpu.v SingleCpu_tb.v Vr_register_file.v SignedExtension.v Vr_data_mem.v Control.v ALUcontrol.v mux.v ALU.v Shift.v ALU_ADD.v PC.v ADD_4.v ANDGATE.v 

// always begin
//     #6 CLK=0;
//     #4 CLK=1;
// end

    
endmodule