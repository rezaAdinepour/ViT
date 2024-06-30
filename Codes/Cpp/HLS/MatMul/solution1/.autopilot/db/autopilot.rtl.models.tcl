set SynModuleInfo {
  {SRCNAME matmul_1_Pipeline_loop_input_A1_loop_input_A2 MODELNAME matmul_1_Pipeline_loop_input_A1_loop_input_A2 RTLNAME matmul_1_matmul_1_Pipeline_loop_input_A1_loop_input_A2
    SUBMODULES {
      {MODELNAME matmul_1_flow_control_loop_pipe_sequential_init RTLNAME matmul_1_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME matmul_1_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME matmul_1_Pipeline_loop_input_B1_loop_input_B2 MODELNAME matmul_1_Pipeline_loop_input_B1_loop_input_B2 RTLNAME matmul_1_matmul_1_Pipeline_loop_input_B1_loop_input_B2}
  {SRCNAME matmul_1_Pipeline_loop1_loop2 MODELNAME matmul_1_Pipeline_loop1_loop2 RTLNAME matmul_1_matmul_1_Pipeline_loop1_loop2
    SUBMODULES {
      {MODELNAME matmul_1_fadd_32ns_32ns_32_3_full_dsp_1 RTLNAME matmul_1_fadd_32ns_32ns_32_3_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME matmul_1_fmul_32ns_32ns_32_2_max_dsp_1 RTLNAME matmul_1_fmul_32ns_32ns_32_2_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME matmul_1_mux_3_2_32_1_1 RTLNAME matmul_1_mux_3_2_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME matmul_1_Pipeline_loop_output_C1_loop_output_C2 MODELNAME matmul_1_Pipeline_loop_output_C1_loop_output_C2 RTLNAME matmul_1_matmul_1_Pipeline_loop_output_C1_loop_output_C2}
  {SRCNAME matmul_1 MODELNAME matmul_1 RTLNAME matmul_1 IS_TOP 1
    SUBMODULES {
      {MODELNAME matmul_1_output_C_RAM_AUTO_1R1W RTLNAME matmul_1_output_C_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME matmul_1_regslice_both RTLNAME matmul_1_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME matmul_1_regslice_both_U}
    }
  }
}
