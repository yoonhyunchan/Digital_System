module tb();

    reg CLK;
    reg RST;
    reg [4:0] RR1; // Read Register1
    reg [4:0] RR2; // Read Register2
    reg [4:0] WR; // Write Register
    reg [31:0] WD; // Write date
    reg 	WE; // Wriet Enable
    wire [31:0] RD1; // Read data1
    wire [31:0] RD2; // Read data2
    integer i;
    Vr_register_file Vr_register_file1(CLK, RST, RR1, RR2, WR, WD, WE, RD1, RD2);

    

endmodule