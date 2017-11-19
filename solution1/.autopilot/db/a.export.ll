; ModuleID = '/home/supuni/Vivado_tutorial/Background_Subtraction_with_GMM/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@vinit = global float 4.000000e+02, align 4
@F = global [4 x float] zeroinitializer, align 16
@akt = global [4 x float] zeroinitializer, align 16
@alpha_w = global float 0x3F70624DE0000000, align 4
@mean = global [307200 x float] zeroinitializer
@sigma = global [307200 x float] zeroinitializer
@weight = global [307200 x float] zeroinitializer
@matchsum = global [307200 x i8] zeroinitializer
@back_gauss = global [307200 x i1] zeroinitializer
@llvm_global_ctors_0 = appending global [2 x i32] [i32 65535, i32 65535]
@llvm_global_ctors_1 = appending global [2 x void ()*] [void ()* @_GLOBAL__I_a, void ()* @_GLOBAL__I_a1938]
@str = internal constant [8 x i8] c"backsub\00"
@str1 = internal constant [9 x i8] c"memset_M\00"

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

declare void @_GLOBAL__I_a1938() nounwind section ".text.startup"

define weak i32 @_ssdm_op_SpecLoopName(...) {
entry:
  ret i32 0
}

declare float @llvm.sqrt.f32(float) nounwind readonly

define i32 @backsub([38400 x i32]* %data_array, [76800 x i8]* %out_frame, i1 zeroext %init) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap([38400 x i32]* %data_array) nounwind, !map !63
  call void (...)* @_ssdm_op_SpecBitsMap([76800 x i8]* %out_frame) nounwind, !map !69
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %init) nounwind, !map !74
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !80
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @str) nounwind
  %init_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %init) nounwind
  br i1 %init_read, label %.preheader9, label %.preheader5

.preheader9:                                      ; preds = %0, %1
  %i = phi i17 [ %i_1, %1 ], [ 0, %0 ]
  %exitcond4 = icmp eq i17 %i, -54272
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 76800, i64 76800, i64 76800) nounwind
  %i_1 = add i17 %i, 1
  br i1 %exitcond4, label %.preheader7, label %1

; <label>:1                                       ; preds = %.preheader9
  %tmp = call i19 @_ssdm_op_BitConcatenate.i19.i17.i2(i17 %i, i2 0)
  %tmp_1 = zext i19 %tmp to i64
  %mean_addr = getelementptr [307200 x float]* @mean, i64 0, i64 %tmp_1
  store float 3.200000e+01, float* %mean_addr, align 16
  %tmp_11 = or i19 %tmp, 1
  %mean_addr1 = call i32 @_ssdm_op_BitConcatenate.i32.i13.i19(i13 0, i19 %tmp_11)
  %tmp_17 = zext i32 %mean_addr1 to i64
  %mean_addr_1 = getelementptr [307200 x float]* @mean, i64 0, i64 %tmp_17
  store float 1.200000e+02, float* %mean_addr_1, align 4
  %tmp_19 = or i19 %tmp, 2
  %mean_addr2 = call i32 @_ssdm_op_BitConcatenate.i32.i13.i19(i13 0, i19 %tmp_19)
  %tmp_20 = zext i32 %mean_addr2 to i64
  %mean_addr_2 = getelementptr [307200 x float]* @mean, i64 0, i64 %tmp_20
  store float 1.800000e+02, float* %mean_addr_2, align 8
  %tmp_21 = or i19 %tmp, 3
  %mean_addr3 = call i32 @_ssdm_op_BitConcatenate.i32.i13.i19(i13 0, i19 %tmp_21)
  %tmp_22 = zext i32 %mean_addr3 to i64
  %mean_addr_3 = getelementptr [307200 x float]* @mean, i64 0, i64 %tmp_22
  store float 2.200000e+02, float* %mean_addr_3, align 4
  %sigma_addr = getelementptr [307200 x float]* @sigma, i64 0, i64 %tmp_1
  store float 4.000000e+02, float* %sigma_addr, align 16
  %sigma_addr_1 = getelementptr [307200 x float]* @sigma, i64 0, i64 %tmp_17
  store float 4.000000e+02, float* %sigma_addr_1, align 4
  %sigma_addr_2 = getelementptr [307200 x float]* @sigma, i64 0, i64 %tmp_20
  store float 4.000000e+02, float* %sigma_addr_2, align 8
  %sigma_addr_3 = getelementptr [307200 x float]* @sigma, i64 0, i64 %tmp_22
  store float 4.000000e+02, float* %sigma_addr_3, align 4
  %weight_addr = getelementptr [307200 x float]* @weight, i64 0, i64 %tmp_1
  store float 0x3FA99999A0000000, float* %weight_addr, align 16
  %weight_addr_1 = getelementptr [307200 x float]* @weight, i64 0, i64 %tmp_17
  store float 0x3FA99999A0000000, float* %weight_addr_1, align 4
  %weight_addr_2 = getelementptr [307200 x float]* @weight, i64 0, i64 %tmp_20
  store float 0x3FA99999A0000000, float* %weight_addr_2, align 8
  %weight_addr_3 = getelementptr [307200 x float]* @weight, i64 0, i64 %tmp_22
  store float 0x3FA99999A0000000, float* %weight_addr_3, align 4
  %matchsum_addr = getelementptr [307200 x i8]* @matchsum, i64 0, i64 %tmp_1
  store i8 0, i8* %matchsum_addr, align 4
  %matchsum_addr_1 = getelementptr [307200 x i8]* @matchsum, i64 0, i64 %tmp_17
  store i8 0, i8* %matchsum_addr_1, align 1
  %matchsum_addr_2 = getelementptr [307200 x i8]* @matchsum, i64 0, i64 %tmp_20
  store i8 0, i8* %matchsum_addr_2, align 2
  %matchsum_addr_3 = getelementptr [307200 x i8]* @matchsum, i64 0, i64 %tmp_22
  store i8 0, i8* %matchsum_addr_3, align 1
  %back_gauss_addr = getelementptr [307200 x i1]* @back_gauss, i64 0, i64 %tmp_1
  store i1 true, i1* %back_gauss_addr, align 4
  %back_gauss_addr_1 = getelementptr [307200 x i1]* @back_gauss, i64 0, i64 %tmp_17
  store i1 true, i1* %back_gauss_addr_1, align 1
  %back_gauss_addr_2 = getelementptr [307200 x i1]* @back_gauss, i64 0, i64 %tmp_20
  store i1 true, i1* %back_gauss_addr_2, align 2
  %back_gauss_addr_3 = getelementptr [307200 x i1]* @back_gauss, i64 0, i64 %tmp_22
  store i1 true, i1* %back_gauss_addr_3, align 1
  br label %.preheader9

.preheader7:                                      ; preds = %.preheader6, %.preheader9
  %idxRow = phi i8 [ 0, %.preheader9 ], [ %idxRow_2, %.preheader6 ]
  %exitcond3 = icmp eq i8 %idxRow, -16
  %empty_10 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 240, i64 240, i64 240) nounwind
  %idxRow_2 = add i8 %idxRow, 1
  br i1 %exitcond3, label %.loopexit, label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %.preheader7
  %p_shl = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %idxRow, i8 0)
  %p_shl_cast = zext i16 %p_shl to i17
  %p_shl3 = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %idxRow, i6 0)
  %p_shl3_cast = zext i14 %p_shl3 to i17
  %tmp_4 = add i17 %p_shl_cast, %p_shl3_cast
  %p_lshr_f_cast = call i16 @_ssdm_op_PartSelect.i16.i17.i32.i32(i17 %tmp_4, i32 1, i32 16)
  br label %.preheader6

.preheader6:                                      ; preds = %2, %.preheader6.preheader
  %idxCols = phi i8 [ 0, %.preheader6.preheader ], [ %idxCols_2, %2 ]
  %idxCols_cast6 = zext i8 %idxCols to i16
  %exitcond2 = icmp eq i8 %idxCols, -96
  %empty_11 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 160, i64 160, i64 160) nounwind
  %idxCols_2 = add i8 %idxCols, 1
  br i1 %exitcond2, label %.preheader7, label %2

; <label>:2                                       ; preds = %.preheader6
  %i_3 = add i16 %idxCols_cast6, %p_lshr_f_cast
  %tmp_6 = zext i16 %i_3 to i64
  %data_array_addr_1 = getelementptr [38400 x i32]* %data_array, i64 0, i64 %tmp_6
  %val = load i32* %data_array_addr_1, align 4
  %pix_y1_1 = trunc i32 %val to i8
  %pix_y2_1 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %val, i32 16, i32 23)
  %tmp_5 = call i17 @_ssdm_op_BitConcatenate.i17.i16.i1(i16 %i_3, i1 false)
  %tmp_9 = call fastcc zeroext i1 @backsub_EM_ALGO(i8 zeroext %pix_y1_1, i17 %tmp_5, [307200 x float]* nocapture @mean, [307200 x float]* nocapture @sigma, [307200 x float]* nocapture @weight, [307200 x i8]* nocapture @matchsum, [307200 x i1]* nocapture @back_gauss) nounwind
  %tmp_10 = zext i17 %tmp_5 to i64
  %out_frame_addr_1 = getelementptr [76800 x i8]* %out_frame, i64 0, i64 %tmp_10
  %p_s = select i1 %tmp_9, i8 -1, i8 0
  store i8 %p_s, i8* %out_frame_addr_1, align 1
  %tmp_14 = or i17 %tmp_5, 1
  %tmp_15 = call fastcc zeroext i1 @backsub_EM_ALGO(i8 zeroext %pix_y2_1, i17 %tmp_14, [307200 x float]* nocapture @mean, [307200 x float]* nocapture @sigma, [307200 x float]* nocapture @weight, [307200 x i8]* nocapture @matchsum, [307200 x i1]* nocapture @back_gauss) nounwind
  %tmp_18 = zext i17 %tmp_14 to i64
  %out_frame_addr_3 = getelementptr [76800 x i8]* %out_frame, i64 0, i64 %tmp_18
  %p_3 = select i1 %tmp_15, i8 -1, i8 0
  store i8 %p_3, i8* %out_frame_addr_3, align 1
  br label %.preheader6

.preheader5:                                      ; preds = %.preheader, %0
  %idxRow2 = phi i8 [ 0, %0 ], [ %idxRow_1, %.preheader ]
  %exitcond1 = icmp eq i8 %idxRow2, -16
  %empty_12 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 240, i64 240, i64 240) nounwind
  %idxRow_1 = add i8 %idxRow2, 1
  br i1 %exitcond1, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader5
  %p_shl1 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %idxRow2, i8 0)
  %p_shl1_cast = zext i16 %p_shl1 to i17
  %p_shl2 = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %idxRow2, i6 0)
  %p_shl2_cast = zext i14 %p_shl2 to i17
  %tmp_2 = add i17 %p_shl1_cast, %p_shl2_cast
  %p_lshr_f1_cast = call i16 @_ssdm_op_PartSelect.i16.i17.i32.i32(i17 %tmp_2, i32 1, i32 16)
  br label %.preheader

.preheader:                                       ; preds = %3, %.preheader.preheader
  %idxCols3 = phi i8 [ 0, %.preheader.preheader ], [ %idxCols_1, %3 ]
  %idxCols3_cast2 = zext i8 %idxCols3 to i16
  %exitcond = icmp eq i8 %idxCols3, -96
  %empty_13 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 160, i64 160, i64 160) nounwind
  %idxCols_1 = add i8 %idxCols3, 1
  br i1 %exitcond, label %.preheader5, label %3

; <label>:3                                       ; preds = %.preheader
  %i_2 = add i16 %idxCols3_cast2, %p_lshr_f1_cast
  %tmp_7 = zext i16 %i_2 to i64
  %data_array_addr = getelementptr [38400 x i32]* %data_array, i64 0, i64 %tmp_7
  %val_1 = load i32* %data_array_addr, align 4
  %pix_y1 = trunc i32 %val_1 to i8
  %pix_y2 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %val_1, i32 16, i32 23)
  %tmp_8 = call i17 @_ssdm_op_BitConcatenate.i17.i16.i1(i16 %i_2, i1 false)
  %tmp_3 = call fastcc zeroext i1 @backsub_EM_ALGO(i8 zeroext %pix_y1, i17 %tmp_8, [307200 x float]* nocapture @mean, [307200 x float]* nocapture @sigma, [307200 x float]* nocapture @weight, [307200 x i8]* nocapture @matchsum, [307200 x i1]* nocapture @back_gauss) nounwind
  %tmp_s = zext i17 %tmp_8 to i64
  %out_frame_addr = getelementptr [76800 x i8]* %out_frame, i64 0, i64 %tmp_s
  %p_1 = select i1 %tmp_3, i8 -1, i8 0
  store i8 %p_1, i8* %out_frame_addr, align 1
  %tmp_12 = or i17 %tmp_8, 1
  %tmp_13 = call fastcc zeroext i1 @backsub_EM_ALGO(i8 zeroext %pix_y2, i17 %tmp_12, [307200 x float]* nocapture @mean, [307200 x float]* nocapture @sigma, [307200 x float]* nocapture @weight, [307200 x i8]* nocapture @matchsum, [307200 x i1]* nocapture @back_gauss) nounwind
  %tmp_16 = zext i17 %tmp_12 to i64
  %out_frame_addr_2 = getelementptr [76800 x i8]* %out_frame, i64 0, i64 %tmp_16
  %p_2 = select i1 %tmp_13, i8 -1, i8 0
  store i8 %p_2, i8* %out_frame_addr_2, align 1
  br label %.preheader

.loopexit:                                        ; preds = %.preheader7, %.preheader5
  ret i32 0
}

define weak i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_14 = trunc i32 %empty to i8
  ret i8 %empty_14
}

define weak i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1, i23) nounwind readnone {
entry:
  %empty = zext i1 %0 to i24
  %empty_15 = zext i23 %1 to i24
  %empty_16 = shl i24 %empty, 23
  %empty_17 = or i24 %empty_16, %empty_15
  ret i24 %empty_17
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define internal fastcc zeroext i1 @backsub_EM_ALGO(i8 zeroext %pixel, i17 %pos_r, [307200 x float]* nocapture %mean, [307200 x float]* nocapture %sigma, [307200 x float]* nocapture %weight, [307200 x i8]* nocapture %matchsum, [307200 x i1]* nocapture %back_gauss) {
  %M = alloca i1, align 1
  %M_1 = alloca i1, align 1
  %M_2 = alloca i1, align 1
  %M_3 = alloca i1, align 1
  %pos_read = call i17 @_ssdm_op_Read.ap_auto.i17(i17 %pos_r)
  %pixel_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %pixel)
  br label %meminst

meminst:                                          ; preds = %meminst65, %0
  %invdar = phi i2 [ 0, %0 ], [ %indvarinc, %meminst65 ]
  %indvarinc = add i2 %invdar, 1
  switch i2 %invdar, label %branch11 [
    i2 0, label %meminst65.pre
    i2 1, label %branch9
    i2 -2, label %branch10
  ]

meminst65.pre:                                    ; preds = %meminst
  store i1 false, i1* %M, align 1
  br label %meminst65

meminst65:                                        ; preds = %meminst65.pre, %branch11, %branch10, %branch9
  %M_load = load i1* %M, align 1
  %M_1_load = load i1* %M_1, align 1
  %M_2_load = load i1* %M_2, align 1
  %M_3_load = load i1* %M_3, align 1
  %tmp_s = icmp eq i2 %invdar, -1
  %empty = call i32 (...)* @_ssdm_op_SpecLoopName([9 x i8]* @str1) nounwind
  %empty_18 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  br i1 %tmp_s, label %1, label %meminst

; <label>:1                                       ; preds = %meminst65
  %tmp_20 = zext i8 %pixel_read to i32
  %tmp_21 = sitofp i32 %tmp_20 to float
  %tmp_27 = call i19 @_ssdm_op_BitConcatenate.i19.i17.i2(i17 %pos_read, i2 0)
  %p_addr6 = zext i19 %tmp_27 to i32
  %p_addr6_cast = zext i19 %tmp_27 to i20
  br label %2

; <label>:2                                       ; preds = %_ifconv, %1
  %M_3_2 = phi i1 [ %M_3_load, %1 ], [ %M_3_4, %_ifconv ]
  %M_2_2 = phi i1 [ %M_2_load, %1 ], [ %M_2_4, %_ifconv ]
  %M_1_2 = phi i1 [ %M_1_load, %1 ], [ %M_1_4, %_ifconv ]
  %M_0_2 = phi i1 [ %M_load, %1 ], [ %M_0_4, %_ifconv ]
  %j = phi i3 [ 0, %1 ], [ %j_1, %_ifconv ]
  %exitcond6 = icmp eq i3 %j, -4
  %empty_19 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %j_1 = add i3 %j, 1
  br i1 %exitcond6, label %.preheader8, label %_ifconv

_ifconv:                                          ; preds = %2
  %tmp_22 = zext i3 %j to i64
  %tmp_23_trn_cast = zext i3 %j to i20
  %p_addr7 = add i20 %p_addr6_cast, %tmp_23_trn_cast
  %tmp_31 = zext i20 %p_addr7 to i64
  %mean_addr = getelementptr [307200 x float]* %mean, i64 0, i64 %tmp_31
  %mean_load = load float* %mean_addr, align 4
  %x_assign_2 = fsub float %tmp_21, %mean_load
  %p_Val2_s = bitcast float %x_assign_2 to i32
  %p_Result_s = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %p_Val2_s, i32 31)
  %loc_V = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %p_Val2_s, i32 23, i32 30) nounwind
  %loc_V_1 = trunc i32 %p_Val2_s to i23
  %p_Result_1 = call i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1 true, i23 %loc_V_1) nounwind
  %tmp_i_i = zext i24 %p_Result_1 to i78
  %tmp_i_i_i_cast = zext i8 %loc_V to i9
  %sh_assign = add i9 %tmp_i_i_i_cast, -127
  %isNeg = call i1 @_ssdm_op_BitSelect.i1.i9.i32(i9 %sh_assign, i32 8)
  %tmp_1_i_i = sub i8 127, %loc_V
  %tmp_1_i_i_cast = sext i8 %tmp_1_i_i to i9
  %sh_assign_1 = select i1 %isNeg, i9 %tmp_1_i_i_cast, i9 %sh_assign
  %sh_assign_1_cast = sext i9 %sh_assign_1 to i32
  %sh_assign_1_cast_cast = sext i9 %sh_assign_1 to i24
  %tmp_2_i_i = zext i32 %sh_assign_1_cast to i78
  %tmp_3_i_i = lshr i24 %p_Result_1, %sh_assign_1_cast_cast
  %tmp_5_i_i = shl i78 %tmp_i_i, %tmp_2_i_i
  %tmp_63 = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %tmp_3_i_i, i32 23)
  %tmp_32 = zext i1 %tmp_63 to i32
  %tmp_40 = call i32 @_ssdm_op_PartSelect.i32.i78.i32.i32(i78 %tmp_5_i_i, i32 23, i32 54)
  %p_Val2_3 = select i1 %isNeg, i32 %tmp_32, i32 %tmp_40
  %p_Val2_7_i_i = sub i32 0, %p_Val2_3
  %p_Val2_5 = select i1 %p_Result_s, i32 %p_Val2_7_i_i, i32 %p_Val2_3
  %neg = sub i32 0, %p_Val2_5
  %abscond = icmp sgt i32 %p_Val2_5, 0
  %abs = select i1 %abscond, i32 %p_Val2_5, i32 %neg
  %tmp_23 = sitofp i32 %abs to double
  %sigma_addr = getelementptr [307200 x float]* %sigma, i64 0, i64 %tmp_31
  %sigma_load_1 = load float* %sigma_addr, align 4
  %tmp_i = call float @llvm.sqrt.f32(float %sigma_load_1) nounwind
  %tmp_24 = fpext float %tmp_i to double
  %tmp_25 = fmul double %tmp_24, 2.500000e+00
  %tmp_28_to_int = bitcast double %tmp_23 to i64
  %tmp_1 = call i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64 %tmp_28_to_int, i32 52, i32 62)
  %tmp_64 = trunc i64 %tmp_28_to_int to i52
  %tmp_31_to_int = bitcast double %tmp_25 to i64
  %tmp_3 = call i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64 %tmp_31_to_int, i32 52, i32 62)
  %tmp_66 = trunc i64 %tmp_31_to_int to i52
  %notlhs = icmp ne i11 %tmp_1, -1
  %notrhs = icmp eq i52 %tmp_64, 0
  %tmp_5 = or i1 %notrhs, %notlhs
  %notlhs3 = icmp ne i11 %tmp_3, -1
  %notrhs4 = icmp eq i52 %tmp_66, 0
  %tmp_6 = or i1 %notrhs4, %notlhs3
  %tmp_7 = and i1 %tmp_5, %tmp_6
  %tmp_8 = fcmp olt double %tmp_23, %tmp_25
  %tmp_9 = and i1 %tmp_7, %tmp_8
  %back_gauss_addr = getelementptr [307200 x i1]* %back_gauss, i64 0, i64 %tmp_31
  %back_gauss_load = load i1* %back_gauss_addr, align 1
  %tmp_71 = trunc i3 %j to i2
  %sel_tmp2 = and i1 %tmp_9, %back_gauss_load
  %sel_tmp5 = icmp eq i2 %tmp_71, -2
  %sel_tmp7 = and i1 %sel_tmp2, %sel_tmp5
  %sel_tmp4 = xor i1 %sel_tmp7, %sel_tmp2
  %sel_tmp9 = icmp eq i2 %tmp_71, 1
  %sel_tmp = and i1 %sel_tmp2, %sel_tmp9
  %not_sel_tmp = xor i1 %sel_tmp, true
  %sel_tmp1 = icmp eq i2 %tmp_71, 0
  %sel_tmp3 = and i1 %sel_tmp2, %sel_tmp1
  %not_sel_tmp1 = xor i1 %sel_tmp3, true
  %tmp = and i1 %not_sel_tmp, %not_sel_tmp1
  %sel_tmp6 = and i1 %tmp, %sel_tmp4
  %M_3_4 = or i1 %sel_tmp6, %M_3_2
  %sel_tmp8 = and i1 %tmp, %sel_tmp7
  %M_2_4 = or i1 %sel_tmp8, %M_2_2
  %sel_tmp10 = and i1 %sel_tmp, %not_sel_tmp1
  %M_1_4 = or i1 %sel_tmp10, %M_1_2
  %M_0_4 = or i1 %sel_tmp3, %M_0_2
  %alpha_w_load = load float* @alpha_w, align 4
  %weight_addr_4 = getelementptr [307200 x float]* %weight, i64 0, i64 %tmp_31
  %weight_load = load float* %weight_addr_4, align 4
  %tmp_26 = fdiv float %alpha_w_load, %weight_load
  %akt_addr = getelementptr inbounds [4 x float]* @akt, i64 0, i64 %tmp_22
  store float %tmp_26, float* %akt_addr, align 4
  %tmp_28 = fdiv float %weight_load, %sigma_load_1
  %F_addr = getelementptr inbounds [4 x float]* @F, i64 0, i64 %tmp_22
  store float %tmp_28, float* %F_addr, align 4
  br label %2

.preheader8:                                      ; preds = %2, %_ifconv68
  %max_val_2 = phi i3 [ %j_2, %_ifconv68 ], [ 0, %2 ]
  %min_val = phi i32 [ %min_val_1, %_ifconv68 ], [ 10, %2 ]
  %max_val = phi i32 [ %min_val_3, %_ifconv68 ], [ 10, %2 ]
  %min_F = phi float [ %min_F_1, %_ifconv68 ], [ 1.000000e+03, %2 ]
  %max_F = phi float [ %max_F_2, %_ifconv68 ], [ 0.000000e+00, %2 ]
  %max_val_3_cast = zext i3 %max_val_2 to i32
  %exitcond5 = icmp eq i3 %max_val_2, -4
  %empty_20 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %j_2 = add i3 %max_val_2, 1
  br i1 %exitcond5, label %3, label %_ifconv68

_ifconv68:                                        ; preds = %.preheader8
  %tmp_29 = zext i3 %max_val_2 to i64
  %tmp_81 = trunc i3 %max_val_2 to i2
  %sel_tmp11 = icmp eq i2 %tmp_81, 1
  %sel_tmp12 = select i1 %sel_tmp11, i1 %M_1_2, i1 %M_3_2
  %sel_tmp13 = icmp eq i2 %tmp_81, -2
  %sel_tmp14 = select i1 %sel_tmp13, i1 %M_2_2, i1 %sel_tmp12
  %sel_tmp15 = icmp eq i2 %tmp_81, 0
  %M_load_phi = select i1 %sel_tmp15, i1 %M_0_2, i1 %sel_tmp14
  %F_addr_1 = getelementptr inbounds [4 x float]* @F, i64 0, i64 %tmp_29
  %max_F_4 = load float* %F_addr_1, align 4
  %max_F_1_to_int = bitcast float %max_F_4 to i32
  %tmp_11 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %max_F_1_to_int, i32 23, i32 30)
  %tmp_83 = trunc i32 %max_F_1_to_int to i23
  %max_F_to_int = bitcast float %max_F to i32
  %tmp_13 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %max_F_to_int, i32 23, i32 30)
  %tmp_100 = trunc i32 %max_F_to_int to i23
  %notlhs5 = icmp ne i8 %tmp_11, -1
  %notrhs6 = icmp eq i23 %tmp_83, 0
  %tmp_15 = or i1 %notrhs6, %notlhs5
  %notlhs7 = icmp ne i8 %tmp_13, -1
  %notrhs8 = icmp eq i23 %tmp_100, 0
  %tmp_16 = or i1 %notrhs8, %notlhs7
  %tmp_17 = and i1 %tmp_15, %tmp_16
  %tmp_18 = fcmp ogt float %max_F_4, %max_F
  %tmp_19 = and i1 %tmp_17, %tmp_18
  %sel_tmp16 = and i1 %M_load_phi, %tmp_19
  %min_val_2 = select i1 %sel_tmp16, i32 %max_val_3_cast, i32 %max_val
  %min_val_3 = select i1 %M_load_phi, i32 %min_val_2, i32 %max_val
  %max_F_3 = select i1 %sel_tmp16, float %max_F_4, float %max_F
  %max_F_2 = select i1 %M_load_phi, float %max_F_3, float %max_F
  %min_F_to_int = bitcast float %min_F to i32
  %tmp_30 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %min_F_to_int, i32 23, i32 30)
  %tmp_101 = trunc i32 %min_F_to_int to i23
  %notlhs1 = icmp ne i8 %tmp_30, -1
  %notrhs2 = icmp eq i23 %tmp_101, 0
  %tmp_41 = or i1 %notrhs2, %notlhs1
  %tmp_49 = and i1 %tmp_15, %tmp_41
  %tmp_51 = fcmp olt float %max_F_4, %min_F
  %tmp_53 = and i1 %tmp_49, %tmp_51
  %min_val_1 = select i1 %tmp_53, i32 %max_val_3_cast, i32 %min_val
  %min_F_1 = select i1 %tmp_53, float %max_F_4, float %min_F
  br label %.preheader8

; <label>:3                                       ; preds = %.preheader8
  %tmp_76 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %max_val, i32 2, i32 31)
  %icmp = icmp slt i30 %tmp_76, 1
  br i1 %icmp, label %4, label %8

; <label>:4                                       ; preds = %3
  %tmp_33 = sext i32 %max_val to i64
  %p_addr4 = add i32 %p_addr6, %max_val
  %tmp_54 = sext i32 %p_addr4 to i64
  %mean_addr_4 = getelementptr [307200 x float]* %mean, i64 0, i64 %tmp_54
  %mean_load_1 = load float* %mean_addr_4, align 4
  %akt_addr_1 = getelementptr inbounds [4 x float]* @akt, i64 0, i64 %tmp_33
  %akt_load = load float* %akt_addr_1, align 4
  %tmp_34 = fsub float %tmp_21, %mean_load_1
  %tmp_35 = fmul float %akt_load, %tmp_34
  %tmp_36 = fadd float %mean_load_1, %tmp_35
  store float %tmp_36, float* %mean_addr_4, align 4
  %sigma_addr_4 = getelementptr [307200 x float]* %sigma, i64 0, i64 %tmp_54
  %sigma_load = load float* %sigma_addr_4, align 4
  %tmp_37 = fsub float %tmp_21, %tmp_36
  %tmp_38 = fmul float %tmp_37, %tmp_37
  %tmp_39 = fsub float %tmp_38, %sigma_load
  %tmp_42 = fmul float %akt_load, %tmp_39
  %tmp_43 = fadd float %sigma_load, %tmp_42
  store float %tmp_43, float* %sigma_addr_4, align 4
  %weight_addr = getelementptr [307200 x float]* %weight, i64 0, i64 %tmp_54
  %weight_load_1 = load float* %weight_addr, align 4
  %alpha_w_load_1 = load float* @alpha_w, align 4
  %tmp_44 = fmul float %alpha_w_load_1, %weight_load_1
  %tmp_45 = fsub float %weight_load_1, %tmp_44
  %tmp_46 = fadd float %tmp_45, %alpha_w_load_1
  store float %tmp_46, float* %weight_addr, align 4
  %matchsum_addr = getelementptr [307200 x i8]* %matchsum, i64 0, i64 %tmp_54
  %matchsum_load = load i8* %matchsum_addr, align 1
  %tmp_47 = add i8 %matchsum_load, 1
  store i8 %tmp_47, i8* %matchsum_addr, align 1
  br label %5

; <label>:5                                       ; preds = %._crit_edge13, %4
  %j2 = phi i3 [ 0, %4 ], [ %j_3, %._crit_edge13 ]
  %j2_cast = zext i3 %j2 to i32
  %j2_cast_cast = zext i3 %j2 to i20
  %exitcond4 = icmp eq i3 %j2, -4
  %empty_21 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %j_3 = add i3 %j2, 1
  br i1 %exitcond4, label %.preheader7, label %6

; <label>:6                                       ; preds = %5
  %tmp_50 = icmp eq i32 %j2_cast, %max_val
  br i1 %tmp_50, label %._crit_edge13, label %7

; <label>:7                                       ; preds = %6
  %p_addr2 = add i20 %p_addr6_cast, %j2_cast_cast
  %tmp_72 = zext i20 %p_addr2 to i64
  %weight_addr_5 = getelementptr [307200 x float]* %weight, i64 0, i64 %tmp_72
  %weight_load_2 = load float* %weight_addr_5, align 4
  %tmp_55 = fsub float %weight_load_2, %alpha_w_load_1
  store float %tmp_55, float* %weight_addr_5, align 4
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %7, %6
  br label %5

; <label>:8                                       ; preds = %3
  %matchsumtot = alloca float, align 4
  %tmp_48 = uitofp i8 %pixel_read to float
  %p_addr1 = add i32 %p_addr6, %min_val
  %tmp_58 = sext i32 %p_addr1 to i64
  %mean_addr_5 = getelementptr [307200 x float]* %mean, i64 0, i64 %tmp_58
  store float %tmp_48, float* %mean_addr_5, align 4
  %vinit_load = load float* @vinit, align 4
  %sigma_addr_5 = getelementptr [307200 x float]* %sigma, i64 0, i64 %tmp_58
  store float %vinit_load, float* %sigma_addr_5, align 4
  %matchsum_addr_4 = getelementptr [307200 x i8]* %matchsum, i64 0, i64 %tmp_58
  store i8 1, i8* %matchsum_addr_4, align 1
  store float 0.000000e+00, float* %matchsumtot, align 4
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.backedge, %8
  %j3 = phi i3 [ 0, %8 ], [ %j_4, %._crit_edge14.backedge ]
  %j3_cast = zext i3 %j3 to i32
  %j3_cast_cast = zext i3 %j3 to i20
  %exitcond3 = icmp eq i3 %j3, -4
  %empty_22 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %j_4 = add i3 %j3, 1
  br i1 %exitcond3, label %11, label %9

; <label>:9                                       ; preds = %._crit_edge14
  %tmp_52 = icmp eq i32 %j3_cast, %min_val
  br i1 %tmp_52, label %._crit_edge14.backedge, label %10

; <label>:10                                      ; preds = %9
  %matchsumtot_load = load float* %matchsumtot, align 4
  %p_addr5 = add i20 %p_addr6_cast, %j3_cast_cast
  %tmp_73 = zext i20 %p_addr5 to i64
  %weight_addr_8 = getelementptr [307200 x float]* %weight, i64 0, i64 %tmp_73
  %weight_load_3 = load float* %weight_addr_8, align 4
  %alpha_w_load_2 = load float* @alpha_w, align 4
  %tmp_60 = fsub float %weight_load_3, %alpha_w_load_2
  store float %tmp_60, float* %weight_addr_8, align 4
  %matchsum_addr_5 = getelementptr [307200 x i8]* %matchsum, i64 0, i64 %tmp_73
  %matchsum_load_1 = load i8* %matchsum_addr_5, align 1
  %tmp_61 = zext i8 %matchsum_load_1 to i32
  %tmp_62 = sitofp i32 %tmp_61 to float
  %matchsumtot_1 = fadd float %matchsumtot_load, %tmp_62
  store float %matchsumtot_1, float* %matchsumtot, align 4
  br label %._crit_edge14.backedge

._crit_edge14.backedge:                           ; preds = %10, %9
  br label %._crit_edge14

; <label>:11                                      ; preds = %._crit_edge14
  %matchsumtot_load_1 = load float* %matchsumtot, align 4
  %matchsumtot_to_int = bitcast float %matchsumtot_load_1 to i32
  %tmp_59 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %matchsumtot_to_int, i32 23, i32 30)
  %tmp_102 = trunc i32 %matchsumtot_to_int to i23
  %notlhs2 = icmp ne i8 %tmp_59, -1
  %notrhs3 = icmp eq i23 %tmp_102, 0
  %tmp_65 = or i1 %notrhs3, %notlhs2
  %tmp_67 = fcmp oeq float %matchsumtot_load_1, 0.000000e+00
  %tmp_70 = and i1 %tmp_65, %tmp_67
  br i1 %tmp_70, label %13, label %12

; <label>:12                                      ; preds = %11
  %tmp_57 = fdiv float 1.000000e+00, %matchsumtot_load_1
  %weight_addr_6 = getelementptr [307200 x float]* %weight, i64 0, i64 %tmp_58
  store float %tmp_57, float* %weight_addr_6, align 4
  br label %14

; <label>:13                                      ; preds = %11
  %weight_addr_7 = getelementptr [307200 x float]* %weight, i64 0, i64 %tmp_58
  store float 0x3FB1EB8520000000, float* %weight_addr_7, align 4
  br label %14

; <label>:14                                      ; preds = %13, %12
  br label %17

.preheader7:                                      ; preds = %5, %_ifconv83
  %sorted_F_3 = phi float [ %sorted_F_3_2, %_ifconv83 ], [ undef, %5 ]
  %sorted_F_2 = phi float [ %sorted_F_3_5, %_ifconv83 ], [ undef, %5 ]
  %sorted_F_3_6 = phi float [ %sorted_F_3_8, %_ifconv83 ], [ undef, %5 ]
  %sorted_F_3_9 = phi float [ %sorted_F_3_16, %_ifconv83 ], [ undef, %5 ]
  %i = phi i3 [ %i_4, %_ifconv83 ], [ 0, %5 ]
  %exitcond2 = icmp eq i3 %i, -4
  %empty_23 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %i_4 = add i3 %i, 1
  br i1 %exitcond2, label %.preheader, label %_ifconv83

_ifconv83:                                        ; preds = %.preheader7
  %tmp_56 = zext i3 %i to i64
  %F_addr_2 = getelementptr inbounds [4 x float]* @F, i64 0, i64 %tmp_56
  %sorted_F_0_13 = load float* %F_addr_2, align 4
  %tmp_103 = trunc i3 %i to i2
  %sel_tmp17 = icmp eq i2 %tmp_103, -2
  %sorted_F_3_24 = select i1 %sel_tmp17, float %sorted_F_3, float %sorted_F_0_13
  %sel_tmp18 = icmp eq i2 %tmp_103, 1
  %sorted_F_3_1 = select i1 %sel_tmp18, float %sorted_F_3, float %sorted_F_3_24
  %sel_tmp19 = icmp eq i2 %tmp_103, 0
  %sorted_F_3_2 = select i1 %sel_tmp19, float %sorted_F_3, float %sorted_F_3_1
  %sorted_F_3_3 = select i1 %sel_tmp17, float %sorted_F_0_13, float %sorted_F_2
  %sorted_F_3_4 = select i1 %sel_tmp18, float %sorted_F_2, float %sorted_F_3_3
  %sorted_F_3_5 = select i1 %sel_tmp19, float %sorted_F_2, float %sorted_F_3_4
  %sorted_F_3_7 = select i1 %sel_tmp18, float %sorted_F_0_13, float %sorted_F_3_6
  %sorted_F_3_8 = select i1 %sel_tmp19, float %sorted_F_3_6, float %sorted_F_3_7
  %sorted_F_3_16 = select i1 %sel_tmp19, float %sorted_F_0_13, float %sorted_F_3_9
  br label %.preheader7

.preheader:                                       ; preds = %.preheader7, %_ifconv108
  %sorted_weight_3 = phi float [ %sorted_weight_3_2, %_ifconv108 ], [ undef, %.preheader7 ]
  %sorted_weight_2 = phi float [ %sorted_weight_3_5, %_ifconv108 ], [ undef, %.preheader7 ]
  %sorted_weight_3_6 = phi float [ %sorted_weight_3_8, %_ifconv108 ], [ undef, %.preheader7 ]
  %sorted_weight_3_9 = phi float [ %sorted_weight_3_11, %_ifconv108 ], [ undef, %.preheader7 ]
  %i4 = phi i3 [ %i_5, %_ifconv108 ], [ 0, %.preheader7 ]
  %exitcond1 = icmp eq i3 %i4, -4
  %empty_25 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %i_5 = add i3 %i4, 1
  br i1 %exitcond1, label %.preheader192, label %_ifconv108

_ifconv108:                                       ; preds = %.preheader
  %tmp_63_trn_cast = zext i3 %i4 to i20
  %p_addr8 = add i20 %p_addr6_cast, %tmp_63_trn_cast
  %tmp_74 = zext i20 %p_addr8 to i64
  %weight_addr_9 = getelementptr [307200 x float]* %weight, i64 0, i64 %tmp_74
  %sorted_weight_0_16 = load float* %weight_addr_9, align 4
  %tmp_104 = trunc i3 %i4 to i2
  %sel_tmp20 = icmp eq i2 %tmp_104, -2
  %sorted_weight_3_26 = select i1 %sel_tmp20, float %sorted_weight_3, float %sorted_weight_0_16
  %sel_tmp21 = icmp eq i2 %tmp_104, 1
  %sorted_weight_3_1 = select i1 %sel_tmp21, float %sorted_weight_3, float %sorted_weight_3_26
  %sel_tmp22 = icmp eq i2 %tmp_104, 0
  %sorted_weight_3_2 = select i1 %sel_tmp22, float %sorted_weight_3, float %sorted_weight_3_1
  %sorted_weight_3_3 = select i1 %sel_tmp20, float %sorted_weight_0_16, float %sorted_weight_2
  %sorted_weight_3_4 = select i1 %sel_tmp21, float %sorted_weight_2, float %sorted_weight_3_3
  %sorted_weight_3_5 = select i1 %sel_tmp22, float %sorted_weight_2, float %sorted_weight_3_4
  %sorted_weight_3_7 = select i1 %sel_tmp21, float %sorted_weight_0_16, float %sorted_weight_3_6
  %sorted_weight_3_8 = select i1 %sel_tmp22, float %sorted_weight_3_6, float %sorted_weight_3_7
  %sorted_weight_3_11 = select i1 %sel_tmp22, float %sorted_weight_0_16, float %sorted_weight_3_9
  br label %.preheader

.preheader192:                                    ; preds = %.preheader, %_ifconv195
  %index_3 = phi i32 [ %index_0_3, %_ifconv195 ], [ 3, %.preheader ]
  %index_2 = phi i32 [ %index_0_6, %_ifconv195 ], [ 2, %.preheader ]
  %index_1 = phi i32 [ %index_0_9, %_ifconv195 ], [ 1, %.preheader ]
  %index_0_11 = phi i32 [ %index_0_12, %_ifconv195 ], [ 0, %.preheader ]
  %sorted_weight_3_2_27 = phi float [ %sorted_weight_0_5, %_ifconv195 ], [ %sorted_weight_3, %.preheader ]
  %sorted_weight_2_2 = phi float [ %sorted_weight_0_8, %_ifconv195 ], [ %sorted_weight_2, %.preheader ]
  %sorted_weight_1_2 = phi float [ %sorted_weight_0_10, %_ifconv195 ], [ %sorted_weight_3_6, %.preheader ]
  %sorted_weight_0_14 = phi float [ %sorted_weight_0_15, %_ifconv195 ], [ %sorted_weight_3_9, %.preheader ]
  %sorted_F_3_2_28 = phi float [ %sorted_F_0_2, %_ifconv195 ], [ %sorted_F_3, %.preheader ]
  %sorted_F_2_2 = phi float [ %sorted_F_0_5, %_ifconv195 ], [ %sorted_F_2, %.preheader ]
  %sorted_F_1_2 = phi float [ %sorted_F_0_8, %_ifconv195 ], [ %sorted_F_3_6, %.preheader ]
  %sorted_F_0_9 = phi float [ %sorted_F_0_12, %_ifconv195 ], [ %sorted_F_3_9, %.preheader ]
  %i6 = phi i3 [ %i_6, %_ifconv195 ], [ 1, %.preheader ]
  %i6_cast = zext i3 %i6 to i32
  %exitcond = icmp eq i3 %i6, -4
  %empty_29 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  br i1 %exitcond, label %15, label %_ifconv182

_ifconv182:                                       ; preds = %.preheader192
  %tmp_105 = trunc i3 %i6 to i2
  %sel_tmp23 = icmp eq i2 %tmp_105, -2
  %sorted_F_3_17 = select i1 %sel_tmp23, float %sorted_F_2_2, float %sorted_F_3_2_28
  %sel_tmp24 = icmp eq i2 %tmp_105, 1
  %sorted_F_3_23 = select i1 %sel_tmp24, float %sorted_F_1_2, float %sorted_F_3_17
  %sorted_weight_3_12 = select i1 %sel_tmp23, float %sorted_weight_2_2, float %sorted_weight_3_2_27
  %sorted_weight_3_20 = select i1 %sel_tmp24, float %sorted_weight_1_2, float %sorted_weight_3_12
  %index_3_30 = select i1 %sel_tmp23, i32 %index_2, i32 %index_3
  %index_3_8 = select i1 %sel_tmp24, i32 %index_1, i32 %index_3_30
  %sorted_F_0_1_to_int = bitcast float %sorted_F_3_23 to i32
  %tmp_80 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %sorted_F_0_1_to_int, i32 23, i32 30)
  %tmp_106 = trunc i32 %sorted_F_0_1_to_int to i23
  %notlhs6 = icmp ne i8 %tmp_80, -1
  %notrhs7 = icmp eq i23 %tmp_106, 0
  %tmp_84 = or i1 %notrhs7, %notlhs6
  br label %branch65

branch65:                                         ; preds = %_ifconv133, %_ifconv182
  %index_3_1 = phi i32 [ %index_3, %_ifconv182 ], [ %index_3_6, %_ifconv133 ]
  %index_2_1 = phi i32 [ %index_2, %_ifconv182 ], [ %index_1_1, %_ifconv133 ]
  %index_1_6 = phi i32 [ %index_1, %_ifconv182 ], [ %index_1_3, %_ifconv133 ]
  %sorted_weight_3_3_31 = phi float [ %sorted_weight_3_2_27, %_ifconv182 ], [ %sorted_weight_3_18, %_ifconv133 ]
  %sorted_weight_2_3 = phi float [ %sorted_weight_2_2, %_ifconv182 ], [ %sorted_weight_1_2_34, %_ifconv133 ]
  %sorted_weight_1_7 = phi float [ %sorted_weight_1_2, %_ifconv182 ], [ %sorted_weight_1_4, %_ifconv133 ]
  %sorted_F_3_3_32 = phi float [ %sorted_F_3_2_28, %_ifconv182 ], [ %sorted_F_3_11, %_ifconv133 ]
  %sorted_F_2_3 = phi float [ %sorted_F_2_2, %_ifconv182 ], [ %sorted_F_3_13, %_ifconv133 ]
  %sorted_F_3_24_33 = phi float [ %sorted_F_1_2, %_ifconv182 ], [ %sorted_F_3_21, %_ifconv133 ]
  %j5_0_in = phi i32 [ %i6_cast, %_ifconv182 ], [ %j_5, %_ifconv133 ]
  %j_5 = add nsw i32 %j5_0_in, -1
  %tmp_108 = trunc i32 %j_5 to i2
  switch i2 %tmp_108, label %branch23 [
    i2 0, label %branch20
    i2 1, label %branch21
    i2 -2, label %branch22
  ]

branch20:                                         ; preds = %branch23, %branch22, %branch21, %branch65
  %sorted_F_1 = phi float [ %sorted_F_3_24_33, %branch21 ], [ %sorted_F_2_3, %branch22 ], [ %sorted_F_3_3_32, %branch23 ], [ %sorted_F_0_9, %branch65 ]
  %sorted_F_1_to_int = bitcast float %sorted_F_1 to i32
  %tmp_82 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %sorted_F_1_to_int, i32 23, i32 30)
  %tmp_111 = trunc i32 %sorted_F_1_to_int to i23
  %notlhs8 = icmp ne i8 %tmp_82, -1
  %notrhs9 = icmp eq i23 %tmp_111, 0
  %tmp_85 = or i1 %notrhs9, %notlhs8
  %tmp_86 = and i1 %tmp_84, %tmp_85
  %tmp_87 = fcmp ogt float %sorted_F_3_23, %sorted_F_1
  %tmp_88 = and i1 %tmp_86, %tmp_87
  %tmp_68 = icmp sgt i32 %j5_0_in, 0
  %tmp_69 = and i1 %tmp_88, %tmp_68
  br i1 %tmp_69, label %_ifconv133, label %_ifconv195

_ifconv133:                                       ; preds = %branch20
  %tmp_112 = trunc i32 %j5_0_in to i2
  %sel_tmp28 = icmp eq i2 %tmp_112, -2
  %sorted_F_3_10 = select i1 %sel_tmp28, float %sorted_F_3_3_32, float %sorted_F_1
  %sel_tmp29 = icmp eq i2 %tmp_112, 1
  %sorted_F_3_11 = select i1 %sel_tmp29, float %sorted_F_3_3_32, float %sorted_F_3_10
  %sorted_F_3_12 = select i1 %sel_tmp28, float %sorted_F_1, float %sorted_F_2_3
  %sorted_F_3_13 = select i1 %sel_tmp29, float %sorted_F_2_3, float %sorted_F_3_12
  %sorted_F_3_21 = select i1 %sel_tmp29, float %sorted_F_1, float %sorted_F_3_24_33
  %sel_tmp30 = icmp eq i2 %tmp_108, 1
  %sorted_weight_3_14 = select i1 %sel_tmp30, float %sorted_weight_1_7, float %sorted_weight_3_3_31
  %sel_tmp31 = icmp eq i2 %tmp_108, -2
  %sorted_weight_3_15 = select i1 %sel_tmp31, float %sorted_weight_2_3, float %sorted_weight_3_14
  %sel_tmp32 = icmp eq i2 %tmp_108, 0
  %sorted_weight_3_21 = select i1 %sel_tmp32, float %sorted_weight_0_14, float %sorted_weight_3_15
  %sorted_weight_3_17 = select i1 %sel_tmp28, float %sorted_weight_3_3_31, float %sorted_weight_3_21
  %sorted_weight_3_18 = select i1 %sel_tmp29, float %sorted_weight_3_3_31, float %sorted_weight_3_17
  %sorted_weight_1 = select i1 %sel_tmp28, float %sorted_weight_3_21, float %sorted_weight_2_3
  %sorted_weight_1_2_34 = select i1 %sel_tmp29, float %sorted_weight_2_3, float %sorted_weight_1
  %sorted_weight_1_4 = select i1 %sel_tmp29, float %sorted_weight_3_21, float %sorted_weight_1_7
  %index_3_2 = select i1 %sel_tmp30, i32 %index_1_6, i32 %index_3_1
  %index_3_3 = select i1 %sel_tmp31, i32 %index_2_1, i32 %index_3_2
  %index_3_9 = select i1 %sel_tmp32, i32 %index_0_11, i32 %index_3_3
  %index_3_5 = select i1 %sel_tmp28, i32 %index_3_1, i32 %index_3_9
  %index_3_6 = select i1 %sel_tmp29, i32 %index_3_1, i32 %index_3_5
  %index_1_35 = select i1 %sel_tmp28, i32 %index_3_9, i32 %index_2_1
  %index_1_1 = select i1 %sel_tmp29, i32 %index_2_1, i32 %index_1_35
  %index_1_3 = select i1 %sel_tmp29, i32 %index_3_9, i32 %index_1_6
  br label %branch65

_ifconv195:                                       ; preds = %branch20
  %tmp_113 = trunc i32 %j5_0_in to i2
  %sel_tmp33 = icmp eq i2 %tmp_113, -2
  %sorted_F_0 = select i1 %sel_tmp33, float %sorted_F_3_3_32, float %sorted_F_3_23
  %sel_tmp34 = icmp eq i2 %tmp_113, 1
  %sorted_F_0_1 = select i1 %sel_tmp34, float %sorted_F_3_3_32, float %sorted_F_0
  %sel_tmp35 = icmp eq i2 %tmp_113, 0
  %sorted_F_0_2 = select i1 %sel_tmp35, float %sorted_F_3_3_32, float %sorted_F_0_1
  %sorted_F_0_3 = select i1 %sel_tmp33, float %sorted_F_3_23, float %sorted_F_2_3
  %sorted_F_0_4 = select i1 %sel_tmp34, float %sorted_F_2_3, float %sorted_F_0_3
  %sorted_F_0_5 = select i1 %sel_tmp35, float %sorted_F_2_3, float %sorted_F_0_4
  %sorted_F_0_7 = select i1 %sel_tmp34, float %sorted_F_3_23, float %sorted_F_3_24_33
  %sorted_F_0_8 = select i1 %sel_tmp35, float %sorted_F_3_24_33, float %sorted_F_0_7
  %sorted_F_0_12 = select i1 %sel_tmp35, float %sorted_F_3_23, float %sorted_F_0_9
  %sorted_weight_0_3 = select i1 %sel_tmp33, float %sorted_weight_3_3_31, float %sorted_weight_3_20
  %sorted_weight_0_4 = select i1 %sel_tmp34, float %sorted_weight_3_3_31, float %sorted_weight_0_3
  %sorted_weight_0_5 = select i1 %sel_tmp35, float %sorted_weight_3_3_31, float %sorted_weight_0_4
  %sorted_weight_0_6 = select i1 %sel_tmp33, float %sorted_weight_3_20, float %sorted_weight_2_3
  %sorted_weight_0_7 = select i1 %sel_tmp34, float %sorted_weight_2_3, float %sorted_weight_0_6
  %sorted_weight_0_8 = select i1 %sel_tmp35, float %sorted_weight_2_3, float %sorted_weight_0_7
  %sorted_weight_0_9 = select i1 %sel_tmp34, float %sorted_weight_3_20, float %sorted_weight_1_7
  %sorted_weight_0_10 = select i1 %sel_tmp35, float %sorted_weight_1_7, float %sorted_weight_0_9
  %sorted_weight_0_15 = select i1 %sel_tmp35, float %sorted_weight_3_20, float %sorted_weight_0_14
  %index_0_1 = select i1 %sel_tmp33, i32 %index_3_1, i32 %index_3_8
  %index_0_2 = select i1 %sel_tmp34, i32 %index_3_1, i32 %index_0_1
  %index_0_3 = select i1 %sel_tmp35, i32 %index_3_1, i32 %index_0_2
  %index_0_4 = select i1 %sel_tmp33, i32 %index_3_8, i32 %index_2_1
  %index_0_5 = select i1 %sel_tmp34, i32 %index_2_1, i32 %index_0_4
  %index_0_6 = select i1 %sel_tmp35, i32 %index_2_1, i32 %index_0_5
  %index_0_8 = select i1 %sel_tmp34, i32 %index_3_8, i32 %index_1_6
  %index_0_9 = select i1 %sel_tmp35, i32 %index_1_6, i32 %index_0_8
  %index_0_12 = select i1 %sel_tmp35, i32 %index_3_8, i32 %index_0_11
  %i_6 = add i3 %i6, 1
  br label %.preheader192

; <label>:15                                      ; preds = %.preheader192
  %tmp_89 = zext i19 %tmp_27 to i64
  %back_gauss_addr_4 = getelementptr [307200 x i1]* %back_gauss, i64 0, i64 %tmp_89
  store i1 false, i1* %back_gauss_addr_4, align 1
  %tmp_90 = or i19 %tmp_27, 1
  %p_addr9 = call i32 @_ssdm_op_BitConcatenate.i32.i13.i19(i13 0, i19 %tmp_90)
  %tmp_91 = zext i32 %p_addr9 to i64
  %back_gauss_addr_5 = getelementptr [307200 x i1]* %back_gauss, i64 0, i64 %tmp_91
  store i1 false, i1* %back_gauss_addr_5, align 1
  %tmp_92 = or i19 %tmp_27, 2
  %p_addr = call i32 @_ssdm_op_BitConcatenate.i32.i13.i19(i13 0, i19 %tmp_92)
  %tmp_93 = zext i32 %p_addr to i64
  %back_gauss_addr_6 = getelementptr [307200 x i1]* %back_gauss, i64 0, i64 %tmp_93
  store i1 false, i1* %back_gauss_addr_6, align 1
  %tmp_94 = or i19 %tmp_27, 3
  %p_addr3 = call i32 @_ssdm_op_BitConcatenate.i32.i13.i19(i13 0, i19 %tmp_94)
  %tmp_95 = zext i32 %p_addr3 to i64
  %back_gauss_addr_7 = getelementptr [307200 x i1]* %back_gauss, i64 0, i64 %tmp_95
  store i1 false, i1* %back_gauss_addr_7, align 1
  br label %16

; <label>:16                                      ; preds = %_ifconv268, %15
  %B = phi float [ 0.000000e+00, %15 ], [ %B_1, %_ifconv268 ]
  %ind = phi i3 [ 0, %15 ], [ %ind_1, %_ifconv268 ]
  %tmp_107 = call i1 @_ssdm_op_BitSelect.i1.i3.i32(i3 %ind, i32 2)
  %ind_1 = add i3 %ind, 1
  br i1 %tmp_107, label %.loopexit, label %_ifconv268

_ifconv268:                                       ; preds = %16
  %tmp_109 = trunc i3 %ind to i2
  %sel_tmp25 = icmp eq i2 %tmp_109, 1
  %sorted_weight_0 = select i1 %sel_tmp25, float %sorted_weight_1_2, float %sorted_weight_3_2_27
  %sel_tmp26 = icmp eq i2 %tmp_109, -2
  %sorted_weight_0_1 = select i1 %sel_tmp26, float %sorted_weight_2_2, float %sorted_weight_0
  %sel_tmp27 = icmp eq i2 %tmp_109, 0
  %sorted_weight_0_2 = select i1 %sel_tmp27, float %sorted_weight_0_14, float %sorted_weight_0_1
  %B_1 = fadd float %B, %sorted_weight_0_2
  %newSel = select i1 %sel_tmp27, i32 %index_0_11, i32 %index_2
  %or_cond = or i1 %sel_tmp27, %sel_tmp26
  %newSel1 = select i1 %sel_tmp25, i32 %index_1, i32 %index_3
  %index_0 = select i1 %or_cond, i32 %newSel, i32 %newSel1
  %p_addr10 = add i32 %p_addr6, %index_0
  %tmp_96 = sext i32 %p_addr10 to i64
  %back_gauss_addr_8 = getelementptr [307200 x i1]* %back_gauss, i64 0, i64 %tmp_96
  store i1 true, i1* %back_gauss_addr_8, align 1
  %B_1_to_int = bitcast float %B_1 to i32
  %tmp_75 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %B_1_to_int, i32 23, i32 30)
  %tmp_110 = trunc i32 %B_1_to_int to i23
  %notlhs4 = icmp ne i8 %tmp_75, -1
  %notrhs5 = icmp eq i23 %tmp_110, 0
  %tmp_77 = or i1 %notrhs5, %notlhs4
  %tmp_78 = fcmp oge float %B_1, 0x3FE6666660000000
  %tmp_79 = and i1 %tmp_77, %tmp_78
  br i1 %tmp_79, label %.loopexit, label %16

.loopexit:                                        ; preds = %16, %_ifconv268
  br label %17

; <label>:17                                      ; preds = %.loopexit, %14
  %p_0 = phi i1 [ false, %.loopexit ], [ true, %14 ]
  ret i1 %p_0

branch9:                                          ; preds = %meminst
  store i1 false, i1* %M_1, align 1
  br label %meminst65

branch10:                                         ; preds = %meminst
  store i1 false, i1* %M_2, align 1
  br label %meminst65

branch11:                                         ; preds = %meminst
  store i1 false, i1* %M_3, align 1
  br label %meminst65

branch21:                                         ; preds = %branch65
  br label %branch20

branch22:                                         ; preds = %branch65
  br label %branch20

branch23:                                         ; preds = %branch65
  br label %branch20
}

define weak i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_36 = trunc i64 %empty to i11
  ret i11 %empty_36
}

define weak i19 @_ssdm_op_BitConcatenate.i19.i17.i2(i17, i2) nounwind readnone {
entry:
  %empty = zext i17 %0 to i19
  %empty_37 = zext i2 %1 to i19
  %empty_38 = shl i19 %empty, 2
  %empty_39 = or i19 %empty_38, %empty_37
  ret i19 %empty_39
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i13.i19(i13, i19) nounwind readnone {
entry:
  %empty = zext i13 %0 to i32
  %empty_40 = zext i19 %1 to i32
  %empty_41 = shl i32 %empty, 19
  %empty_42 = or i32 %empty_41, %empty_40
  ret i32 %empty_42
}

define weak i16 @_ssdm_op_PartSelect.i16.i17.i32.i32(i17, i32, i32) nounwind readnone {
entry:
  %empty = call i17 @llvm.part.select.i17(i17 %0, i32 %1, i32 %2)
  %empty_43 = trunc i17 %empty to i16
  ret i16 %empty_43
}

define weak i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8, i6) nounwind readnone {
entry:
  %empty = zext i8 %0 to i14
  %empty_44 = zext i6 %1 to i14
  %empty_45 = shl i14 %empty, 6
  %empty_46 = or i14 %empty_45, %empty_44
  ret i14 %empty_46
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %0 to i16
  %empty_47 = zext i8 %1 to i16
  %empty_48 = shl i16 %empty, 8
  %empty_49 = or i16 %empty_48, %empty_47
  ret i16 %empty_49
}

define weak i17 @_ssdm_op_BitConcatenate.i17.i16.i1(i16, i1) nounwind readnone {
entry:
  %empty = zext i16 %0 to i17
  %empty_50 = zext i1 %1 to i17
  %empty_51 = shl i17 %empty, 1
  %empty_52 = or i17 %empty_51, %empty_50
  ret i17 %empty_52
}

define weak i32 @_ssdm_op_PartSelect.i32.i78.i32.i32(i78, i32, i32) nounwind readnone {
entry:
  %empty = call i78 @llvm.part.select.i78(i78 %0, i32 %1, i32 %2)
  %empty_53 = trunc i78 %empty to i32
  ret i32 %empty_53
}

define weak i1 @_ssdm_op_Read.ap_auto.i1(i1) {
entry:
  ret i1 %0
}

define weak i8 @_ssdm_op_Read.ap_auto.i8(i8) {
entry:
  ret i8 %0
}

define weak i17 @_ssdm_op_Read.ap_auto.i17(i17) {
entry:
  ret i17 %0
}

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_54 = and i32 %0, %empty
  %empty_55 = icmp ne i32 %empty_54, 0
  ret i1 %empty_55
}

define weak i1 @_ssdm_op_BitSelect.i1.i9.i32(i9, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i9
  %empty_56 = shl i9 1, %empty
  %empty_57 = and i9 %0, %empty_56
  %empty_58 = icmp ne i9 %empty_57, 0
  ret i1 %empty_58
}

define weak i1 @_ssdm_op_BitSelect.i1.i24.i32(i24, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i24
  %empty_59 = shl i24 1, %empty
  %empty_60 = and i24 %0, %empty_59
  %empty_61 = icmp ne i24 %empty_60, 0
  ret i1 %empty_61
}

define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_62 = trunc i32 %empty to i30
  ret i30 %empty_62
}

define weak i1 @_ssdm_op_BitSelect.i1.i3.i32(i3, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i3
  %empty_63 = shl i3 1, %empty
  %empty_64 = and i3 %0, %empty_63
  %empty_65 = icmp ne i3 %empty_64, 0
  ret i1 %empty_65
}

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare i64 @llvm.part.select.i64(i64, i32, i32) nounwind readnone

declare i17 @llvm.part.select.i17(i17, i32, i32) nounwind readnone

declare i78 @llvm.part.select.i78(i78, i32, i32) nounwind readnone

declare i2 @_ssdm_op_PartSelect.i2.i3.i32.i32(i3, i32, i32) nounwind readnone

declare i52 @_ssdm_op_PartSelect.i52.i64.i32.i32(i64, i32, i32) nounwind readnone

declare i23 @_ssdm_op_PartSelect.i23.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i2 @_ssdm_op_PartSelect.i2.i32.i32.i32(i32, i32, i32) nounwind readnone

!llvm.map.gv = !{!0, !7, !14, !19, !24, !31, !36, !41, !46, !51, !58, !59, !60, !61, !62}

!0 = metadata !{metadata !1, float* @vinit}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"vinit", metadata !5, metadata !"float", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8, [4 x float]* @F}
!8 = metadata !{metadata !9}
!9 = metadata !{i32 0, i32 31, metadata !10}
!10 = metadata !{metadata !11}
!11 = metadata !{metadata !"F", metadata !12, metadata !"float", i32 0, i32 31}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 0, i32 3, i32 1}
!14 = metadata !{metadata !15, [4 x float]* @akt}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 0, i32 31, metadata !17}
!17 = metadata !{metadata !18}
!18 = metadata !{metadata !"akt", metadata !12, metadata !"float", i32 0, i32 31}
!19 = metadata !{metadata !20, float* @alpha_w}
!20 = metadata !{metadata !21}
!21 = metadata !{i32 0, i32 31, metadata !22}
!22 = metadata !{metadata !23}
!23 = metadata !{metadata !"alpha_w", metadata !5, metadata !"float", i32 0, i32 31}
!24 = metadata !{metadata !25, null}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 31, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"mean", metadata !29, metadata !"float", i32 0, i32 31}
!29 = metadata !{metadata !30, metadata !13}
!30 = metadata !{i32 0, i32 76799, i32 1}
!31 = metadata !{metadata !32, null}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 0, i32 31, metadata !34}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !"sigma", metadata !29, metadata !"float", i32 0, i32 31}
!36 = metadata !{metadata !37, null}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 31, metadata !39}
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !"weight", metadata !29, metadata !"float", i32 0, i32 31}
!41 = metadata !{metadata !42, null}
!42 = metadata !{metadata !43}
!43 = metadata !{i32 0, i32 7, metadata !44}
!44 = metadata !{metadata !45}
!45 = metadata !{metadata !"matchsum", metadata !29, metadata !"unsigned char", i32 0, i32 7}
!46 = metadata !{metadata !47, null}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 0, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"back_gauss", metadata !29, metadata !"bool", i32 0, i32 0}
!51 = metadata !{metadata !52, [2 x i32]* @llvm_global_ctors_0}
!52 = metadata !{metadata !53}
!53 = metadata !{i32 0, i32 31, metadata !54}
!54 = metadata !{metadata !55}
!55 = metadata !{metadata !"llvm.global_ctors.0", metadata !56, metadata !"", i32 0, i32 31}
!56 = metadata !{metadata !57}
!57 = metadata !{i32 0, i32 1, i32 1}
!58 = metadata !{metadata !25, [307200 x float]* @mean}
!59 = metadata !{metadata !32, [307200 x float]* @sigma}
!60 = metadata !{metadata !37, [307200 x float]* @weight}
!61 = metadata !{metadata !42, [307200 x i8]* @matchsum}
!62 = metadata !{metadata !47, [307200 x i1]* @back_gauss}
!63 = metadata !{metadata !64}
!64 = metadata !{i32 0, i32 31, metadata !65}
!65 = metadata !{metadata !66}
!66 = metadata !{metadata !"data_array", metadata !67, metadata !"unsigned int", i32 0, i32 31}
!67 = metadata !{metadata !68}
!68 = metadata !{i32 0, i32 38399, i32 1}
!69 = metadata !{metadata !70}
!70 = metadata !{i32 0, i32 7, metadata !71}
!71 = metadata !{metadata !72}
!72 = metadata !{metadata !"out_frame", metadata !73, metadata !"unsigned char", i32 0, i32 7}
!73 = metadata !{metadata !30}
!74 = metadata !{metadata !75}
!75 = metadata !{i32 0, i32 0, metadata !76}
!76 = metadata !{metadata !77}
!77 = metadata !{metadata !"init", metadata !78, metadata !"bool", i32 0, i32 0}
!78 = metadata !{metadata !79}
!79 = metadata !{i32 0, i32 0, i32 0}
!80 = metadata !{metadata !81}
!81 = metadata !{i32 0, i32 31, metadata !82}
!82 = metadata !{metadata !83}
!83 = metadata !{metadata !"return", metadata !84, metadata !"int", i32 0, i32 31}
!84 = metadata !{metadata !85}
!85 = metadata !{i32 0, i32 1, i32 0}
