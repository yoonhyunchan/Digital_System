// Dateflow Model

// module rom(Y, A, En);

    // parameter N = 2, S = 4;
    // input [N-1:0] A;
    // input En;
    // output reg [S-1:0] Y;

//     assign Y[0] = En ? ({A[1], A[0]} == 2'b00) : 0;
//     assign Y[1] = En ? ({A[1], A[0]} == 2'b01) : 0;
//     assign Y[2] = En ? ({A[1], A[0]} == 2'b10) : 0;
//     assign Y[3] = En ? ({A[1], A[0]} == 2'b11) : 0;

// endmodule

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Structure model

// module rom(Y, A, En);

    // parameter N = 2, S = 4;
    // input [N-1:0] A;
    // input En;
    // output reg [S-1:0] Y;
//     wire NOTA0;
//     wire NOTA1;

//     not U1 (NOTA0, A[0]);
//     not U2 (NOTA1, A[1]);

//     and U3 (Y[0], NOTA0, NOTA1, En);
//     and U4 (Y[1], A[0], NOTA1, En);
//     and U5 (Y[2], NOTA0, A[1], En);
//     and U6 (Y[3], A[0], A[1], En);
// endmodule

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Behavioral model
// module rom(Y, A, En);

//     parameter N = 2, S = 4;
//     input [N-1:0] A;
//     input En;
//     output reg [S-1:0] Y;

//     always @ (*) begin;
//         if (En == 0) Y = 4'b0000;
//         else
//         case(A)
//             2'b00 : Y = 4'b0001;
//             2'b01 : Y = 4'b0010;
//             2'b10 : Y = 4'b0100;
//             2'b11 : Y = 4'b1000;            
//             default: Y = 4'b0000;
//         endcase
//     end


// endmodule
