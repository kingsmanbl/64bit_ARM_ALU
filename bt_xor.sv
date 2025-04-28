`timescale 1ps/100fs

module bt_xor(a, b, result);
	input [63:0] a, b;
	output [63:0] result;
	genvar i;
	generate
		for(i = 0; i < 64; i++) begin:eachRegs
			xor #(50) xor_gate (result[i], a[i], b[i]);
		end
	endgenerate
	
endmodule