set moduleName backsub
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName backsub
set C_modelType { int 32 }
set C_modelArgList { 
	{ data_array int 32 regular {array 38400 { 1 3 } 1 1 }  }
	{ out_frame int 8 regular {array 76800 { 0 3 } 0 1 }  }
	{ init uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "data_array", "interface" : "memory", "bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "data_array","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 38399,"step" : 1}]}]}]} , 
 	{ "Name" : "out_frame", "interface" : "memory", "bitwidth" : 8,"bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "out_frame","cData": "unsigned char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 76799,"step" : 1}]}]}]} , 
 	{ "Name" : "init", "interface" : "wire", "bitwidth" : 1,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "init","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "return","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 1,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_array_address0 sc_out sc_lv 16 signal 0 } 
	{ data_array_ce0 sc_out sc_logic 1 signal 0 } 
	{ data_array_q0 sc_in sc_lv 32 signal 0 } 
	{ out_frame_address0 sc_out sc_lv 17 signal 1 } 
	{ out_frame_ce0 sc_out sc_logic 1 signal 1 } 
	{ out_frame_we0 sc_out sc_logic 1 signal 1 } 
	{ out_frame_d0 sc_out sc_lv 8 signal 1 } 
	{ init sc_in sc_logic 1 signal 2 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data_array_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "data_array", "role": "address0" }} , 
 	{ "name": "data_array_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_array", "role": "ce0" }} , 
 	{ "name": "data_array_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_array", "role": "q0" }} , 
 	{ "name": "out_frame_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "out_frame", "role": "address0" }} , 
 	{ "name": "out_frame_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame", "role": "ce0" }} , 
 	{ "name": "out_frame_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_frame", "role": "we0" }} , 
 	{ "name": "out_frame_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_frame", "role": "d0" }} , 
 	{ "name": "init", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}
set Spec2ImplPortList { 
	data_array { ap_memory {  { data_array_address0 mem_address 1 16 }  { data_array_ce0 mem_ce 1 1 }  { data_array_q0 mem_dout 0 32 } } }
	out_frame { ap_memory {  { out_frame_address0 mem_address 1 17 }  { out_frame_ce0 mem_ce 1 1 }  { out_frame_we0 mem_we 1 1 }  { out_frame_d0 mem_din 1 8 } } }
	init { ap_none {  { init in_data 0 1 } } }
}

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
