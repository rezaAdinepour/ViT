############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project Weight_quantization
set_top weight_quant
add_files Weight_quantization/src/weight_quant.cpp
add_files Weight_quantization/src/weight_quant.h
add_files -tb Weight_quantization/src/tb_weight_quant.cpp -cflags "-Wno-unknown-pragmas"
add_files -tb Weight_quantization/src/tb_weight_quant.h -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xcvu11p-flga2577-1-e}
create_clock -period 10 -name default
config_export -format sysgen -rtl verilog
source "./Weight_quantization/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format sysgen
