############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project Bit_linear
set_top bit_linear
add_files Bit_linear/src/bit_linear.cpp
add_files Bit_linear/src/bit_linear.h
add_files -tb Bit_linear/src/tb_bit_linear.cpp -cflags "-Wno-unknown-pragmas"
add_files -tb Bit_linear/src/tb_bit_linear.h -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xcvu11p-flga2577-1-e}
create_clock -period 10 -name default
config_export -format sysgen -rtl verilog
source "./Bit_linear/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format sysgen
