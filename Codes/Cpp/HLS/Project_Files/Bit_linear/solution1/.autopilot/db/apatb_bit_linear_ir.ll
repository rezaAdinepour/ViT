; ModuleID = 'C:/OneDrive/Desktop/ViT/Bit_linear/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind willreturn
declare void @llvm.sideeffect() #0

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_bit_linear_ir([4 x float]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" "partition" %input, [2 x float]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4" "partition" %weight, [2 x float]* noalias nocapture nonnull "fpga.decayed.dim.hint"="2" "partition" %output) local_unnamed_addr #1 {
entry:
  %input_copy_0 = alloca [2 x float], align 512
  %input_copy_1 = alloca [2 x float], align 512
  %input_copy_2 = alloca [2 x float], align 512
  %input_copy_3 = alloca [2 x float], align 512
  %weight_copy_0 = alloca [4 x float], align 512
  %weight_copy_1 = alloca [4 x float], align 512
  %output_copy_0 = alloca [2 x float], align 512
  %output_copy_1 = alloca [2 x float], align 512
  %0 = bitcast [4 x float]* %input to [2 x [4 x float]]*
  %1 = bitcast [2 x float]* %weight to [4 x [2 x float]]*
  %2 = bitcast [2 x float]* %output to [2 x [2 x float]]*
  call void @copy_in([2 x [4 x float]]* nonnull %0, [2 x float]* nonnull align 512 %input_copy_0, [2 x float]* nonnull align 512 %input_copy_1, [2 x float]* nonnull align 512 %input_copy_2, [2 x float]* nonnull align 512 %input_copy_3, [4 x [2 x float]]* nonnull %1, [4 x float]* nonnull align 512 %weight_copy_0, [4 x float]* nonnull align 512 %weight_copy_1, [2 x [2 x float]]* nonnull %2, [2 x float]* nonnull align 512 %output_copy_0, [2 x float]* nonnull align 512 %output_copy_1)
  %_0 = getelementptr [2 x float], [2 x float]* %input_copy_0, i64 0, i64 0
  %_1 = getelementptr [2 x float], [2 x float]* %input_copy_1, i64 0, i64 0
  %_2 = getelementptr [2 x float], [2 x float]* %input_copy_2, i64 0, i64 0
  %_3 = getelementptr [2 x float], [2 x float]* %input_copy_3, i64 0, i64 0
  %_01 = getelementptr [4 x float], [4 x float]* %weight_copy_0, i64 0, i64 0
  %_12 = getelementptr [4 x float], [4 x float]* %weight_copy_1, i64 0, i64 0
  %_03 = getelementptr [2 x float], [2 x float]* %output_copy_0, i64 0, i64 0
  %_14 = getelementptr [2 x float], [2 x float]* %output_copy_1, i64 0, i64 0
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_0, i32 998, i32 1, i32 0, i1 false) ], !dbg !27
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_1, i32 998, i32 1, i32 0, i1 false) ], !dbg !27
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_2, i32 998, i32 1, i32 0, i1 false) ], !dbg !27
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_3, i32 998, i32 1, i32 0, i1 false) ], !dbg !27
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_01, i32 998, i32 1, i32 0, i1 false) ], !dbg !399
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_12, i32 998, i32 1, i32 0, i1 false) ], !dbg !399
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_03, i32 998, i32 1, i32 0, i1 false) ], !dbg !400
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_14, i32 998, i32 1, i32 0, i1 false) ], !dbg !400
  call void @apatb_bit_linear_hw([2 x float]* %input_copy_0, [2 x float]* %input_copy_1, [2 x float]* %input_copy_2, [2 x float]* %input_copy_3, [4 x float]* %weight_copy_0, [4 x float]* %weight_copy_1, [2 x float]* %output_copy_0, [2 x float]* %output_copy_1)
  call void @copy_back([2 x [4 x float]]* %0, [2 x float]* %input_copy_0, [2 x float]* %input_copy_1, [2 x float]* %input_copy_2, [2 x float]* %input_copy_3, [4 x [2 x float]]* %1, [4 x float]* %weight_copy_0, [4 x float]* %weight_copy_1, [2 x [2 x float]]* %2, [2 x float]* %output_copy_0, [2 x float]* %output_copy_1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2a4f32([2 x [4 x float]]* "orig.arg.no"="0" %dst, [2 x [4 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [2 x [4 x float]]* %src, null
  %1 = icmp eq [2 x [4 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x [4 x float]], [2 x [4 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x [4 x float]], [2 x [4 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a4f32([4 x float]* %dst.addr, [4 x float]* %src.addr, i64 4)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a4f32([4 x float]* "orig.arg.no"="0" %dst, [4 x float]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [4 x float]* %src, null
  %1 = icmp eq [4 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4 x float], [4 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [4 x float], [4 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a4a2f32([4 x [2 x float]]* "orig.arg.no"="0" %dst, [4 x [2 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [4 x [2 x float]]* %src, null
  %1 = icmp eq [4 x [2 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4 x [2 x float]], [4 x [2 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [4 x [2 x float]], [4 x [2 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a2f32([2 x float]* %dst.addr, [2 x float]* %src.addr, i64 2)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2f32([2 x float]* "orig.arg.no"="0" %dst, [2 x float]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [2 x float]* %src, null
  %1 = icmp eq [2 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x float], [2 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x float], [2 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2a2f32([2 x [2 x float]]* "orig.arg.no"="0" %dst, [2 x [2 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [2 x [2 x float]]* %src, null
  %1 = icmp eq [2 x [2 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x [2 x float]], [2 x [2 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x [2 x float]], [2 x [2 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a2f32([2 x float]* %dst.addr, [2 x float]* %src.addr, i64 2)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #3

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a4f32.131.132(float* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, float* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, float* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, float* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [4 x float]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [4 x float]* %src, null
  %1 = icmp eq float* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %3 = trunc i64 %for.loop.idx2 to i2
  %src.addr = getelementptr [4 x float], [4 x float]* %src, i64 0, i64 %for.loop.idx2
  %4 = load float, float* %src.addr, align 4
  switch i2 %3, label %dst.addr.case.3 [
    i2 0, label %dst.addr.case.0
    i2 1, label %dst.addr.case.1
    i2 -2, label %dst.addr.case.2
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store float %4, float* %dst_0, align 4
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store float %4, float* %dst_1, align 4
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  store float %4, float* %dst_2, align 4
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  store float %4, float* %dst_3, align 4
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2a4f32.130.133([2 x float]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [2 x float]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x float]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [2 x float]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [2 x [4 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [2 x [4 x float]]* %src, null
  %1 = icmp eq [2 x float]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr_0 = getelementptr [2 x float], [2 x float]* %dst_0, i64 0, i64 %for.loop.idx2
  %dst.addr_1 = getelementptr [2 x float], [2 x float]* %dst_1, i64 0, i64 %for.loop.idx2
  %dst.addr_2 = getelementptr [2 x float], [2 x float]* %dst_2, i64 0, i64 %for.loop.idx2
  %dst.addr_3 = getelementptr [2 x float], [2 x float]* %dst_3, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x [4 x float]], [2 x [4 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a4f32.131.132(float* %dst.addr_0, float* %dst.addr_1, float* %dst.addr_2, float* %dst.addr_3, [4 x float]* %src.addr, i64 4)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a2a4f32.129.134([2 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [2 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [2 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [2 x [4 x float]]* noalias readonly "orig.arg.no"="1" %src) #4 {
entry:
  %0 = icmp eq [2 x float]* %dst_0, null
  %1 = icmp eq [2 x [4 x float]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2a4f32.130.133([2 x float]* nonnull %dst_0, [2 x float]* %dst_1, [2 x float]* %dst_2, [2 x float]* %dst_3, [2 x [4 x float]]* nonnull %src, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2f32.137.138(float* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, float* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x float]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [2 x float]* %src, null
  %1 = icmp eq float* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %3 = trunc i64 %for.loop.idx2 to i1
  %src.addr = getelementptr [2 x float], [2 x float]* %src, i64 0, i64 %for.loop.idx2
  %4 = load float, float* %src.addr, align 4
  %cond = icmp eq i1 %3, false
  br i1 %cond, label %dst.addr.case.0, label %dst.addr.case.1

dst.addr.case.0:                                  ; preds = %for.loop
  store float %4, float* %dst_0, align 4
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %3)
  store float %4, float* %dst_1, align 4
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a4a2f32.136.139([4 x float]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [4 x float]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [4 x [2 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [4 x [2 x float]]* %src, null
  %1 = icmp eq [4 x float]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr_0 = getelementptr [4 x float], [4 x float]* %dst_0, i64 0, i64 %for.loop.idx2
  %dst.addr_1 = getelementptr [4 x float], [4 x float]* %dst_1, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [4 x [2 x float]], [4 x [2 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a2f32.137.138(float* %dst.addr_0, float* %dst.addr_1, [2 x float]* %src.addr, i64 2)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a4a2f32.135.140([4 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [4 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [4 x [2 x float]]* noalias readonly "orig.arg.no"="1" %src) #4 {
entry:
  %0 = icmp eq [4 x float]* %dst_0, null
  %1 = icmp eq [4 x [2 x float]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a4a2f32.136.139([4 x float]* nonnull %dst_0, [4 x float]* %dst_1, [4 x [2 x float]]* nonnull %src, i64 4)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2a2f32.142.143([2 x float]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [2 x float]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x [2 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [2 x [2 x float]]* %src, null
  %1 = icmp eq [2 x float]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr_0 = getelementptr [2 x float], [2 x float]* %dst_0, i64 0, i64 %for.loop.idx2
  %dst.addr_1 = getelementptr [2 x float], [2 x float]* %dst_1, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x [2 x float]], [2 x [2 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a2f32.137.138(float* %dst.addr_0, float* %dst.addr_1, [2 x float]* %src.addr, i64 2)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a2a2f32.141.144([2 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [2 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x [2 x float]]* noalias readonly "orig.arg.no"="1" %src) #4 {
entry:
  %0 = icmp eq [2 x float]* %dst_0, null
  %1 = icmp eq [2 x [2 x float]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2a2f32.142.143([2 x float]* nonnull %dst_0, [2 x float]* %dst_1, [2 x [2 x float]]* nonnull %src, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_in([2 x [4 x float]]* noalias readonly "orig.arg.no"="0", [2 x float]* noalias align 512 "orig.arg.no"="1" "unpacked"="1.0" %_0, [2 x float]* noalias align 512 "orig.arg.no"="1" "unpacked"="1.1" %_1, [2 x float]* noalias align 512 "orig.arg.no"="1" "unpacked"="1.2" %_2, [2 x float]* noalias align 512 "orig.arg.no"="1" "unpacked"="1.3" %_3, [4 x [2 x float]]* noalias readonly "orig.arg.no"="2", [4 x float]* noalias align 512 "orig.arg.no"="3" "unpacked"="3.0" %_01, [4 x float]* noalias align 512 "orig.arg.no"="3" "unpacked"="3.1" %_12, [2 x [2 x float]]* noalias readonly "orig.arg.no"="4", [2 x float]* noalias align 512 "orig.arg.no"="5" "unpacked"="5.0" %_03, [2 x float]* noalias align 512 "orig.arg.no"="5" "unpacked"="5.1" %_14) #5 {
entry:
  call void @onebyonecpy_hls.p0a2a4f32.129.134([2 x float]* align 512 %_0, [2 x float]* align 512 %_1, [2 x float]* align 512 %_2, [2 x float]* align 512 %_3, [2 x [4 x float]]* %0)
  call void @onebyonecpy_hls.p0a4a2f32.135.140([4 x float]* align 512 %_01, [4 x float]* align 512 %_12, [4 x [2 x float]]* %1)
  call void @onebyonecpy_hls.p0a2a2f32.141.144([2 x float]* align 512 %_03, [2 x float]* align 512 %_14, [2 x [2 x float]]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a4f32.161.162([4 x float]* "orig.arg.no"="0" %dst, float* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, float* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, float* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, float* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq float* %src_0, null
  %1 = icmp eq [4 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %3 = trunc i64 %for.loop.idx2 to i2
  %dst.addr = getelementptr [4 x float], [4 x float]* %dst, i64 0, i64 %for.loop.idx2
  switch i2 %3, label %src.addr.case.3 [
    i2 0, label %src.addr.case.0
    i2 1, label %src.addr.case.1
    i2 -2, label %src.addr.case.2
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load float, float* %src_0, align 4
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_1 = load float, float* %src_1, align 4
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %_2 = load float, float* %src_2, align 4
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  %_3 = load float, float* %src_3, align 4
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %4 = phi float [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ], [ %_2, %src.addr.case.2 ], [ %_3, %src.addr.case.3 ]
  store float %4, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2a4f32.160.163([2 x [4 x float]]* "orig.arg.no"="0" %dst, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [2 x float]* %src_0, null
  %1 = icmp eq [2 x [4 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x [4 x float]], [2 x [4 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [2 x float], [2 x float]* %src_0, i64 0, i64 %for.loop.idx2
  %src.addr_1 = getelementptr [2 x float], [2 x float]* %src_1, i64 0, i64 %for.loop.idx2
  %src.addr_2 = getelementptr [2 x float], [2 x float]* %src_2, i64 0, i64 %for.loop.idx2
  %src.addr_3 = getelementptr [2 x float], [2 x float]* %src_3, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a4f32.161.162([4 x float]* %dst.addr, float* %src.addr_0, float* %src.addr_1, float* %src.addr_2, float* %src.addr_3, i64 4)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a2a4f32.159.164([2 x [4 x float]]* noalias "orig.arg.no"="0" %dst, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %src_0, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %src_1, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.2" %src_2, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.3" %src_3) #4 {
entry:
  %0 = icmp eq [2 x [4 x float]]* %dst, null
  %1 = icmp eq [2 x float]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2a4f32.160.163([2 x [4 x float]]* nonnull %dst, [2 x float]* nonnull %src_0, [2 x float]* %src_1, [2 x float]* %src_2, [2 x float]* %src_3, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2f32.167.168([2 x float]* "orig.arg.no"="0" %dst, float* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, float* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq float* %src_0, null
  %1 = icmp eq [2 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %3 = trunc i64 %for.loop.idx2 to i1
  %dst.addr = getelementptr [2 x float], [2 x float]* %dst, i64 0, i64 %for.loop.idx2
  %cond = icmp eq i1 %3, false
  br i1 %cond, label %src.addr.case.0, label %src.addr.case.1

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load float, float* %src_0, align 4
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @llvm.assume(i1 %3)
  %_1 = load float, float* %src_1, align 4
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0
  %4 = phi float [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ]
  store float %4, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a4a2f32.166.169([4 x [2 x float]]* "orig.arg.no"="0" %dst, [4 x float]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [4 x float]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [4 x float]* %src_0, null
  %1 = icmp eq [4 x [2 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4 x [2 x float]], [4 x [2 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [4 x float], [4 x float]* %src_0, i64 0, i64 %for.loop.idx2
  %src.addr_1 = getelementptr [4 x float], [4 x float]* %src_1, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a2f32.167.168([2 x float]* %dst.addr, float* %src.addr_0, float* %src.addr_1, i64 2)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a4a2f32.165.170([4 x [2 x float]]* noalias "orig.arg.no"="0" %dst, [4 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %src_0, [4 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %src_1) #4 {
entry:
  %0 = icmp eq [4 x [2 x float]]* %dst, null
  %1 = icmp eq [4 x float]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a4a2f32.166.169([4 x [2 x float]]* nonnull %dst, [4 x float]* nonnull %src_0, [4 x float]* %src_1, i64 4)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2a2f32.172.173([2 x [2 x float]]* "orig.arg.no"="0" %dst, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [2 x float]* %src_0, null
  %1 = icmp eq [2 x [2 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x [2 x float]], [2 x [2 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [2 x float], [2 x float]* %src_0, i64 0, i64 %for.loop.idx2
  %src.addr_1 = getelementptr [2 x float], [2 x float]* %src_1, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a2f32.167.168([2 x float]* %dst.addr, float* %src.addr_0, float* %src.addr_1, i64 2)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a2a2f32.171.174([2 x [2 x float]]* noalias "orig.arg.no"="0" %dst, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %src_0, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %src_1) #4 {
entry:
  %0 = icmp eq [2 x [2 x float]]* %dst, null
  %1 = icmp eq [2 x float]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2a2f32.172.173([2 x [2 x float]]* nonnull %dst, [2 x float]* nonnull %src_0, [2 x float]* %src_1, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_out([2 x [4 x float]]* noalias "orig.arg.no"="0", [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %_0, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %_1, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.2" %_2, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.3" %_3, [4 x [2 x float]]* noalias "orig.arg.no"="2", [4 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.0" %_01, [4 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.1" %_12, [2 x [2 x float]]* noalias "orig.arg.no"="4", [2 x float]* noalias readonly align 512 "orig.arg.no"="5" "unpacked"="5.0" %_03, [2 x float]* noalias readonly align 512 "orig.arg.no"="5" "unpacked"="5.1" %_14) #6 {
entry:
  call void @onebyonecpy_hls.p0a2a4f32.159.164([2 x [4 x float]]* %0, [2 x float]* align 512 %_0, [2 x float]* align 512 %_1, [2 x float]* align 512 %_2, [2 x float]* align 512 %_3)
  call void @onebyonecpy_hls.p0a4a2f32.165.170([4 x [2 x float]]* %1, [4 x float]* align 512 %_01, [4 x float]* align 512 %_12)
  call void @onebyonecpy_hls.p0a2a2f32.171.174([2 x [2 x float]]* %2, [2 x float]* align 512 %_03, [2 x float]* align 512 %_14)
  ret void
}

declare void @apatb_bit_linear_hw([2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, [4 x float]*, [4 x float]*, [2 x float]*, [2 x float]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_back([2 x [4 x float]]* noalias "orig.arg.no"="0", [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %_0, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %_1, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.2" %_2, [2 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.3" %_3, [4 x [2 x float]]* noalias "orig.arg.no"="2", [4 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.0" %_01, [4 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.1" %_12, [2 x [2 x float]]* noalias "orig.arg.no"="4", [2 x float]* noalias readonly align 512 "orig.arg.no"="5" "unpacked"="5.0" %_03, [2 x float]* noalias readonly align 512 "orig.arg.no"="5" "unpacked"="5.1" %_14) #6 {
entry:
  call void @onebyonecpy_hls.p0a2a2f32.171.174([2 x [2 x float]]* %2, [2 x float]* align 512 %_03, [2 x float]* align 512 %_14)
  ret void
}

define void @bit_linear_hw_stub_wrapper([2 x float]*, [2 x float]*, [2 x float]*, [2 x float]*, [4 x float]*, [4 x float]*, [2 x float]*, [2 x float]*) #7 {
entry:
  %8 = alloca [2 x [4 x float]]
  %9 = alloca [4 x [2 x float]]
  %10 = alloca [2 x [2 x float]]
  call void @copy_out([2 x [4 x float]]* %8, [2 x float]* %0, [2 x float]* %1, [2 x float]* %2, [2 x float]* %3, [4 x [2 x float]]* %9, [4 x float]* %4, [4 x float]* %5, [2 x [2 x float]]* %10, [2 x float]* %6, [2 x float]* %7)
  %11 = bitcast [2 x [4 x float]]* %8 to [4 x float]*
  %12 = bitcast [4 x [2 x float]]* %9 to [2 x float]*
  %13 = bitcast [2 x [2 x float]]* %10 to [2 x float]*
  call void @bit_linear_hw_stub([4 x float]* %11, [2 x float]* %12, [2 x float]* %13)
  call void @copy_in([2 x [4 x float]]* %8, [2 x float]* %0, [2 x float]* %1, [2 x float]* %2, [2 x float]* %3, [4 x [2 x float]]* %9, [4 x float]* %4, [4 x float]* %5, [2 x [2 x float]]* %10, [2 x float]* %6, [2 x float]* %7)
  ret void
}

declare void @bit_linear_hw_stub([4 x float]*, [2 x float]*, [2 x float]*)

attributes #0 = { inaccessiblememonly nounwind willreturn }
attributes #1 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { nounwind willreturn }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #5 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #6 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind willreturn "xlx.source"="infer-from-pragma" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}
!datalayout.transforms.on.top = !{!5, !15, !21}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !{!6, !8, !10}
!6 = !{!7}
!7 = !{!"0", [2 x [4 x float]]* null}
!8 = !{!9}
!9 = !{!"array_partition", !"type=Complete", !"dim=2"}
!10 = !{!11, !12, !13, !14}
!11 = !{!"0.0", [2 x float]* null}
!12 = !{!"0.1", [2 x float]* null}
!13 = !{!"0.2", [2 x float]* null}
!14 = !{!"0.3", [2 x float]* null}
!15 = !{!16, !8, !18}
!16 = !{!17}
!17 = !{!"1", [4 x [2 x float]]* null}
!18 = !{!19, !20}
!19 = !{!"1.0", [4 x float]* null}
!20 = !{!"1.1", [4 x float]* null}
!21 = !{!22, !8, !24}
!22 = !{!23}
!23 = !{!"2", [2 x [2 x float]]* null}
!24 = !{!25, !26}
!25 = !{!"2.0", [2 x float]* null}
!26 = !{!"2.1", [2 x float]* null}
!27 = !DILocation(line: 6, column: 9, scope: !28)
!28 = distinct !DISubprogram(name: "bit_linear", linkageName: "_Z10bit_linearPA4_fPA2_fS2_", scope: !29, file: !29, line: 4, type: !30, isLocal: false, isDefinition: true, scopeLine: 5, flags: DIFlagPrototyped, isOptimized: false, unit: !41, variables: !4)
!29 = !DIFile(filename: "Bit_linear/src/bit_linear.cpp", directory: "C:\5COneDrive\5CDesktop\5CViT")
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32, !37, !37}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 128, elements: !35)
!34 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!35 = !{!36}
!36 = !DISubrange(count: 4)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 64, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 2)
!41 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !42, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, imports: !43)
!42 = !DIFile(filename: "C:/OneDrive/Desktop/ViT/Bit_linear/solution1/.autopilot/db\5Cbit_linear.pp.0.cpp", directory: "C:\5COneDrive\5CDesktop\5CViT")
!43 = !{!44, !52, !58, !60, !62, !66, !68, !70, !72, !74, !76, !78, !80, !85, !89, !91, !93, !98, !100, !102, !104, !106, !108, !110, !112, !114, !116, !120, !125, !127, !129, !131, !133, !135, !137, !139, !141, !143, !145, !149, !153, !155, !157, !159, !161, !163, !165, !167, !169, !171, !173, !175, !177, !179, !181, !183, !187, !191, !195, !197, !199, !201, !203, !205, !207, !209, !211, !213, !217, !221, !225, !227, !229, !231, !236, !240, !244, !246, !248, !250, !252, !254, !256, !258, !260, !262, !264, !266, !268, !273, !277, !281, !283, !285, !287, !294, !298, !302, !304, !306, !308, !310, !312, !314, !318, !322, !324, !326, !328, !330, !334, !338, !342, !344, !346, !348, !350, !352, !354, !358, !362, !366, !368, !372, !376, !378, !380, !382, !384, !386, !388, !394}
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !46, file: !51, line: 52)
!45 = !DINamespace(name: "std", scope: null)
!46 = !DISubprogram(name: "abs", scope: !47, file: !47, line: 254, type: !48, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DIFile(filename: "C:/Xilinx/Vitis_HLS/2023.2/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cmath.h", directory: "C:\5COneDrive\5CDesktop\5CViT")
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIFile(filename: "C:/Xilinx/Vitis_HLS/2023.2/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cbits/std_abs.h", directory: "C:\5COneDrive\5CDesktop\5CViT")
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !53, file: !57, line: 83)
!53 = !DISubprogram(name: "acos", scope: !47, file: !47, line: 190, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56}
!56 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!57 = !DIFile(filename: "C:/Xilinx/Vitis_HLS/2023.2/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccmath", directory: "C:\5COneDrive\5CDesktop\5CViT")
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !59, file: !57, line: 102)
!59 = !DISubprogram(name: "asin", scope: !47, file: !47, line: 189, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !61, file: !57, line: 121)
!61 = !DISubprogram(name: "atan", scope: !47, file: !47, line: 191, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !63, file: !57, line: 140)
!63 = !DISubprogram(name: "atan2", scope: !47, file: !47, line: 192, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DISubroutineType(types: !65)
!65 = !{!56, !56, !56}
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !67, file: !57, line: 161)
!67 = !DISubprogram(name: "ceil", scope: !47, file: !47, line: 198, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !69, file: !57, line: 180)
!69 = !DISubprogram(name: "cos", scope: !47, file: !47, line: 184, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !71, file: !57, line: 199)
!71 = !DISubprogram(name: "cosh", scope: !47, file: !47, line: 187, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !73, file: !57, line: 218)
!73 = !DISubprogram(name: "exp", scope: !47, file: !47, line: 193, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !75, file: !57, line: 237)
!75 = !DISubprogram(name: "fabs", scope: !47, file: !47, line: 204, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !77, file: !57, line: 256)
!77 = !DISubprogram(name: "floor", scope: !47, file: !47, line: 199, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !79, file: !57, line: 275)
!79 = !DISubprogram(name: "fmod", scope: !47, file: !47, line: 246, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !81, file: !57, line: 296)
!81 = !DISubprogram(name: "frexp", scope: !47, file: !47, line: 244, type: !82, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DISubroutineType(types: !83)
!83 = !{!56, !56, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !86, file: !57, line: 315)
!86 = !DISubprogram(name: "ldexp", scope: !47, file: !47, line: 243, type: !87, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DISubroutineType(types: !88)
!88 = !{!56, !56, !50}
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !90, file: !57, line: 334)
!90 = !DISubprogram(name: "log", scope: !47, file: !47, line: 194, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !92, file: !57, line: 353)
!92 = !DISubprogram(name: "log10", scope: !47, file: !47, line: 195, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !94, file: !57, line: 372)
!94 = !DISubprogram(name: "modf", scope: !47, file: !47, line: 245, type: !95, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DISubroutineType(types: !96)
!96 = !{!56, !56, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !99, file: !57, line: 384)
!99 = !DISubprogram(name: "pow", scope: !47, file: !47, line: 196, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !101, file: !57, line: 421)
!101 = !DISubprogram(name: "sin", scope: !47, file: !47, line: 183, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !103, file: !57, line: 440)
!103 = !DISubprogram(name: "sinh", scope: !47, file: !47, line: 186, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !105, file: !57, line: 459)
!105 = !DISubprogram(name: "sqrt", scope: !47, file: !47, line: 197, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !107, file: !57, line: 478)
!107 = !DISubprogram(name: "tan", scope: !47, file: !47, line: 185, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !109, file: !57, line: 497)
!109 = !DISubprogram(name: "tanh", scope: !47, file: !47, line: 188, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !111, file: !57, line: 1065)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !47, line: 373, baseType: !56)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !113, file: !57, line: 1066)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !47, line: 372, baseType: !34)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !115, file: !57, line: 1069)
!115 = !DISubprogram(name: "acosh", scope: !47, file: !47, line: 705, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !117, file: !57, line: 1070)
!117 = !DISubprogram(name: "acoshf", scope: !47, file: !47, line: 706, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{!34, !34}
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !121, file: !57, line: 1071)
!121 = !DISubprogram(name: "acoshl", scope: !47, file: !47, line: 707, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DISubroutineType(types: !123)
!123 = !{!124, !124}
!124 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !126, file: !57, line: 1073)
!126 = !DISubprogram(name: "asinh", scope: !47, file: !47, line: 710, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !128, file: !57, line: 1074)
!128 = !DISubprogram(name: "asinhf", scope: !47, file: !47, line: 711, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !130, file: !57, line: 1075)
!130 = !DISubprogram(name: "asinhl", scope: !47, file: !47, line: 712, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !132, file: !57, line: 1077)
!132 = !DISubprogram(name: "atanh", scope: !47, file: !47, line: 715, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !134, file: !57, line: 1078)
!134 = !DISubprogram(name: "atanhf", scope: !47, file: !47, line: 716, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !136, file: !57, line: 1079)
!136 = !DISubprogram(name: "atanhl", scope: !47, file: !47, line: 717, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !138, file: !57, line: 1081)
!138 = !DISubprogram(name: "cbrt", scope: !47, file: !47, line: 877, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !140, file: !57, line: 1082)
!140 = !DISubprogram(name: "cbrtf", scope: !47, file: !47, line: 878, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !142, file: !57, line: 1083)
!142 = !DISubprogram(name: "cbrtl", scope: !47, file: !47, line: 879, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !144, file: !57, line: 1085)
!144 = !DISubprogram(name: "copysign", scope: !47, file: !47, line: 1063, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !146, file: !57, line: 1086)
!146 = !DISubprogram(name: "copysignf", scope: !47, file: !47, line: 1064, type: !147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DISubroutineType(types: !148)
!148 = !{!34, !34, !34}
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !150, file: !57, line: 1087)
!150 = !DISubprogram(name: "copysignl", scope: !47, file: !47, line: 1065, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DISubroutineType(types: !152)
!152 = !{!124, !124, !124}
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !154, file: !57, line: 1089)
!154 = !DISubprogram(name: "erf", scope: !47, file: !47, line: 901, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !156, file: !57, line: 1090)
!156 = !DISubprogram(name: "erff", scope: !47, file: !47, line: 902, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !158, file: !57, line: 1091)
!158 = !DISubprogram(name: "erfl", scope: !47, file: !47, line: 903, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !160, file: !57, line: 1093)
!160 = !DISubprogram(name: "erfc", scope: !47, file: !47, line: 906, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !162, file: !57, line: 1094)
!162 = !DISubprogram(name: "erfcf", scope: !47, file: !47, line: 907, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !164, file: !57, line: 1095)
!164 = !DISubprogram(name: "erfcl", scope: !47, file: !47, line: 908, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !166, file: !57, line: 1097)
!166 = !DISubprogram(name: "exp2", scope: !47, file: !47, line: 728, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !168, file: !57, line: 1098)
!168 = !DISubprogram(name: "exp2f", scope: !47, file: !47, line: 729, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !170, file: !57, line: 1099)
!170 = !DISubprogram(name: "exp2l", scope: !47, file: !47, line: 730, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !172, file: !57, line: 1101)
!172 = !DISubprogram(name: "expm1", scope: !47, file: !47, line: 734, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !174, file: !57, line: 1102)
!174 = !DISubprogram(name: "expm1f", scope: !47, file: !47, line: 735, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !176, file: !57, line: 1103)
!176 = !DISubprogram(name: "expm1l", scope: !47, file: !47, line: 736, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !178, file: !57, line: 1105)
!178 = !DISubprogram(name: "fdim", scope: !47, file: !47, line: 1109, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !180, file: !57, line: 1106)
!180 = !DISubprogram(name: "fdimf", scope: !47, file: !47, line: 1110, type: !147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !182, file: !57, line: 1107)
!182 = !DISubprogram(name: "fdiml", scope: !47, file: !47, line: 1111, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !184, file: !57, line: 1109)
!184 = !DISubprogram(name: "fma", scope: !47, file: !47, line: 1130, type: !185, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DISubroutineType(types: !186)
!186 = !{!56, !56, !56, !56}
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !188, file: !57, line: 1110)
!188 = !DISubprogram(name: "fmaf", scope: !47, file: !47, line: 1131, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!34, !34, !34, !34}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !192, file: !57, line: 1111)
!192 = !DISubprogram(name: "fmal", scope: !47, file: !47, line: 1132, type: !193, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!124, !124, !124, !124}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !196, file: !57, line: 1113)
!196 = !DISubprogram(name: "fmax", scope: !47, file: !47, line: 1119, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !198, file: !57, line: 1114)
!198 = !DISubprogram(name: "fmaxf", scope: !47, file: !47, line: 1120, type: !147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !200, file: !57, line: 1115)
!200 = !DISubprogram(name: "fmaxl", scope: !47, file: !47, line: 1121, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !202, file: !57, line: 1117)
!202 = !DISubprogram(name: "fmin", scope: !47, file: !47, line: 1124, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !204, file: !57, line: 1118)
!204 = !DISubprogram(name: "fminf", scope: !47, file: !47, line: 1125, type: !147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !206, file: !57, line: 1119)
!206 = !DISubprogram(name: "fminl", scope: !47, file: !47, line: 1126, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !208, file: !57, line: 1121)
!208 = !DISubprogram(name: "hypot", scope: !47, file: !47, line: 882, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !210, file: !57, line: 1122)
!210 = !DISubprogram(name: "hypotf", scope: !47, file: !47, line: 883, type: !147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !212, file: !57, line: 1123)
!212 = !DISubprogram(name: "hypotl", scope: !47, file: !47, line: 887, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !214, file: !57, line: 1125)
!214 = !DISubprogram(name: "ilogb", scope: !47, file: !47, line: 748, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DISubroutineType(types: !216)
!216 = !{!50, !56}
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !218, file: !57, line: 1126)
!218 = !DISubprogram(name: "ilogbf", scope: !47, file: !47, line: 749, type: !219, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DISubroutineType(types: !220)
!220 = !{!50, !34}
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !222, file: !57, line: 1127)
!222 = !DISubprogram(name: "ilogbl", scope: !47, file: !47, line: 750, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DISubroutineType(types: !224)
!224 = !{!50, !124}
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !226, file: !57, line: 1129)
!226 = !DISubprogram(name: "lgamma", scope: !47, file: !47, line: 911, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !228, file: !57, line: 1130)
!228 = !DISubprogram(name: "lgammaf", scope: !47, file: !47, line: 912, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !230, file: !57, line: 1131)
!230 = !DISubprogram(name: "lgammal", scope: !47, file: !47, line: 913, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !232, file: !57, line: 1134)
!232 = !DISubprogram(name: "llrint", scope: !47, file: !47, line: 946, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DISubroutineType(types: !234)
!234 = !{!235, !56}
!235 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !237, file: !57, line: 1135)
!237 = !DISubprogram(name: "llrintf", scope: !47, file: !47, line: 947, type: !238, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DISubroutineType(types: !239)
!239 = !{!235, !34}
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !241, file: !57, line: 1136)
!241 = !DISubprogram(name: "llrintl", scope: !47, file: !47, line: 948, type: !242, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DISubroutineType(types: !243)
!243 = !{!235, !124}
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !245, file: !57, line: 1138)
!245 = !DISubprogram(name: "llround", scope: !47, file: !47, line: 1038, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !247, file: !57, line: 1139)
!247 = !DISubprogram(name: "llroundf", scope: !47, file: !47, line: 1039, type: !238, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !249, file: !57, line: 1140)
!249 = !DISubprogram(name: "llroundl", scope: !47, file: !47, line: 1040, type: !242, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !251, file: !57, line: 1143)
!251 = !DISubprogram(name: "log1p", scope: !47, file: !47, line: 768, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !253, file: !57, line: 1144)
!253 = !DISubprogram(name: "log1pf", scope: !47, file: !47, line: 769, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !255, file: !57, line: 1145)
!255 = !DISubprogram(name: "log1pl", scope: !47, file: !47, line: 770, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !257, file: !57, line: 1147)
!257 = !DISubprogram(name: "log2", scope: !47, file: !47, line: 773, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !259, file: !57, line: 1148)
!259 = !DISubprogram(name: "log2f", scope: !47, file: !47, line: 774, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !261, file: !57, line: 1149)
!261 = !DISubprogram(name: "log2l", scope: !47, file: !47, line: 775, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !263, file: !57, line: 1151)
!263 = !DISubprogram(name: "logb", scope: !47, file: !47, line: 778, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !265, file: !57, line: 1152)
!265 = !DISubprogram(name: "logbf", scope: !47, file: !47, line: 779, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !267, file: !57, line: 1153)
!267 = !DISubprogram(name: "logbl", scope: !47, file: !47, line: 780, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !269, file: !57, line: 1155)
!269 = !DISubprogram(name: "lrint", scope: !47, file: !47, line: 942, type: !270, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DISubroutineType(types: !271)
!271 = !{!272, !56}
!272 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !274, file: !57, line: 1156)
!274 = !DISubprogram(name: "lrintf", scope: !47, file: !47, line: 943, type: !275, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DISubroutineType(types: !276)
!276 = !{!272, !34}
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !278, file: !57, line: 1157)
!278 = !DISubprogram(name: "lrintl", scope: !47, file: !47, line: 944, type: !279, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!279 = !DISubroutineType(types: !280)
!280 = !{!272, !124}
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !282, file: !57, line: 1159)
!282 = !DISubprogram(name: "lround", scope: !47, file: !47, line: 1035, type: !270, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !284, file: !57, line: 1160)
!284 = !DISubprogram(name: "lroundf", scope: !47, file: !47, line: 1036, type: !275, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !286, file: !57, line: 1161)
!286 = !DISubprogram(name: "lroundl", scope: !47, file: !47, line: 1037, type: !279, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !288, file: !57, line: 1163)
!288 = !DISubprogram(name: "nan", scope: !47, file: !47, line: 1087, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DISubroutineType(types: !290)
!290 = !{!56, !291}
!291 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !292, size: 64)
!292 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !293)
!293 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !295, file: !57, line: 1164)
!295 = !DISubprogram(name: "nanf", scope: !47, file: !47, line: 1088, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DISubroutineType(types: !297)
!297 = !{!34, !291}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !299, file: !57, line: 1165)
!299 = !DISubprogram(name: "nanl", scope: !47, file: !47, line: 1089, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DISubroutineType(types: !301)
!301 = !{!124, !291}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !303, file: !57, line: 1167)
!303 = !DISubprogram(name: "nearbyint", scope: !47, file: !47, line: 931, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !305, file: !57, line: 1168)
!305 = !DISubprogram(name: "nearbyintf", scope: !47, file: !47, line: 932, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !307, file: !57, line: 1169)
!307 = !DISubprogram(name: "nearbyintl", scope: !47, file: !47, line: 933, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !309, file: !57, line: 1171)
!309 = !DISubprogram(name: "nextafter", scope: !47, file: !47, line: 1098, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !311, file: !57, line: 1172)
!311 = !DISubprogram(name: "nextafterf", scope: !47, file: !47, line: 1099, type: !147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !313, file: !57, line: 1173)
!313 = !DISubprogram(name: "nextafterl", scope: !47, file: !47, line: 1100, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !315, file: !57, line: 1175)
!315 = !DISubprogram(name: "nexttoward", scope: !47, file: !47, line: 1103, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DISubroutineType(types: !317)
!317 = !{!56, !56, !124}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !319, file: !57, line: 1176)
!319 = !DISubprogram(name: "nexttowardf", scope: !47, file: !47, line: 1104, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DISubroutineType(types: !321)
!321 = !{!34, !34, !124}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !323, file: !57, line: 1177)
!323 = !DISubprogram(name: "nexttowardl", scope: !47, file: !47, line: 1105, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !325, file: !57, line: 1179)
!325 = !DISubprogram(name: "remainder", scope: !47, file: !47, line: 1053, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !327, file: !57, line: 1180)
!327 = !DISubprogram(name: "remainderf", scope: !47, file: !47, line: 1054, type: !147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !329, file: !57, line: 1181)
!329 = !DISubprogram(name: "remainderl", scope: !47, file: !47, line: 1055, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !331, file: !57, line: 1183)
!331 = !DISubprogram(name: "remquo", scope: !47, file: !47, line: 1058, type: !332, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!332 = !DISubroutineType(types: !333)
!333 = !{!56, !56, !56, !84}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !335, file: !57, line: 1184)
!335 = !DISubprogram(name: "remquof", scope: !47, file: !47, line: 1059, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DISubroutineType(types: !337)
!337 = !{!34, !34, !34, !84}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !339, file: !57, line: 1185)
!339 = !DISubprogram(name: "remquol", scope: !47, file: !47, line: 1060, type: !340, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DISubroutineType(types: !341)
!341 = !{!124, !124, !124, !84}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !343, file: !57, line: 1187)
!343 = !DISubprogram(name: "rint", scope: !47, file: !47, line: 937, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !345, file: !57, line: 1188)
!345 = !DISubprogram(name: "rintf", scope: !47, file: !47, line: 938, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !347, file: !57, line: 1189)
!347 = !DISubprogram(name: "rintl", scope: !47, file: !47, line: 939, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !349, file: !57, line: 1191)
!349 = !DISubprogram(name: "round", scope: !47, file: !47, line: 1030, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !351, file: !57, line: 1192)
!351 = !DISubprogram(name: "roundf", scope: !47, file: !47, line: 1031, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !353, file: !57, line: 1193)
!353 = !DISubprogram(name: "roundl", scope: !47, file: !47, line: 1032, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !355, file: !57, line: 1195)
!355 = !DISubprogram(name: "scalbln", scope: !47, file: !47, line: 871, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{!56, !56, !272}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !359, file: !57, line: 1196)
!359 = !DISubprogram(name: "scalblnf", scope: !47, file: !47, line: 872, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{!34, !34, !272}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !363, file: !57, line: 1197)
!363 = !DISubprogram(name: "scalblnl", scope: !47, file: !47, line: 873, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!124, !124, !272}
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !367, file: !57, line: 1199)
!367 = !DISubprogram(name: "scalbn", scope: !47, file: !47, line: 867, type: !87, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !369, file: !57, line: 1200)
!369 = !DISubprogram(name: "scalbnf", scope: !47, file: !47, line: 868, type: !370, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!370 = !DISubroutineType(types: !371)
!371 = !{!34, !34, !50}
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !373, file: !57, line: 1201)
!373 = !DISubprogram(name: "scalbnl", scope: !47, file: !47, line: 869, type: !374, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!374 = !DISubroutineType(types: !375)
!375 = !{!124, !124, !50}
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !377, file: !57, line: 1203)
!377 = !DISubprogram(name: "tgamma", scope: !47, file: !47, line: 918, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !379, file: !57, line: 1204)
!379 = !DISubprogram(name: "tgammaf", scope: !47, file: !47, line: 919, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !381, file: !57, line: 1205)
!381 = !DISubprogram(name: "tgammal", scope: !47, file: !47, line: 920, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !383, file: !57, line: 1207)
!383 = !DISubprogram(name: "trunc", scope: !47, file: !47, line: 1044, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !385, file: !57, line: 1208)
!385 = !DISubprogram(name: "truncf", scope: !47, file: !47, line: 1045, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !387, file: !57, line: 1209)
!387 = !DISubprogram(name: "truncl", scope: !47, file: !47, line: 1046, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !389, file: !393, line: 38)
!389 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !45, file: !51, line: 84, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!390 = !DISubroutineType(types: !391)
!391 = !{!392, !392}
!392 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!393 = !DIFile(filename: "C:/Xilinx/Vitis_HLS/2023.2/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cmath.h", directory: "C:\5COneDrive\5CDesktop\5CViT")
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !395, file: !393, line: 54)
!395 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !45, file: !57, line: 380, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !DISubroutineType(types: !397)
!397 = !{!124, !124, !398}
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!399 = !DILocation(line: 7, column: 9, scope: !28)
!400 = !DILocation(line: 8, column: 9, scope: !28)
