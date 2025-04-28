`timescale 1ps/100fs

module D_FF_enabled (q, d, clk, enable);
	output logic q;
	input d, clk, enable;
	logic not_enable;
	logic d_after_mux;
	
	mux2to1 mdx(.d0(q), .d1(d), .select(enable), .y(d_after_mux));
	D_FF d_ff_base(.q(q), .d(d_after_mux), .reset(0),.clk);
	
endmodule