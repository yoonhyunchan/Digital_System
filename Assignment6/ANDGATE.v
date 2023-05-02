module ANDGATE(branch, Zero, PCsrc);

    input branch;
    input Zero;

    output PCsrc;

    assign PCsrc = branch & Zero;


endmodule