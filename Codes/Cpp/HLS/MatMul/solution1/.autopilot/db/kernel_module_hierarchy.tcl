set ModuleHierarchy {[{
"Name" : "matmul_1","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_matmul_1_Pipeline_loop_input_A1_loop_input_A2_fu_142","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_input_A1_loop_input_A2","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_matmul_1_Pipeline_loop_input_B1_loop_input_B2_fu_163","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_input_B1_loop_input_B2","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_matmul_1_Pipeline_loop1_loop2_fu_186","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop1_loop2","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_matmul_1_Pipeline_loop_output_C1_loop_output_C2_fu_209","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_output_C1_loop_output_C2","ID" : "8","Type" : "pipeline"},]},]
}]}