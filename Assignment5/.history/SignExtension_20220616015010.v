module SignExtension (imm_in, imm_out);
	input [15:0] imm_in;
	output reg [31:0] imm_out;
	assign sign_out[15:0]=imm_in[15:0];
	assign sign_out[31:16]=imm_out[15]?16'b1111_1111_1111_1111:16'b0;
endmodule