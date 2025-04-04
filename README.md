# Lab 8 – Pipelined MIPS CPU: Hazard Detection

This project implements a 5-stage pipelined MIPS CPU in Verilog with a custom hazard detection unit. The CPU has **no forwarding support**, and the hazard detection unit is responsible for handling:

- Load-use hazards  
- 1-ahead hazards  
- 2-ahead hazards  

Hazards are resolved by inserting NOPs (pipeline stalls) until the required data is written back to the register file.

## Features

- Detects and stalls on data hazards (load-use, 1-ahead, 2-ahead)
- Inserts appropriate number of NOPs
- Compatible with MIPS-style instruction set
- Includes testbench for verifying hazard detection
