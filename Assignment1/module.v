module hex2ascii_bh(out, in); // Behavioral Model always문을 활용하여 Module을 설계하였다.

    input [3:0] in;
    output reg [6:0] out;

    always @ (in) // in은 4-bit로 입력되는 16진수 0~F이다. 0~F까지 입력이 바뀔때마다 출력을 바꾼다.
        if (in <= 4'b1001) out = {3'b011, in};
        // 0~9까지는 Ascii code로 변환될 때 0~9를 4-bit 2진수로 변환한 값 앞에 011이 붙으면 된다. 
        // 따라서 0~F까지중 0~9까지, 9이하일 경우 입력되는 2진수 4-bit앞에 3'b011을 합친다.

        else out = {3'b100, in - 4'b1001};
        // 0~9가 아닐 경우, 즉 A~F일 경우이다. 
        // A~F일 경우에는 2진수 4-bi입력에서 4'b1001을 뺀 값 앞에 3'b100을 합친다는 동작을 확인하였다.
        // ex) F = 4'b1111,  Ascii_code =  '100' + '(1111 - 1001)' = '100' + '0110' = 1000110


endmodule

module hex2ascii_df(out, in);
    input [3:0] in; // 4-bit input 16진수 0~F까지 받는다.
    output [6:0] out; // 7-bit의 Ascii code로 변환하여 출력한다.

    // 3항 연산자를 활용하여 조건을 나눈다.
    // behavioral Model에서의 동작을 참고한다.
    // 0~9까지는 앞에 '011'을 붙이고 4-bit 입력을 그래도 출력
    // A~F까지는 4-bit 입력에 '1001'을 뺀 후 앞에 '100'을 붙여서 출력

    // 

    assign out[6:4] = ~(~in[3] | ~(in[2] | in[1]) ) ?  3'b100  : 3'b011;
    // 0~9까지는 3'b011 + 4-bit 입력
    // A~F까지는 3'b100 + (4-bit 입력 - 4'b1001)


    // 0~9와 A~F까지를 판별하는 원리 
    // 1. MSB가 1인가 => 0~7, 8~F로 나뉜다
    // 2. 8, 9는 in[2:1] = 2'b00이다
    // ==> MSB가 1이면서 입력[1:0]이 2'b00이 아니면 A~F이다. 

    //A~F까지 (4-bit 입력 - 4'b1001)의 연산을 해야하지만 회로의 간소화를 위해 규칙을 찾아내었다.
    assign out[3] = ~(~in[3] | ~(in[2] | in[1]) ) ? 1'b0 : in[3]; 
    //0~9까지는 입력 그대로 출력, 0000 ~ 1001까지는 
    //A~F까지는 모두 out[3]이 0이다. 
    assign out[0] = ~(~in[3] | ~(in[2] | in[1]) ) ?  ~in[0] : in[0];

    //    입력        출력[2:0]
    // A 1 010   => 001
    // B 1 011   => 010
    // C 1 100   => 011
    // D 1 101   => 100
    // E 1 110   => 101
    // F 1 111   => 110
    // 4-bit 입력에 4'b1001을 빼는 동작은 입력[3]이 모두 1이므로 1=>0이 되면 4'b1000을 뺀 결과가 되므로
    // 입력[2:0] 에서 3'b1만 빼면 된다. 

    //0~9까지는 입력 그대로 출력
    //A~F까지 out[0]은 모두 in[0]이 반전되어 출력되었다. 
    assign out[1] = ~(~in[3] | ~(in[2] | in[1]) ) ?  ~(in[1] ^ in[0] ): in[1];
    //0~9까지는 입력 그대로 출력
    // in[1:0]이 00, 11이면 1, 01, 10이면 0이 출력되었다. xor을 활용하여 출력
    assign out[2] = ~(~in[3] | ~(in[2] | in[1]) ) ?  in[2] & (in[1] | in[0]) : in[2];
    //0~9까지는 입력 그대로 출력
    //A~F까지 C가 입력될 경우에만 입력[2]가 반전되어 출력된다. 
    // C가 입력될 경우 => A~F 중 입력[1:0] = 00인 경우 => 입력[1:0]이 00인 경우에만 (in[1] | in[1])이 0이다. 
    // x & 1 = x, x & 0 = 0을 활용하여 식을 완성하였다. 

endmodule

module hex2ascii_struct(out, in);

    input [3:0] in; // 4-bit input 16진수 0~F까지 받는다.
    output [6:0] out; // 7-bit의 Ascii code로 변환하여 출력한다.

    wire in_00, in_00x, input_a_f, in_3, out_1;


    // 0~9와 A~F까지를 판별하는 원리 
    // 1. MSB가 1인가 => 0~7, 8~F로 나뉜다
    // 2. 8, 9는 in[2:1] = 2'b00이다
    // ==> MSB가 1이면서 입력[1:0]이 2'b00이 아니면 A~F이다. 
    nor(in_00, in[1], in[2]);  // 입력[1:0] = 2'b00인가? => in_00
    not(in_00x, in_00); // 입력[1:0] = 2'b00이 아닌가? => in_00x
    and(input_a_f, in[3], in_00x); // 8이상임과 동시에 입력[1:0] = 2'b00이 아닌가? => input_a_f

    // 0~9라면 out[6:4] = 3'b011
    // A~F 라면 out[6:4] = 3'b100
    // input_a_f가 1이면? 
    // 0~9라면 011 => ~input_a_f, input_a_f, input_a_f
    // A~F 라면 out[6:4] = input_a_f, ~input_a_f, ~input_a_f
    //                          0~9       A~F
    buf(out[6], input_a_f); //   0         1
    not(out[5], input_a_f); //   1         0
    not(out[4], input_a_f); //   1         0


    //out[3]
    // 입력이 8, 9일 때만, 즉 입력이 4'b1000, 4b'1001일 때만 출력[3]이 1이다. 
    and(out[3], in[3], in_00);


    //out[0]
    notif1(out[0], in[0], input_a_f);  // A~F일 경우 반전출력
    bufif0(out[0], in[0], input_a_f); // 0~9일 경우 그대로 출력

    //out[1]
    //~(in[1] ^ in[0] )
    xor(xor_10, in[1], in[0]);
    not(out_1, xor_10);
    bufif1(out[1], out_1, input_a_f);
    bufif0(out[1], in[1], input_a_f); // 0~9일 경우 그대로 출력


    //out[2]
    bufif0(out[2], in[2], input_a_f);// 0~9일 경우 그대로 출력
    or(out_2, in[1], in[0]);
    and(out_2_af, in[2], out_2);
    bufif1(out[2], out_2_af, input_a_f);
    // A~F인 경우 in[2] & (in[1] | in[0])
    

endmodule