############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2014 Xilinx Inc. All rights reserved.
############################################################
open_project Background_Subtraction_with_GMM
set_top backsub
add_files Background_Subtraction_with_GMM/core.cpp
add_files Background_Subtraction_with_GMM/core.h
add_files -tb Background_Subtraction_with_GMM/test_cam.cpp
add_files -tb Background_Subtraction_with_GMM/test_cam.h
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
source "./Background_Subtraction_with_GMM/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
