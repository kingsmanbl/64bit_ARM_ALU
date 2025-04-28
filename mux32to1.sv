`timescale 1ps/100fs

module mux32to1(d, s, y);
	input logic [31:0] d;
	input logic [4:0] s;
	output logic y;
	logic y1, y2;

	mux16to1 mux1 (.d(d[15:0]),.s(s[3:0]),.y(y1));
   mux16to1 mux2 (.d(d[31:16]),.s(s[3:0]),.y(y2));
   mux2to1 mux3(.d0(y1),.d1(y2),.select(s[4]),.y(y));
endmodule