#! /bin/bash

ghdl -a PC.vhd
ghdl -e PC_logic
ghdl -a pc_tb.vhd
ghdl -e pt_logic_tb
ghdl -r PC_logic_tb --stop-time=100us --vcd=PC_logic_tb.vcd
gtkwave PC_logic_tb.vcd