`timescale 1ps/1ps
module tb();
    reg [3:0] hex;
    wire [6:0] ascii_bh;
    wire [6:0] ascii_df;
    wire [6:0] ascii_st;
    integer i;
    hex2ascii_bh hex2ascii1_bh1 (.out(ascii_bh), .in(hex));
    hex2ascii_df hex2ascii1_df1 (.out(ascii_df), .in(hex));
    hex2ascii_struct hex2ascii_struct1 (.out(ascii_st), .in(hex));

    initial begin
        $display ("<Behavior Model>");
        hex = 4'h0;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110000",$realtime / 20,  hex, ascii_bh);
        hex = 4'h1;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110001",$realtime / 20,  hex, ascii_bh);
        hex = 4'h2;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110010",$realtime / 20,  hex, ascii_bh);
        hex = 4'h3;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110011",$realtime / 20,  hex, ascii_bh);
        hex = 4'h4;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110100",$realtime / 20,  hex, ascii_bh);
        hex = 4'h5;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110101",$realtime / 20,  hex, ascii_bh);
        hex = 4'h6;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110110",$realtime / 20,  hex, ascii_bh);
        hex = 4'h7;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110111",$realtime / 20,  hex, ascii_bh);
        hex = 4'h8;
        
        #20 $display ("[%0t] %H : 0b%b  0b0111000",$realtime / 20,  hex, ascii_bh);
        hex = 4'h9;
        
        #20 $display ("[%0t] %H : 0b%b  0b0111001",$realtime / 20,  hex, ascii_bh);
        hex = 4'hA;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000001",$realtime / 20,  hex, ascii_bh);
        hex = 4'hB;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000010",$realtime / 20,  hex, ascii_bh);
        hex = 4'hC;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000011",$realtime / 20,  hex, ascii_bh);
        hex = 4'hD;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000100",$realtime / 20,  hex, ascii_bh);
        hex = 4'hE;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000101",$realtime / 20,  hex, ascii_bh);
        hex = 4'hF;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000110\n",$realtime / 20,  hex, ascii_bh);

        //==================================================================
        $display ("<Dataflow Model>");
         hex = 4'h0;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110000",$realtime / 20,  hex, ascii_df);
        hex = 4'h1;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110001",$realtime / 20,  hex, ascii_df);
        hex = 4'h2;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110010",$realtime / 20,  hex, ascii_df);
        hex = 4'h3;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110011",$realtime / 20,  hex, ascii_df);
        hex = 4'h4;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110100",$realtime / 20,  hex, ascii_df);
        hex = 4'h5;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110101",$realtime / 20,  hex, ascii_df);
        hex = 4'h6;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110110",$realtime / 20,  hex, ascii_df);
        hex = 4'h7;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110111",$realtime / 20,  hex, ascii_df);
        hex = 4'h8;
        
        #20 $display ("[%0t] %H : 0b%b  0b0111000",$realtime / 20,  hex, ascii_df);
        hex = 4'h9;
        
        #20 $display ("[%0t] %H : 0b%b  0b0111001",$realtime / 20,  hex, ascii_df);
        hex = 4'hA;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000001",$realtime / 20,  hex, ascii_df);
        hex = 4'hB;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000010",$realtime / 20,  hex, ascii_df);
        hex = 4'hC;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000011",$realtime / 20,  hex, ascii_df);
        hex = 4'hD;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000100",$realtime / 20,  hex, ascii_df);
        hex = 4'hE;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000101",$realtime / 20,  hex, ascii_df);
        hex = 4'hF;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000110\n",$realtime / 20,  hex, ascii_df);

        //==================================================================
        $display ("<Structural Model>");
        hex = 4'h0;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110000",$realtime / 20,  hex, ascii_st);
        hex = 4'h1;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110001",$realtime / 20,  hex, ascii_st);
        hex = 4'h2;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110010",$realtime / 20,  hex, ascii_st);
        hex = 4'h3;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110011",$realtime / 20,  hex, ascii_st);
        hex = 4'h4;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110100",$realtime / 20,  hex, ascii_st);
        hex = 4'h5;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110101",$realtime / 20,  hex, ascii_st);
        hex = 4'h6;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110110",$realtime / 20,  hex, ascii_st);
        hex = 4'h7;
        
        #20 $display ("[%0t] %H : 0b%b  0b0110111",$realtime / 20,  hex, ascii_st);
        hex = 4'h8;
        
        #20 $display ("[%0t] %H : 0b%b  0b0111000",$realtime / 20,  hex, ascii_st);
        hex = 4'h9;
        
        #20 $display ("[%0t] %H : 0b%b  0b0111001",$realtime / 20,  hex, ascii_st);
        hex = 4'hA;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000001",$realtime / 20,  hex, ascii_st);
        hex = 4'hB;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000010",$realtime / 20,  hex, ascii_st);
        hex = 4'hC;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000011",$realtime / 20,  hex, ascii_st);
        hex = 4'hD;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000100",$realtime / 20,  hex, ascii_st);
        hex = 4'hE;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000101",$realtime / 20,  hex, ascii_st);
        hex = 4'hF;
        
        #20 $display ("[%0t] %H : 0b%b  0b1000110\n",$realtime / 20,  hex, ascii_st);
       
    end
    

endmodule