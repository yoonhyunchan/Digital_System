`timescale 1ns/100ps
module FpAddTb();

    reg [9:0] A;
    reg [9:0] B;
    wire [9:0] S;

    integer file, r, num, i, A_dec, B_dec, S_dec;
    
    FpAdd FpAdd1 (.A(A), .B(B), .S(S));

    initial begin
        file = $fopenr("input.txt"); // input.txt파일을 연다.
        r = $fscanf(file,"%d\n", num); // input.txt파일에서 맨 윗줄에 있는 Test예제 수를 가져온다.
        for (i=0; i<num; i=i+1)  // 위에서 구한 Test 예제 수를 이용하여 반복문을 통해 모든 예제를 test한다.
        begin
        r = $fscanf(file,"%b %b \n", A, B);  // 한 줄에서 A값과 B값을 가져온다.
        #10 // 1ns x 10 = 10ns의 간격을 둔다.
        A_dec = {1'b1, A[5:0]} * (2 ** (A[9:6] - 6)); // 1.aaaaaa x 2^9 => 1aaaaaa x 2^3으로 표현하였다. 
        B_dec = {1'b1, B[5:0]} * (2 ** (B[9:6] - 6));
        S_dec = {1'b1, S[5:0]} * (2 ** (S[9:6] - 6));
        $display("[#%0t] A =0b%b,%0d B = 0b%b,%0d S = 0b%b,%0d", $realtime / 100, A, A_dec, B, B_dec, S, S_dec);
        end
        
    end
endmodule