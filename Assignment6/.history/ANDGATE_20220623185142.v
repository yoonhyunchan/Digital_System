module ANDGATE(branch, Zero, andout);

    input branch;
    input Zero;

    output reg andout;

    assign andout = branch & Zero;


endmodule