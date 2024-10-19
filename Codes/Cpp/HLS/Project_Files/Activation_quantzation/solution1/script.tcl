############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project Activation_quantzation
set_top activation_quant
add_files Activation_quantzation/src/activation_quant.cpp
add_files Activation_quantzation/src/activation_quant.h
add_files -tb Activation_quantzation/src/tb_activation_quant.cpp -cflags "-Wno-unknown-pragmas"
add_files -tb Activation_quantzation/src/tb_activation_quant.h -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xcvu11p-flga2577-1-e}
create_clock -period 10 -name default
config_export -format sysgen -rtl verilog
source "./Activation_quantzation/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format sysgen
