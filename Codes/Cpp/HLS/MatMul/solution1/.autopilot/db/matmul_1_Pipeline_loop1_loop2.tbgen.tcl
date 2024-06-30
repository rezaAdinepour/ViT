set moduleName matmul_1_Pipeline_loop1_loop2
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {matmul_1_Pipeline_loop1_loop2}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_reload99 float 32 regular  }
	{ p_reload98 float 32 regular  }
	{ p_reload97 float 32 regular  }
	{ p_reload96 float 32 regular  }
	{ p_reload95 float 32 regular  }
	{ p_reload94 float 32 regular  }
	{ p_reload93 float 32 regular  }
	{ p_reload92 float 32 regular  }
	{ p_reload float 32 regular  }
	{ output_C float 32 regular {array 9 { 0 3 } 0 1 }  }
	{ p_reload118 float 32 regular  }
	{ p_reload117 float 32 regular  }
	{ p_reload116 float 32 regular  }
	{ p_reload115 float 32 regular  }
	{ p_reload114 float 32 regular  }
	{ p_reload113 float 32 regular  }
	{ p_reload112 float 32 regular  }
	{ p_reload111 float 32 regular  }
	{ p_reload110 float 32 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "p_reload99", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload98", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload97", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload96", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload95", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload94", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload93", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload92", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "output_C", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_reload118", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload117", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload116", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload115", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload114", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload113", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload112", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload111", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_reload110", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_reload99 sc_in sc_lv 32 signal 0 } 
	{ p_reload98 sc_in sc_lv 32 signal 1 } 
	{ p_reload97 sc_in sc_lv 32 signal 2 } 
	{ p_reload96 sc_in sc_lv 32 signal 3 } 
	{ p_reload95 sc_in sc_lv 32 signal 4 } 
	{ p_reload94 sc_in sc_lv 32 signal 5 } 
	{ p_reload93 sc_in sc_lv 32 signal 6 } 
	{ p_reload92 sc_in sc_lv 32 signal 7 } 
	{ p_reload sc_in sc_lv 32 signal 8 } 
	{ output_C_address0 sc_out sc_lv 4 signal 9 } 
	{ output_C_ce0 sc_out sc_logic 1 signal 9 } 
	{ output_C_we0 sc_out sc_logic 1 signal 9 } 
	{ output_C_d0 sc_out sc_lv 32 signal 9 } 
	{ p_reload118 sc_in sc_lv 32 signal 10 } 
	{ p_reload117 sc_in sc_lv 32 signal 11 } 
	{ p_reload116 sc_in sc_lv 32 signal 12 } 
	{ p_reload115 sc_in sc_lv 32 signal 13 } 
	{ p_reload114 sc_in sc_lv 32 signal 14 } 
	{ p_reload113 sc_in sc_lv 32 signal 15 } 
	{ p_reload112 sc_in sc_lv 32 signal 16 } 
	{ p_reload111 sc_in sc_lv 32 signal 17 } 
	{ p_reload110 sc_in sc_lv 32 signal 18 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_reload99", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload99", "role": "default" }} , 
 	{ "name": "p_reload98", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload98", "role": "default" }} , 
 	{ "name": "p_reload97", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload97", "role": "default" }} , 
 	{ "name": "p_reload96", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload96", "role": "default" }} , 
 	{ "name": "p_reload95", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload95", "role": "default" }} , 
 	{ "name": "p_reload94", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload94", "role": "default" }} , 
 	{ "name": "p_reload93", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload93", "role": "default" }} , 
 	{ "name": "p_reload92", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload92", "role": "default" }} , 
 	{ "name": "p_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload", "role": "default" }} , 
 	{ "name": "output_C_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "output_C", "role": "address0" }} , 
 	{ "name": "output_C_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_C", "role": "ce0" }} , 
 	{ "name": "output_C_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_C", "role": "we0" }} , 
 	{ "name": "output_C_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_C", "role": "d0" }} , 
 	{ "name": "p_reload118", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload118", "role": "default" }} , 
 	{ "name": "p_reload117", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload117", "role": "default" }} , 
 	{ "name": "p_reload116", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload116", "role": "default" }} , 
 	{ "name": "p_reload115", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload115", "role": "default" }} , 
 	{ "name": "p_reload114", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload114", "role": "default" }} , 
 	{ "name": "p_reload113", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload113", "role": "default" }} , 
 	{ "name": "p_reload112", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload112", "role": "default" }} , 
 	{ "name": "p_reload111", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload111", "role": "default" }} , 
 	{ "name": "p_reload110", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_reload110", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_3_full_dsp_1_U29", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_3_full_dsp_1_U30", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_3_full_dsp_1_U31", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U32", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U33", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U34", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_32_1_1_U35", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_32_1_1_U36", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_32_1_1_U37", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_32_1_1_U38", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_32_1_1_U39", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_32_1_1_U40", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		p_reload110 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "22", "Max" : "22"}
	, {"Name" : "Interval", "Min" : "22", "Max" : "22"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_reload99 { ap_none {  { p_reload99 in_data 0 32 } } }
	p_reload98 { ap_none {  { p_reload98 in_data 0 32 } } }
	p_reload97 { ap_none {  { p_reload97 in_data 0 32 } } }
	p_reload96 { ap_none {  { p_reload96 in_data 0 32 } } }
	p_reload95 { ap_none {  { p_reload95 in_data 0 32 } } }
	p_reload94 { ap_none {  { p_reload94 in_data 0 32 } } }
	p_reload93 { ap_none {  { p_reload93 in_data 0 32 } } }
	p_reload92 { ap_none {  { p_reload92 in_data 0 32 } } }
	p_reload { ap_none {  { p_reload in_data 0 32 } } }
	output_C { ap_memory {  { output_C_address0 mem_address 1 4 }  { output_C_ce0 mem_ce 1 1 }  { output_C_we0 mem_we 1 1 }  { output_C_d0 mem_din 1 32 } } }
	p_reload118 { ap_none {  { p_reload118 in_data 0 32 } } }
	p_reload117 { ap_none {  { p_reload117 in_data 0 32 } } }
	p_reload116 { ap_none {  { p_reload116 in_data 0 32 } } }
	p_reload115 { ap_none {  { p_reload115 in_data 0 32 } } }
	p_reload114 { ap_none {  { p_reload114 in_data 0 32 } } }
	p_reload113 { ap_none {  { p_reload113 in_data 0 32 } } }
	p_reload112 { ap_none {  { p_reload112 in_data 0 32 } } }
	p_reload111 { ap_none {  { p_reload111 in_data 0 32 } } }
	p_reload110 { ap_none {  { p_reload110 in_data 0 32 } } }
}
