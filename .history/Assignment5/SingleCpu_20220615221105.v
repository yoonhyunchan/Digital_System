module SingleCpu();




Vr_data_mem Vr_data_mem1(CLK, ADDR, RW, WD, RD);




always begin
    #6 CLK=0; 
    #4 CLK=1;
end


endmodule