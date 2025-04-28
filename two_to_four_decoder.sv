`timescale 1ps/100fs

module two_to_four_decoder(in, out,enable);
	input [1:0] in;
	input logic enable;
	output [3:0] out;
	logic not0, not1;
	
	not #(50) notin0(not0, in[0]);
	not #(50) notin1(not1, in[1]);
	
	and #(50) num0 (out[0] , not0, not1, enable);
	and #(50) num1 (out[1] , in[0], not1, enable);
	and #(50) num2 (out[2] , not0, in[1], enable);
	and #(50) num3 (out[3] , in[0], in[1], enable);
	
endmodule