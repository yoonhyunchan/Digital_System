module FpAdd(A, B, S);

    input [9:0] A; // 입력
    input [9:0] B; // 입력
    output [9:0] S; // 출력
    wire AIsBIg;  // 두 입력의 지수 중에서 A가 더 크다먼 1, B가 더 크다면 0을 출력한다.
    wire [3:0] diff; // 두 입력의 Exponent의 차이
    wire [5:0] Am; // 큰 지수에 맞추어 진 A의 mantissa 
    wire [5:0] Bm; // 큰 지수에 맞추어 진 A의 mantissa 
    wire [6:0] m_sum; // 큰 지수에 맞춘 후 더한 값이다. 크기가 1이 더 큰 이유는 ovf를 판별하기 위해서이다. 
    wire [6:0] Se1; // 만약 A가 더 클 경우 A의 지수에 맞추어 연산을 했으므로 mantissa에서 ovf가 발생하지 않으면 그대로 A의 지수, 발생하였다면 A의 지수 + 1이 된다. A의 지수가 B보다 작다면 0출력
    wire [6:0] Se2; // 만약 B가 더 클 경우 A의 지수에 맞추어 연산을 했으므로 mantissa에서 ovf가 발생하지 않으면 그대로 B의 지수, 발생하였다면 B의 지수 + 1이 된다. B의 지수가 A보다 작다면 0출력 
    wire [9:0]S_2; // 두 입력의 합이 최대치를 통과할 경우 한계를 정하기 위해 출력하기 전에 임시 공간을 만들었다.
    wire [2:0] ovf; // Exponent가 최대값을 넘게 될 경우를 판별하기 위해 만든 변수이다. 

    assign AIsBIg = A[9:6] > B[9:6];
    // A가 더 크다면 AIsBIg는 1, B가 더 크면 0이 된다. 
    assign diff = AIsBIg ? A[9:6] - B[9:6] : B[9:6] - A[9:6];
    // 두 입력중 최대 지수에 맞출 때 차이를 알아야 하는데 작은값에서 큰값을 빼면 원하는 값이 나오지 않으므로 큰값에서 작은값을 뺀다.
    Shift S1({1'b1, A[5:0]}, diff, ~AIsBIg, Am);
    // B가 더 클 때 A의 mantissa인 1.xxxxxx에서 diff만큼 Shift하여 자릿수를 맞춘다. A가 더 크다면 A의 mantissa가 그대로 출력된다.
    Shift S2({1'b1, B[5:0]}, diff, AIsBIg, Bm);
    // A가 더 클 때 B의 mantissa인 1.xxxxxx에서 diff만큼 Shift하여 자릿수를 맞춘다. B가 더 크다면 B의 mantissa가 그대로 출력된다.
    Adder A1(Am, Bm, 1'b1, m_sum);
    // 지수의 최대 자릿수에 맞춘 mantissa들을 더한다. EN이 1'b1이므로 더한 값이 출력된다.
    Adder A2({2'b0, A[9:6]}, {5'b0, m_sum[6]}, AIsBIg, Se1);
    // 만약 A가 더 클 때 mantissa에서의 계산에서 ovf가 발생한다면 이를 지수에 더해주어야 하며 결과는 Se1이다.
    Adder A3({2'b0, B[9:6]}, {5'b0, m_sum[6]}, ~AIsBIg, Se2);
    // 만약 B가 더 클 때 mantissa에서의 계산에서 ovf가 발생한다면 이를 지수에 더해주어야 하며 결과는 Se2이다.
    Adder A4(Se1[5:0], Se2[5:0], 1'b1, {ovf,S_2[9:6]});
    // adder모듈은 EN이 0이라면 0을 출력하고 아니라면 더한 값을 출력한다. A2는 A가 더 클때 덧셈연산이 이루어지며 아니라면 0이다.
    // A3는 B가 더 클때 덧셈연산이 이루어지며 아니라면 0이다. 
    // 이 둘을 더하면 A가 더 클경우에는 최대지수인 A에서 ovf를 고려한 결과, B가 더 크다면  최대지수인 B에서 ovf를 고려한 결과가 출력된다.
    Shift S3({1'b0, m_sum[5:0]}, {3'b000,m_sum[6]}, ~ovf[0], S_2[5:0]);
    // 마지막으로 ovf발생 시 지수에 1을 더하면서 mantiss의 자리를 맞춰주기 위해 Shift연산을 사용한다.
    assign S = ovf ? 10'b1111111111 : S_2;
    // 만약 ovf가 발생하여 합이 최대치를 넘겼다면 10'b1111111111을 출력하고 아니라면 정상적으로 출력하게 하였다. 
    

endmodule



module Adder(A, B, EN, C);  
    input [5:0] A;  
    input [5:0] B;
    output [6:0] C;
    input EN;  
    // Enable 입력을 만듬으로써 조건에 맞을 때 A와 B를 더하고 아니면 0이 출력되도록 하였다.
    assign C = EN ? A + B : 0;  

endmodule

module Shift(A, bit, En, out);
    input [6:0] A; // Shift연산의 대상
    input [3:0] bit; // Shift하려는 비트의 수
    input En;  // Enable 입력
    output [5:0]out;  // 출력
    // Enable이 0이면 그대로 출력하고 아니면 Shift연산을 한 값을 출력한다.
    assign out = En ? (A >> bit) : A;
 
endmodule