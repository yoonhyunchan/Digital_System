module moduleName ();


always begin
    #6 CLK=0; 
    #4 CLK=1;
end
    
endmodule