module ANDGATE(branch, Zero, andout);

    input branch;
    input Zero;

    assign andout = branch & Zero;


endmodule