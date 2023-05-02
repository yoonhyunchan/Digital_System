module tb();
    reg CLK;
    reg [31:0] ADDR;
    reg 	RW; /* 0: Read, 1: Write */
    reg [31:0] WD;
    output [31:0] RD;
    integer i;

    Vr_data_mem Vr_data_mem1(CLK, ADDR, RW, WD, RD);


    initial begin
        RW = 0;
        CLK = 1;
        #10
        CLK = 0;
        #10
        CLK = 1;
        #10
        CLK = 0;
        #10CLK = 1;
        #10
        CLK = 0;
        #10CLK = 1;
        #10
        for(i=0; i<100; i=i+1) ADDR = i;
        $display("%b", WD);

        CLK = 0;
        #10CLK = 1;
        #10
        CLK = 0;

    end

    


endmodule