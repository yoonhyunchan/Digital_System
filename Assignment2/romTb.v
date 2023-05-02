`timescale 1ns/100ps
module romTb();

    reg [1:0] A;
    reg En;
    wire [3:0] Y;
    integer i;

    rom rom1 (.Y(Y), .A(A), .En(En));

    initial begin
        En = 1'b1;
        for(i=0; i<4; i=i+1)
        begin
            A = i;
            #20
            $display("A = %b   Y =%b", A, Y);
        end
            

    end


endmodule