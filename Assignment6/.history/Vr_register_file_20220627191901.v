module Vr_register_file(CLK, RST, RR1, RR2, WR, WD, WE, RD1, RD2);
   input CLK;
   input RST;
   input [4:0] RR1; // Read Register1
   input [4:0] RR2; // Read Register2
   input [4:0] WR; // Write Register
   input [31:0] WD; // Write date
   input 	WE; // Wriet Enable
   output [31:0] RD1; // Read data1
   output [31:0] RD2; // Read data2

   reg [31:0] 	 register_file [0:31];
   assign RD1 = register_file[RR1];
   assign RD2 = register_file[RR2];
   integer 		 i;

   // Dumpvars does not dump array entries
   // To detour the limitation, assign each register entry to a temporal wire.
   generate
      genvar 		 idx;
      for(idx = 0; idx < 32; idx = idx+1) begin: register

	 wire [31:0] tmp;
	 assign tmp = register_file[idx];
      end
   endgenerate

   always @(posedge CLK)
     begin
	if (RST)
	  begin
	     for (i = 0; i < 32; ++i)
	       register_file[i] = i;
	  end
	else if (WE)
	  register_file[WR] = WD;
     end

  // always @(*) begin
  //   // $display("%1d %1d %1d %1d %1d t0(%1d) t1(%1d) t2(%1d) %1d %1d a0(%1d) a1(%1d) a2(%1d) %1d a4(%1d) %1d %1d %1d %1d %1d", register_file[0], register_file[1], register_file[2], register_file[3], register_file[4], register_file[5], register_file[6], register_file[7], register_file[8], register_file[9], register_file[10], register_file[11], register_file[12], register_file[13], register_file[14], register_file[15], register_file[16], register_file[17], register_file[18], register_file[19]);
  // end

endmodule
