set moduleName matmul_1
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {matmul_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_A_V_data_V int 32 regular {axi_s 0 volatile  { in_A Data } }  }
	{ in_A_V_keep_V int 4 regular {axi_s 0 volatile  { in_A Keep } }  }
	{ in_A_V_strb_V int 4 regular {axi_s 0 volatile  { in_A Strb } }  }
	{ in_A_V_last_V int 1 regular {axi_s 0 volatile  { in_A Last } }  }
	{ out_C_V_data_V int 32 regular {axi_s 1 volatile  { out_C Data } }  }
	{ out_C_V_keep_V int 4 regular {axi_s 1 volatile  { out_C Keep } }  }
	{ out_C_V_strb_V int 4 regular {axi_s 1 volatile  { out_C Strb } }  }
	{ out_C_V_last_V int 1 regular {axi_s 1 volatile  { out_C Last } }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "in_A_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_A_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "in_A_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "in_A_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "out_C_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_C_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_C_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_C_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ in_A_TDATA sc_in sc_lv 32 signal 0 } 
	{ in_A_TVALID sc_in sc_logic 1 invld 3 } 
	{ in_A_TREADY sc_out sc_logic 1 inacc 3 } 
	{ in_A_TKEEP sc_in sc_lv 4 signal 1 } 
	{ in_A_TSTRB sc_in sc_lv 4 signal 2 } 
	{ in_A_TLAST sc_in sc_lv 1 signal 3 } 
	{ out_C_TDATA sc_out sc_lv 32 signal 4 } 
	{ out_C_TVALID sc_out sc_logic 1 outvld 7 } 
	{ out_C_TREADY sc_in sc_logic 1 outacc 7 } 
	{ out_C_TKEEP sc_out sc_lv 4 signal 5 } 
	{ out_C_TSTRB sc_out sc_lv 4 signal 6 } 
	{ out_C_TLAST sc_out sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "in_A_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_A_V_data_V", "role": "default" }} , 
 	{ "name": "in_A_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_A_V_last_V", "role": "default" }} , 
 	{ "name": "in_A_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_A_V_last_V", "role": "default" }} , 
 	{ "name": "in_A_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_A_V_keep_V", "role": "default" }} , 
 	{ "name": "in_A_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_A_V_strb_V", "role": "default" }} , 
 	{ "name": "in_A_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_A_V_last_V", "role": "default" }} , 
 	{ "name": "out_C_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_C_V_data_V", "role": "default" }} , 
 	{ "name": "out_C_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_C_V_last_V", "role": "default" }} , 
 	{ "name": "out_C_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_C_V_last_V", "role": "default" }} , 
 	{ "name": "out_C_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_C_V_keep_V", "role": "default" }} , 
 	{ "name": "out_C_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_C_V_strb_V", "role": "default" }} , 
 	{ "name": "out_C_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_C_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "4", "6", "20", "22", "23", "24", "25", "26", "27", "28", "29"],
		"CDFG" : "matmul_1",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "65", "EstimateLatencyMax" : "65",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_A_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_matmul_1_Pipeline_loop_input_B1_loop_input_B2_fu_163", "Port" : "in_A_V_data_V", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "2", "SubInstance" : "grp_matmul_1_Pipeline_loop_input_A1_loop_input_A2_fu_142", "Port" : "in_A_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "in_A_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_matmul_1_Pipeline_loop_input_B1_loop_input_B2_fu_163", "Port" : "in_A_V_keep_V", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "2", "SubInstance" : "grp_matmul_1_Pipeline_loop_input_A1_loop_input_A2_fu_142", "Port" : "in_A_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "in_A_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_matmul_1_Pipeline_loop_input_B1_loop_input_B2_fu_163", "Port" : "in_A_V_strb_V", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "2", "SubInstance" : "grp_matmul_1_Pipeline_loop_input_A1_loop_input_A2_fu_142", "Port" : "in_A_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "in_A_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_matmul_1_Pipeline_loop_input_B1_loop_input_B2_fu_163", "Port" : "in_A_V_last_V", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "2", "SubInstance" : "grp_matmul_1_Pipeline_loop_input_A1_loop_input_A2_fu_142", "Port" : "in_A_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "out_C_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_C",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_matmul_1_Pipeline_loop_output_C1_loop_output_C2_fu_209", "Port" : "out_C_V_data_V", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "out_C_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_C",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_matmul_1_Pipeline_loop_output_C1_loop_output_C2_fu_209", "Port" : "out_C_V_keep_V", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "out_C_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_C",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_matmul_1_Pipeline_loop_output_C1_loop_output_C2_fu_209", "Port" : "out_C_V_strb_V", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "out_C_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_C",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_matmul_1_Pipeline_loop_output_C1_loop_output_C2_fu_209", "Port" : "out_C_V_last_V", "Inst_start_state" : "9", "Inst_end_state" : "10"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_C_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop_input_A1_loop_input_A2_fu_142", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "matmul_1_Pipeline_loop_input_A1_loop_input_A2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_A_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A",
				"BlockSignal" : [
					{"Name" : "in_A_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_A_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A"},
			{"Name" : "in_A_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A"},
			{"Name" : "in_A_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_input_A1_loop_input_A2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop_input_A1_loop_input_A2_fu_142.flow_control_loop_pipe_sequential_init_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop_input_B1_loop_input_B2_fu_163", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "matmul_1_Pipeline_loop_input_B1_loop_input_B2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_A_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A",
				"BlockSignal" : [
					{"Name" : "in_A_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_A_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A"},
			{"Name" : "in_A_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A"},
			{"Name" : "in_A_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_A"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_phi_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_phi7_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_input_B1_loop_input_B2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop_input_B1_loop_input_B2_fu_163.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186", "Parent" : "0", "Child" : ["7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"],
		"CDFG" : "matmul_1_Pipeline_loop1_loop2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "22", "EstimateLatencyMax" : "22",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_reload99", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload98", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload97", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload96", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload95", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload94", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload93", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload92", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_C", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "p_reload118", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload117", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload116", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload115", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload114", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload113", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload112", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload111", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_reload110", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop1_loop2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter12", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter12", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.fadd_32ns_32ns_32_3_full_dsp_1_U29", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.fadd_32ns_32ns_32_3_full_dsp_1_U30", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.fadd_32ns_32ns_32_3_full_dsp_1_U31", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.fmul_32ns_32ns_32_2_max_dsp_1_U32", "Parent" : "6"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.fmul_32ns_32ns_32_2_max_dsp_1_U33", "Parent" : "6"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.fmul_32ns_32ns_32_2_max_dsp_1_U34", "Parent" : "6"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.mux_3_2_32_1_1_U35", "Parent" : "6"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.mux_3_2_32_1_1_U36", "Parent" : "6"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.mux_3_2_32_1_1_U37", "Parent" : "6"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.mux_3_2_32_1_1_U38", "Parent" : "6"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.mux_3_2_32_1_1_U39", "Parent" : "6"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.mux_3_2_32_1_1_U40", "Parent" : "6"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop1_loop2_fu_186.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop_output_C1_loop_output_C2_fu_209", "Parent" : "0", "Child" : ["21"],
		"CDFG" : "matmul_1_Pipeline_loop_output_C1_loop_output_C2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "output_C", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_phi_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_phi7_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_C_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_C",
				"BlockSignal" : [
					{"Name" : "out_C_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_C_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_C"},
			{"Name" : "out_C_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_C"},
			{"Name" : "out_C_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_C"}],
		"Loop" : [
			{"Name" : "loop_output_C1_loop_output_C2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_1_Pipeline_loop_output_C1_loop_output_C2_fu_209.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_A_V_data_V_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_A_V_keep_V_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_A_V_strb_V_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_A_V_last_V_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_C_V_data_V_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_C_V_keep_V_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_C_V_strb_V_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_C_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	matmul_1 {
		in_A_V_data_V {Type I LastRead 0 FirstWrite -1}
		in_A_V_keep_V {Type I LastRead 0 FirstWrite -1}
		in_A_V_strb_V {Type I LastRead 0 FirstWrite -1}
		in_A_V_last_V {Type I LastRead 0 FirstWrite -1}
		out_C_V_data_V {Type O LastRead -1 FirstWrite 1}
		out_C_V_keep_V {Type O LastRead -1 FirstWrite 1}
		out_C_V_strb_V {Type O LastRead -1 FirstWrite 1}
		out_C_V_last_V {Type O LastRead -1 FirstWrite 1}}
	matmul_1_Pipeline_loop_input_A1_loop_input_A2 {
		in_A_V_data_V {Type I LastRead 0 FirstWrite -1}
		in_A_V_keep_V {Type I LastRead 0 FirstWrite -1}
		in_A_V_strb_V {Type I LastRead 0 FirstWrite -1}
		in_A_V_last_V {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 0}
		p_out1 {Type O LastRead -1 FirstWrite 0}
		p_out2 {Type O LastRead -1 FirstWrite 0}
		p_out3 {Type O LastRead -1 FirstWrite 0}
		p_out4 {Type O LastRead -1 FirstWrite 0}
		p_out5 {Type O LastRead -1 FirstWrite 0}
		p_out6 {Type O LastRead -1 FirstWrite 0}
		p_out7 {Type O LastRead -1 FirstWrite 0}
		p_out8 {Type O LastRead -1 FirstWrite 0}}
	matmul_1_Pipeline_loop_input_B1_loop_input_B2 {
		in_A_V_data_V {Type I LastRead 0 FirstWrite -1}
		in_A_V_keep_V {Type I LastRead 0 FirstWrite -1}
		in_A_V_strb_V {Type I LastRead 0 FirstWrite -1}
		in_A_V_last_V {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 0}
		p_out1 {Type O LastRead -1 FirstWrite 0}
		p_out2 {Type O LastRead -1 FirstWrite 0}
		p_out3 {Type O LastRead -1 FirstWrite 0}
		p_out4 {Type O LastRead -1 FirstWrite 0}
		p_out5 {Type O LastRead -1 FirstWrite 0}
		p_out6 {Type O LastRead -1 FirstWrite 0}
		p_out7 {Type O LastRead -1 FirstWrite 0}
		p_out8 {Type O LastRead -1 FirstWrite 0}
		p_phi_out {Type O LastRead -1 FirstWrite 0}
		p_phi7_out {Type O LastRead -1 FirstWrite 0}}
	matmul_1_Pipeline_loop1_loop2 {
		p_reload99 {Type I LastRead 0 FirstWrite -1}
		p_reload98 {Type I LastRead 0 FirstWrite -1}
		p_reload97 {Type I LastRead 0 FirstWrite -1}
		p_reload96 {Type I LastRead 0 FirstWrite -1}
		p_reload95 {Type I LastRead 0 FirstWrite -1}
		p_reload94 {Type I LastRead 0 FirstWrite -1}
		p_reload93 {Type I LastRead 0 FirstWrite -1}
		p_reload92 {Type I LastRead 0 FirstWrite -1}
		p_reload {Type I LastRead 0 FirstWrite -1}
		output_C {Type O LastRead -1 FirstWrite 12}
		p_reload118 {Type I LastRead 0 FirstWrite -1}
		p_reload117 {Type I LastRead 0 FirstWrite -1}
		p_reload116 {Type I LastRead 0 FirstWrite -1}
		p_reload115 {Type I LastRead 0 FirstWrite -1}
		p_reload114 {Type I LastRead 0 FirstWrite -1}
		p_reload113 {Type I LastRead 0 FirstWrite -1}
		p_reload112 {Type I LastRead 0 FirstWrite -1}
		p_reload111 {Type I LastRead 0 FirstWrite -1}
		p_reload110 {Type I LastRead 0 FirstWrite -1}}
	matmul_1_Pipeline_loop_output_C1_loop_output_C2 {
		output_C {Type I LastRead 0 FirstWrite -1}
		p_phi_reload {Type I LastRead 0 FirstWrite -1}
		p_phi7_reload {Type I LastRead 0 FirstWrite -1}
		out_C_V_data_V {Type O LastRead -1 FirstWrite 1}
		out_C_V_keep_V {Type O LastRead -1 FirstWrite 1}
		out_C_V_strb_V {Type O LastRead -1 FirstWrite 1}
		out_C_V_last_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "65", "Max" : "65"}
	, {"Name" : "Interval", "Min" : "66", "Max" : "66"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	in_A_V_data_V { axis {  { in_A_TDATA in_data 0 32 } } }
	in_A_V_keep_V { axis {  { in_A_TKEEP in_data 0 4 } } }
	in_A_V_strb_V { axis {  { in_A_TSTRB in_data 0 4 } } }
	in_A_V_last_V { axis {  { in_A_TVALID in_vld 0 1 }  { in_A_TREADY in_acc 1 1 }  { in_A_TLAST in_data 0 1 } } }
	out_C_V_data_V { axis {  { out_C_TDATA out_data 1 32 } } }
	out_C_V_keep_V { axis {  { out_C_TKEEP out_data 1 4 } } }
	out_C_V_strb_V { axis {  { out_C_TSTRB out_data 1 4 } } }
	out_C_V_last_V { axis {  { out_C_TVALID out_vld 1 1 }  { out_C_TREADY out_acc 0 1 }  { out_C_TLAST out_data 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
