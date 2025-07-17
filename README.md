# 8-Bit ALU 

## Description
This project implements an 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL. It performs arithmetic and logic operations including addition, subtraction, multiplication, and basic logic gates. The design is structured for simulation and synthesis on FPGA platforms like Xilinx Vivado.

## Features
- Addition using an 8-bit Carry Lookahead Adder (CLA)
- Subtraction using Two’s Complement logic
- Multiplication using Array Multiplier
- Logic operations: AND, OR, XOR, NOT
- Modular design with clearly separated Verilog files
- Operation selector via 3-bit `sel` signal

## Inputs
- `a [7:0]`   : First 8-bit input operand
- `b [7:0]`   : Second 8-bit input operand
- `cin`       : Carry input used in addition
- `sel [2:0]` : Operation selector signal

## Outputs
- `result [15:0]` : 16-bit result of the selected operation
- `carry`         : Carry-out for addition or subtraction

## Operation Select (sel)   
000: Addition  
001: Subtraction  
010: Multiplication  
011: AND  
100: OR  
101: XOR  
110: NOT (on input `a`)  
others: Output = 0   

## File Descriptions
- `alu_8bit_tb.v` : test bench
- `array_multiplier_8bit.v`  : 8-bit array multiplier
- `carry_lookahead_adder_8bit.v` : 8-bit CLA module
- `carry_lookahead_adder_4bit.v` : Helper module for 8-bit CLA
- `decoder.v`                 : Operation decoder
- `half_adder.v`, `full_adder.v` : Basic arithmetic building blocks
- `logic_operations.v`       : Logic operations (AND, OR, XOR, NOT)
- `twos_complement_subtractor.v` : Subtraction using two’s complement

## Simulation

1. Use Xilinx Vivado or any Verilog simulator.
2. Set `alu_8bit` as the top module.
3. Run the testbench.
4. Run behavioral simulation to verify all operations.

### Simulation output

[Design simulation output]  
[Simulation output]

## Author
Rashmi M S  
GitHub: https://github.com/RashmiMS-03
