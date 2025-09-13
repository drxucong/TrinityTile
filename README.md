TrinityTile
===========

TrinityTile is a reconfigurable 3-in-1 logic tile designed for TinyTapeout SKY130.
It demonstrates a unified hardware architecture that can dynamically switch between
three roles:

  - CPU-Max: 8-bit accumulator-based CPU with a small RISC-like instruction set.
  - GPU/SIMD-Max: Bit-serial 8x8 MAC array acting as a tiny vector/tensor engine.
  - Mem-Max: Streaming memory engine with buffer, reduction, and remap operations.

Goal
----
Validate the concept of a unified reconfigurable tile that can morph into different
compute roles for edge AI acceleration.

Architecture Overview
---------------------
+-----------------------------+
|        TrinityTile          |
|   (2x2 TinyTapeout tiles)   |
|                             |
|   +---------+               |
|   |  CPU    |               |
|   |  SIMD   |   Mode FSM    |
|   |  Mem    | <---------->  |
|   +---------+               |
+-----------------------------+

Key Properties
--------------
- Unified RTL design: All three roles exist in hardware.
- Mode switching: External 'mode' register selects which role is active.
- Scalability: Multiple TrinityTiles can be tiled together into larger fabrics.

TinyTapeout I/O Specification
-----------------------------
Signal   Dir  Width  Description
------   ---  -----  -----------------------------------------------
ui_in     in     8   User inputs (mode select, data, etc.)
uo_out   out     8   User outputs (status, result)
uio_in    in     8   Bidirectional inputs
uio_out  out     8   Bidirectional outputs
uio_oe   out     8   Output enable for bidirectional pins
ena       in     1   Enable
clk       in     1   Clock
rst_n     in     1   Reset (active low)

Project Status
--------------
[ x ] Architecture definition
[   ] RTL implementation (CPU, SIMD, Mem engines)
[   ] FPGA prototype test on Xilinx Zynq (XCZU15EG)
[   ] Submission to TinyTapeout SKY130 (TT25a)

Getting Started
---------------
Clone this repo:
  git clone https://github.com/drxucong/TrinityTile.git
  cd TrinityTile

Run simulation (using Verilator + cocotb):
  make sim

Run synthesis (Yosys + OpenLane flow):
  make synth

License
-------
This project is licensed under the MIT License.
