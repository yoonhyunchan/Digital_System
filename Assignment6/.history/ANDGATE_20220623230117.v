module ANDGATE(branch, Zero, andout);

    input branch;
    input Zero;

    output andout;

    assign andout = branch & Zero;


endmodule