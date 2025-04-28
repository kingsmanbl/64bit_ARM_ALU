`timescale 1ps/100fs

module bt_full_adder(a, b, cin, sum, cout);
	input logic a, b, cin;
	output logic sum, cout;
	logic result_first_xor, result_first_and, result_second_and;
	
	xor #(50) xor_gate (result_first_xor, a, b);
	and #(50) and_gate (result_first_and, a, b);
	xor #(50) xor_gate_2 (sum, cin, result_first_xor);
	and #(50) and_gate_2 (result_second_and, cin, result_first_xor);
	or #(50) or_gate (cout, result_first_and, result_second_and);
	
endmodule