set SynModuleInfo {
  {SRCNAME generic_round<float> MODELNAME generic_round_float_s RTLNAME weight_quant_generic_round_float_s
    SUBMODULES {
      {MODELNAME weight_quant_generic_round_float_s_mask_table_ROM_AUTO_1R RTLNAME weight_quant_generic_round_float_s_mask_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME weight_quant_generic_round_float_s_one_half_table_ROM_AUTO_1R RTLNAME weight_quant_generic_round_float_s_one_half_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME weight_quant MODELNAME weight_quant RTLNAME weight_quant IS_TOP 1
    SUBMODULES {
      {MODELNAME weight_quant_fadd_32ns_32ns_32_3_full_dsp_1 RTLNAME weight_quant_fadd_32ns_32ns_32_3_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME weight_quant_fmul_32ns_32ns_32_2_max_dsp_1 RTLNAME weight_quant_fmul_32ns_32ns_32_2_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME weight_quant_fdiv_32ns_32ns_32_7_no_dsp_1 RTLNAME weight_quant_fdiv_32ns_32ns_32_7_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME weight_quant_fptrunc_64ns_32_2_no_dsp_1 RTLNAME weight_quant_fptrunc_64ns_32_2_no_dsp_1 BINDTYPE op TYPE fptrunc IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME weight_quant_fpext_32ns_64_1_no_dsp_1 RTLNAME weight_quant_fpext_32ns_64_1_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME weight_quant_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME weight_quant_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME weight_quant_ddiv_64ns_64ns_64_13_no_dsp_1 RTLNAME weight_quant_ddiv_64ns_64ns_64_13_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 12 ALLOW_PRAGMA 1}
    }
  }
}
