set moduleName backsub_EM_ALGO
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName backsub_EM_ALGO
set C_modelType { int 1 }
set C_modelArgList { 
	{ pixel uint 8 regular  }
	{ pos_r int 17 regular  }
	{ mean float 32 regular {array 307200 { 2 3 } 1 1 }  }
	{ sigma float 32 regular {array 307200 { 2 3 } 1 1 }  }
	{ weight float 32 regular {array 307200 { 2 3 } 1 1 }  }
	{ matchsum int 8 regular {array 307200 { 2 3 } 1 1 }  }
	{ back_gauss int 1 regular {array 307200 { 2 0 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "pixel", "interface" : "wire", "bitwidth" : 8} , 
 	{ "Name" : "pos_r", "interface" : "wire", "bitwidth" : 17} , 
 	{ "Name" : "mean", "interface" : "memory", "bitwidth" : 32} , 
 	{ "Name" : "sigma", "interface" : "memory", "bitwidth" : 32} , 
 	{ "Name" : "weight", "interface" : "memory", "bitwidth" : 32} , 
 	{ "Name" : "matchsum", "interface" : "memory", "bitwidth" : 8} , 
 	{ "Name" : "back_gauss", "interface" : "memory", "bitwidth" : 1} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ pixel sc_in sc_lv 8 signal 0 } 
	{ pos_r sc_in sc_lv 17 signal 1 } 
	{ mean_address0 sc_out sc_lv 19 signal 2 } 
	{ mean_ce0 sc_out sc_logic 1 signal 2 } 
	{ mean_we0 sc_out sc_logic 1 signal 2 } 
	{ mean_d0 sc_out sc_lv 32 signal 2 } 
	{ mean_q0 sc_in sc_lv 32 signal 2 } 
	{ sigma_address0 sc_out sc_lv 19 signal 3 } 
	{ sigma_ce0 sc_out sc_logic 1 signal 3 } 
	{ sigma_we0 sc_out sc_logic 1 signal 3 } 
	{ sigma_d0 sc_out sc_lv 32 signal 3 } 
	{ sigma_q0 sc_in sc_lv 32 signal 3 } 
	{ weight_address0 sc_out sc_lv 19 signal 4 } 
	{ weight_ce0 sc_out sc_logic 1 signal 4 } 
	{ weight_we0 sc_out sc_logic 1 signal 4 } 
	{ weight_d0 sc_out sc_lv 32 signal 4 } 
	{ weight_q0 sc_in sc_lv 32 signal 4 } 
	{ matchsum_address0 sc_out sc_lv 19 signal 5 } 
	{ matchsum_ce0 sc_out sc_logic 1 signal 5 } 
	{ matchsum_we0 sc_out sc_logic 1 signal 5 } 
	{ matchsum_d0 sc_out sc_lv 8 signal 5 } 
	{ matchsum_q0 sc_in sc_lv 8 signal 5 } 
	{ back_gauss_address0 sc_out sc_lv 19 signal 6 } 
	{ back_gauss_ce0 sc_out sc_logic 1 signal 6 } 
	{ back_gauss_we0 sc_out sc_logic 1 signal 6 } 
	{ back_gauss_d0 sc_out sc_lv 1 signal 6 } 
	{ back_gauss_q0 sc_in sc_lv 1 signal 6 } 
	{ back_gauss_address1 sc_out sc_lv 19 signal 6 } 
	{ back_gauss_ce1 sc_out sc_logic 1 signal 6 } 
	{ back_gauss_we1 sc_out sc_logic 1 signal 6 } 
	{ back_gauss_d1 sc_out sc_lv 1 signal 6 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "pixel", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixel", "role": "default" }} , 
 	{ "name": "pos_r", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "pos_r", "role": "default" }} , 
 	{ "name": "mean_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "mean", "role": "address0" }} , 
 	{ "name": "mean_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mean", "role": "ce0" }} , 
 	{ "name": "mean_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mean", "role": "we0" }} , 
 	{ "name": "mean_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mean", "role": "d0" }} , 
 	{ "name": "mean_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mean", "role": "q0" }} , 
 	{ "name": "sigma_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "sigma", "role": "address0" }} , 
 	{ "name": "sigma_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sigma", "role": "ce0" }} , 
 	{ "name": "sigma_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sigma", "role": "we0" }} , 
 	{ "name": "sigma_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sigma", "role": "d0" }} , 
 	{ "name": "sigma_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sigma", "role": "q0" }} , 
 	{ "name": "weight_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "weight", "role": "address0" }} , 
 	{ "name": "weight_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight", "role": "ce0" }} , 
 	{ "name": "weight_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight", "role": "we0" }} , 
 	{ "name": "weight_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weight", "role": "d0" }} , 
 	{ "name": "weight_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weight", "role": "q0" }} , 
 	{ "name": "matchsum_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "matchsum", "role": "address0" }} , 
 	{ "name": "matchsum_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matchsum", "role": "ce0" }} , 
 	{ "name": "matchsum_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matchsum", "role": "we0" }} , 
 	{ "name": "matchsum_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "matchsum", "role": "d0" }} , 
 	{ "name": "matchsum_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "matchsum", "role": "q0" }} , 
 	{ "name": "back_gauss_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "back_gauss", "role": "address0" }} , 
 	{ "name": "back_gauss_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "back_gauss", "role": "ce0" }} , 
 	{ "name": "back_gauss_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "back_gauss", "role": "we0" }} , 
 	{ "name": "back_gauss_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "back_gauss", "role": "d0" }} , 
 	{ "name": "back_gauss_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "back_gauss", "role": "q0" }} , 
 	{ "name": "back_gauss_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "back_gauss", "role": "address1" }} , 
 	{ "name": "back_gauss_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "back_gauss", "role": "ce1" }} , 
 	{ "name": "back_gauss_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "back_gauss", "role": "we1" }} , 
 	{ "name": "back_gauss_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "back_gauss", "role": "d1" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}
set Spec2ImplPortList { 
	pixel { ap_none {  { pixel in_data 0 8 } } }
	pos_r { ap_none {  { pos_r in_data 0 17 } } }
	mean { ap_memory {  { mean_address0 mem_address 1 19 }  { mean_ce0 mem_ce 1 1 }  { mean_we0 mem_we 1 1 }  { mean_d0 mem_din 1 32 }  { mean_q0 mem_dout 0 32 } } }
	sigma { ap_memory {  { sigma_address0 mem_address 1 19 }  { sigma_ce0 mem_ce 1 1 }  { sigma_we0 mem_we 1 1 }  { sigma_d0 mem_din 1 32 }  { sigma_q0 mem_dout 0 32 } } }
	weight { ap_memory {  { weight_address0 mem_address 1 19 }  { weight_ce0 mem_ce 1 1 }  { weight_we0 mem_we 1 1 }  { weight_d0 mem_din 1 32 }  { weight_q0 mem_dout 0 32 } } }
	matchsum { ap_memory {  { matchsum_address0 mem_address 1 19 }  { matchsum_ce0 mem_ce 1 1 }  { matchsum_we0 mem_we 1 1 }  { matchsum_d0 mem_din 1 8 }  { matchsum_q0 mem_dout 0 8 } } }
	back_gauss { ap_memory {  { back_gauss_address0 mem_address 1 19 }  { back_gauss_ce0 mem_ce 1 1 }  { back_gauss_we0 mem_we 1 1 }  { back_gauss_d0 mem_din 1 1 }  { back_gauss_q0 mem_dout 0 1 }  { back_gauss_address1 mem_address 1 19 }  { back_gauss_ce1 mem_ce 1 1 }  { back_gauss_we1 mem_we 1 1 }  { back_gauss_d1 mem_din 1 1 } } }
}
