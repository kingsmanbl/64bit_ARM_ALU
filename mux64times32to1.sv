`timescale 1ps/100fs

module mux64times32to1(d, s, y);
	input logic [31:0][63:0] d;
	input logic [4:0] s;
	output logic [63:0] y;
	
	logic [63:0][31:0] transposed_d;
	
	genvar i, j;
	generate
		for(i = 0; i < 32; i++) begin: transpose_row
			for(j = 0; j < 64; j++) begin: transpose_col
				assign transposed_d[j][i] = d[i][j];
			end
		end
	endgenerate
	
	generate
		for(i = 0; i < 64; i++) begin: sixty_four_mx
			mux32to1 m (.d(transposed_d[i]),.s(s[4:0]),.y(y[i]));
		end
	endgenerate
endmodule