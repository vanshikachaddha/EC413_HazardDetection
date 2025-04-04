`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:32 03/21/2017 
// Design Name: 
// Module Name:    CPU_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CPU_tb;

	// Inputs
	reg clk;
	reg Reset;
	reg LoadInstructions;
	reg [31:0] Instruction;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.out(out), 
		.clk(clk), 
		.Reset(Reset), 
		.LoadInstructions(LoadInstructions), 
		.Instruction(Instruction)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 1;
		LoadInstructions = 0;
		Instruction = 0;
		#10;
		Reset = 0;
		LoadInstructions = 1;
		#10;
		// begin by loading values into registers
		Instruction = 32'b001000_00000_00001_0000000000010000; //addi $R1, $R0, 16
		#10;
		Instruction = 32'b001000_00000_00010_0000000000011000; //addi $R2, $R0, 24
		#10;
		Instruction = 32'b001000_00000_00011_0000000110110100; //addi $R3, $R0, 436
		#10;
		Instruction = 32'b001000_00000_00100_0000000000001010; //addi $R4, $R0, 10
		#10;
		Instruction = 32'b001000_00000_00101_0000000000000001; //addi $R5, $R0, 1
		#10;
		Instruction = 32'b100011_00000_00110_0000000000001000;	// LW $R6, 8(R0)
		#10;
		Instruction = 32'b000000_00110_00011_01001_00000_100101; //or  $R9, $R6, $R3
		#10;
		Instruction = 32'b000000_00001_00010_01000_00000_100010; //sub  $R8, $R1, $R2
		#10;
		Instruction = 32'b000000_00101_01001_01010_00000_100000; //add  $R10, $R5, $R9
		#10;
		Instruction = 32'b101011_00000_00111_0000000000001100; 	// SW	$R7, 12(R0)
		#10;
		Instruction = 32'b001000_01010_01011_0000000000111001; //addi $R11, $R10, 57
		#10;
		Instruction = 32'b000000_00111_00010_01100_00000_100100; //and  $R12, $R7, $R2
		#10;
		Instruction = 32'b000000_01011_01100_01101_00000_101010; //slt  $R13, $R11, $R12
		#10;
		Instruction = 32'b001000_01011_01110_0000000000111001; //addi $R14, $R11, 57
		#10;
		Instruction = 32'b001000_01011_01111_0111000000111001; //addi $R15, $R11, 28729
		#10;
		Instruction = 32'b001000_01011_10000_0111000000111001; //addi $R16, $R11, 28729
		#10;

        Instruction = 32'b001000_01011_01110_0000000000111001; //addi $R14, $R11, 57

        #10;

        Instruction = 32'b001000_01011_01111_0111000000111001; //addi $R15, $R11, 28729

        #10;

        Instruction = 32'b001000_01011_10000_0111000000111001; //addi $R16, $R11, 28729

		#10;
		LoadInstructions = 0;
      		Reset = 1;
		#10;
		Reset = 0;
		#100;
		// Add stimulus here

	end
	always begin
	#5;
	clk = ~clk;
	end
      
endmodule
