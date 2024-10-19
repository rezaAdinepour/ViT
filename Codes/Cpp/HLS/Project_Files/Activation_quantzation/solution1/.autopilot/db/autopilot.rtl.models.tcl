set SynModuleInfo {
  {SRCNAME generic_round<float> MODELNAME generic_round_float_s RTLNAME activation_quant_generic_round_float_s
    SUBMODULES {
      {MODELNAME activation_quant_generic_round_float_s_mask_table_ROM_AUTO_1R RTLNAME activation_quant_generic_round_float_s_mask_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME activation_quant_generic_round_float_s_one_half_table_ROM_AUTO_1R RTLNAME activation_quant_generic_round_float_s_one_half_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME generic_fmax<float> MODELNAME generic_fmax_float_s RTLNAME activation_quant_generic_fmax_float_s}
  {SRCNAME activation_quant MODELNAME activation_quant RTLNAME activation_quant IS_TOP 1
    SUBMODULES {
      {MODELNAME activation_quant_fmul_32ns_32ns_32_2_max_dsp_1 RTLNAME activation_quant_fmul_32ns_32ns_32_2_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME activation_quant_fdiv_32ns_32ns_32_7_no_dsp_1 RTLNAME activation_quant_fdiv_32ns_32ns_32_7_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME activation_quant_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME activation_quant_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
}
