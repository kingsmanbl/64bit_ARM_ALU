# 64 bit_ARM_ALU

## Project Overview
This project implements a 64 bit ARM Arithmetic Logic Unit(ALU). The ALU is a critical component in a processor that is responsible for performing arithmetic and logical operations. This ALU can perform 6 operations which are:
1) 000: Pass B
2) 010: Addition
3) 011: Subtraction
4) 100: Bitwise AND
5) 101: Bitwise OR
6) 110: Bitwise XOR

The ALU consists of 8 ports:
Input ports:
1) A and B (64 bit inputs for operands)
Output ports:
1) Result: Result of the ALU operation
2) ALU control: Control signals for the ALU to select the operation
3) Zero Flag: Whether the result output was a 64 bit zero
4) Negative Flag: Whether the result output is negative interpreted as 2's comp
5) Overflow Flag: On an add or subtract, whether the computation overflowed if the inputs are interpreted as 2's comp
6) Carryout Flag: On an add or subtract, whether the computation produced a carry-out

## Implementation Detail
The ALU is composed of following detail:
- 64 bit full adder: Responsible for handling the subtraction and addition operation
- Bit_or: The module that's responsible for handling the bitwise OR operation
- Bit_xor: The module that's responsible for handling the bitwise XOR operation
- Zero_detector: The module that detects whether if the input is 64 bit zeroes
- Bit_and: The module that's repsonsible for handling the bitwise AND operation

The design uses generate statements to manage repetitive structures efficiently, avoiding excessive manual coding. All state-holding elements are built from the D_FF module, and no gates are placed on the clock signal.

## Setup and Cloning
1. Clone the Repository:
   ```bash
   git clone <repository-url>
   ```

2. Open in Quartus II:
   - Create a new project in Quartus II
   - Add all .sv files into the project
   - Compile the design

3. Simulate in Modelsim:
   - Launch modelsim and navigate it to the project directory(make sure the runlab.do file is within the project directory as well)
   - Run the simulation using:
     ```bash
     do runlab.do
     ```
   - Change the runlab.do file if you added any extra project files into the project and also if you want to change the testbench that you're running
   - The wave.do file configures the waveform viewer to display all inputs, outputs, and register contents
  
4. Modify Testbench:
   - Update alu.sv to include additional test cases to verify functionality
