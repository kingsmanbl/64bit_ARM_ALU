`timescale 1ps/100fs;
module three_to_eight_decoder(in, out, enable);

	input [2:0] in;
	output [7:0] out;
	input logic enable;
	logic not0, not1, not2;
	
	not #(50) notin0(not0, in[0]);
	not #(50) notin1(not1, in[1]);
	not #(50) notin2(not2, in[2]);
	
	and #(50) num0 (out[0], not0, not1, not2, enable);
	and #(50) num1 (out[1], not0, not1, in[2], enable);
	and #(50) num2 (out[2], not0, in[1], not2, enable);
	and #(50) num3 (out[3], not0, in[1], in[2], enable);
	and #(50) num4 (out[4], in[0], not1, not2, enable);
	and #(50) num5 (out[5], in[0], not1, in[2], enable);
	and #(50) num6 (out[6], in[0], in[1],not2, enable);
	and #(50) num7 (out[7], in[0], in[1], in[2], enable);
	
endmodule