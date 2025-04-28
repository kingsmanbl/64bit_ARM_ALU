`timescale 1ps/100fs

module mux8to1(a, b, c, d, e, f, s0, s1, s2, final_result);
	input logic a, b, c, d, e, f, s0, s1, s2;
	output logic final_result;
	
	logic not_s1, not_s2, not_s3, first_four, second_four, and1, and2, and3, and4, and5, and6, and7, and8, or1, or2;
	
	not #(50) not_select1 (not_s0, s0);
	not #(50) not_select2 (not_s1, s1);
	not #(50) not_select3 (not_s2, s2);
	
	and #(50) and_select1 (and1, not_s2, not_s1, not_s0, a);
	and #(50) and_select2 (and2, not_s2, not_s1, s0, 0);
	and #(50) and_select3 (and3, not_s2, s1, not_s0, b);
	and #(50) and_select4 (and4, not_s2, s1, s0, c);
	and #(50) and_select5 (and5, s2, not_s1, not_s0, d);
	and #(50) and_select6 (and6, s2, not_s1, s0, e);
	and #(50) and_select7 (and7, s2, s1, not_s0, f);
	and #(50) and_select8 (and8, s2, s1, s0, 0);
	
	or #(50) or_select1 (or1, and1, and2, and3, and4);
	or #(50) or_select2 (or2, and5, and6, and7, and8);
	or #(50) or_select3(final_result, or1, or2);
	
endmodule