`timescale 1ps/100fs

module mux16to1(d, s, y);
	input [15:0] d;
	input [3:0] s;
	output logic y;
	logic y1, y2, y3, y4;
	logic [3:0] finalized_d;
	mux4to1 mux1 (.d(d[3:0]),.s(s[1:0]),.y(y1));  
   mux4to1 mux2 (.d(d[7:4]),.s(s[1:0]),.y(y2)); 
   mux4to1 mux3 (.d(d[11:8]),.s(s[1:0]),.y(y3)); 
   mux4to1 mux4 (.d(d[15:12]),.s(s[1:0]),.y(y4));
	assign finalized_d [0] = y1;
	assign finalized_d[1] = y2;
	assign finalized_d[2] = y3;
	assign finalized_d[3] = y4;
	mux4to1 mux5 (.d(finalized_d),.s(s[3:2]),.y(y));
	
endmodule