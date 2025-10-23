README: Universal Shift Register Project Overview 
Project Goal: To create an 8-bit Universal Shift Register capable of performing multiple data manipulation functions within a single module.

Core Functionality: The register implements four operations controlled by the 2-bit input ctrl: Load, Hold, Shift Left, and Shift Right.

Technology: Implemented using Verilog HDL to describe both the sequential (flip-flop) and combinational (next-state logic) parts of the circuit.

Key Mechanism: State updates are synchronous (on the positive clock edge), while the reset is asynchronous (immediate clear).

Verification: The design is tested using the Testbench module (sim.v), which applies a sequence of control signals to confirm all four modes operate correctly.
