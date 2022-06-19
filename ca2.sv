`timescale 1ns/1ns
module MUX4to1 (input a, b, c, d, input[1:0] S, output w);
	assign#(48,46) w = S[1] ? (S[0] ? d : c) : (S[0] ? b : a);
endmodule
module TB_MUX4to1();
	logic a, b, c, d;
	logic [1:0] S;
	wire w;
	MUX4to1 Q1(a, b, c, d, S, w);
	initial begin
	S = 2'b00;
	#100; a = 1;
	#100; a = 0;
	#200;
	end
endmodule
module BARRELSHIFTER4to1(input[3:0] A, input[1:0] S, output[3:0] SHO);
	MUX4to1 a(A[3], A[0], A[1], A[2], S, SHO[3]);
	MUX4to1 b(A[2], A[3], A[0], A[1], S, SHO[2]);
	MUX4to1 c(A[1], A[2], A[3], A[0], S, SHO[1]);
	MUX4to1 d(A[0], A[1], A[2], A[3], S, SHO[0]);
endmodule
module TB_BARREL4();
	logic[3:0] A;
	logic[1:0] S;
	wire[3:0] SHO;
	BARRELSHIFTER4to1 Q2(A, S, SHO);
	initial begin
	A[3] = 0; A[2] = 1; A[1] = 0; A[0] = 1;
	S = 2'b00;
	#100; S = 2'b01;
	#100; S = 2'b10;
	#100; S = 2'b11;
	#200;
	end
endmodule
module MUX16to1(input[15:0] A, input[3:0] S, output w);
	wire w1, w2, w3, w4;
	wire[1:0] J1, J2;
	assign J1 = {S[3], S[2]};
	assign J2 = {S[1], S[0]};
	MUX4to1 a(w1, w2, w3, w4, J1, w);
	MUX4to1 b(A[0], A[1], A[2], A[3], J2, w1);
	MUX4to1 c(A[4], A[5], A[6], A[7], J2, w2);
	MUX4to1 d(A[8], A[9], A[10], A[11], J2, w3);
	MUX4to1 e(A[12], A[13], A[14], A[15], J2, w4);
endmodule
module TB_MUX16to1();
	logic[15:0] A;
	logic [3:0] S;
	wire w;
	MUX16to1 Q3(A, S, w);
	initial begin
	S = 4'b0000;
	#100; A[0] = 1;
	#100; A[0] = 0;
	#200;
	end
endmodule
module BARRELSHIFTER16to1(input[15:0] A, input[3:0] S, output[15:0] SHO);
	wire[15:0] J1, J2, J3, J4, J5, J6, J7, J8, J9, J10, J11, J12, J13, J14, J15, J16;
	assign J1 = {A[15], A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14]};
	assign J2 = {A[14], A[15], A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13]};
	assign J3 = {A[13], A[14], A[15], A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12]};
	assign J4 = {A[12], A[13], A[14], A[15], A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11]};
	assign J5 = {A[11], A[12], A[13], A[14], A[15], A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10]};
	assign J6 = {A[10], A[11], A[12], A[13], A[14], A[15], A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9]};
	assign J7 = {A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8]};
	assign J8 = {A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7]};
	assign J9 = {A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[0], A[1], A[2], A[3], A[4], A[5], A[6]};
	assign J10 = {A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[0], A[1], A[2], A[3], A[4], A[5]};
	assign J11 = {A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[0], A[1], A[2], A[3], A[4]};
	assign J12 = {A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[0], A[1], A[2], A[3]};
	assign J13 = {A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[0], A[1], A[2]};
	assign J14 = {A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[0], A[1]};
	assign J15 = {A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[0]};
	assign J16 = {A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15]};
	MUX16to1 a(J1, S, SHO[15]);
	MUX16to1 b(J2, S, SHO[14]);
	MUX16to1 c(J3, S, SHO[13]);
	MUX16to1 d(J4, S, SHO[12]);
	MUX16to1 e(J5, S, SHO[11]);
	MUX16to1 f(J6, S, SHO[10]);
	MUX16to1 g(J7, S, SHO[9]);
	MUX16to1 h(J8, S, SHO[8]);
	MUX16to1 i(J9, S, SHO[7]);
	MUX16to1 j(J10, S, SHO[6]);
	MUX16to1 k(J11, S, SHO[5]);
	MUX16to1 l(J12, S, SHO[4]);
	MUX16to1 m(J13, S, SHO[3]);
	MUX16to1 n(J14, S, SHO[2]);
	MUX16to1 o(J15, S, SHO[1]);
	MUX16to1 p(J16, S, SHO[0]);
endmodule
module TB_BARREL16();
	logic[15:0] A;
	logic[3:0] S;
	wire[15:0] SHO;
	BARRELSHIFTER16to1 Q4(A, S, SHO);
	initial begin
	A[15] = 0; A[14] = 0; A[13] = 0; A[12] = 0;
	A[11] = 0; A[10] = 0; A[9] = 0; A[8] = 0;
	A[7] = 0; A[6] = 0; A[5] = 0; A[4] = 0;
	A[3] = 0; A[2] = 0; A[1] = 0; A[0] = 1;
	S = 2'b00;
	#100;
	A[15] = 0; A[14] = 0; A[13] = 0; A[12] = 0;
	A[11] = 0; A[10] = 0; A[9] = 0; A[8] = 0;
	A[7] = 0; A[6] = 0; A[5] = 0; A[4] = 0;
	A[3] = 0; A[2] = 0; A[1] = 0; A[0] = 1;
	S = 2'b01;
	#100;
	A[15] = 0; A[14] = 0; A[13] = 0; A[12] = 0;
	A[11] = 0; A[10] = 0; A[9] = 0; A[8] = 0;
	A[7] = 0; A[6] = 0; A[5] = 0; A[4] = 0;
	A[3] = 0; A[2] = 0; A[1] = 0; A[0] = 1;
	S = 2'b10;
	#100
	A[15] = 0; A[14] = 0; A[13] = 0; A[12] = 0;
	A[11] = 0; A[10] = 0; A[9] = 0; A[8] = 0;
	A[7] = 0; A[6] = 0; A[5] = 0; A[4] = 0;
	A[3] = 0; A[2] = 0; A[1] = 0; A[0] = 1;
	S = 2'b11;
	#200;
	end
endmodule










