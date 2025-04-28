`timescale 1ps/100fs

module regfile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk);
	input logic RegWrite;
	input logic [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input logic [63:0] WriteData;
	output logic [63:0] ReadData1, ReadData2;
	input logic clk;
	logic[31:0][63:0] reg_out;
	logic[31:0] decoded_val;
	logic[3:0] enable_sig_dec;
	genvar i;
	
	two_to_four_decoder decoder1(WriteRegister[4:3], enable_sig_dec, RegWrite);
	three_to_eight_decoder decoder2(WriteRegister[2:0], decoded_val[7:0], enable_sig_dec[0]);
	three_to_eight_decoder decoder3(WriteRegister[2:0], decoded_val[15:8], enable_sig_dec[1]);
	three_to_eight_decoder decoder4(WriteRegister[2:0], decoded_val[23:16], enable_sig_dec[2]);
	three_to_eight_decoder decoder5(WriteRegister[2:0], decoded_val[31:24], enable_sig_dec[3]);
	
	generate
		for(i = 0; i < 31; i++) begin:eachRegs
			register regs (.in(WriteData),.out(reg_out[i]),.reset(0),.clk ,.enable(decoded_val[i]));
		end
	endgenerate
	
	assign reg_out[31] = 0;
	mux64times32to1 m1(.d(reg_out),.s(ReadRegister1),.y(ReadData1));
	mux64times32to1 m2(.d(reg_out),.s(ReadRegister2),.y(ReadData2));
	
	
endmodule	

`timescale 1ns/100fs;
module regstim(); 		

	parameter ClockDelay = 5000;

	logic	[4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	logic [63:0]	WriteData;
	logic 			RegWrite, clk;
	logic [63:0]	ReadData1, ReadData2;

	integer i;

	// Your register file MUST be named "regfile".
	// Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	regfile dut (.ReadData1, .ReadData2, .WriteData, 
					 .ReadRegister1, .ReadRegister2, .WriteRegister,
					 .RegWrite, .clk);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		// Try to write the value 0xA0 into register 31.
		// Register 31 should always be at the value of 0.
		RegWrite <= 5'd0;
		ReadRegister1 <= 5'd0;
		ReadRegister2 <= 5'd0;
		WriteRegister <= 5'd31;
		WriteData <= 64'h00000000000000A0;
		@(posedge clk);
		
		$display("%t Attempting overwrite of register 31, which should always be 0", $time);
		RegWrite <= 1;
		@(posedge clk);

		// Write a value into each  register.
		$display("%t Writing pattern to all registers.", $time);
		for (i=0; i<31; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*64'h0000010204080001;
			@(posedge clk);
			
			RegWrite <= 1;
			@(posedge clk);
		end

		// Go back and verify that the registers
		// retained the data.
		$display("%t Checking pattern.", $time);
		for (i=0; i<32; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*64'h0000000000000100+i;
			@(posedge clk);
		end
		$stop;
	end
endmodule