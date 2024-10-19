; ModuleID = 'C:/OneDrive/Desktop/ViT/Activation_quantzation/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind willreturn
declare void @llvm.sideeffect() #0

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_activation_quant_ir([3 x float]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="3" "partition" %input, [3 x float]* noalias nocapture nonnull "fpga.decayed.dim.hint"="3" "partition" %output) local_unnamed_addr #1 {
entry:
  %input_copy_0 = alloca [3 x float], align 512
  %input_copy_1 = alloca [3 x float], align 512
  %input_copy_2 = alloca [3 x float], align 512
  %output_copy_0 = alloca [3 x float], align 512
  %output_copy_1 = alloca [3 x float], align 512
  %output_copy_2 = alloca [3 x float], align 512
  %0 = bitcast [3 x float]* %input to [3 x [3 x float]]*
  %1 = bitcast [3 x float]* %output to [3 x [3 x float]]*
  call void @copy_in([3 x [3 x float]]* nonnull %0, [3 x float]* nonnull align 512 %input_copy_0, [3 x float]* nonnull align 512 %input_copy_1, [3 x float]* nonnull align 512 %input_copy_2, [3 x [3 x float]]* nonnull %1, [3 x float]* nonnull align 512 %output_copy_0, [3 x float]* nonnull align 512 %output_copy_1, [3 x float]* nonnull align 512 %output_copy_2)
  %_0 = getelementptr [3 x float], [3 x float]* %input_copy_0, i64 0, i64 0
  %_1 = getelementptr [3 x float], [3 x float]* %input_copy_1, i64 0, i64 0
  %_2 = getelementptr [3 x float], [3 x float]* %input_copy_2, i64 0, i64 0
  %_01 = getelementptr [3 x float], [3 x float]* %output_copy_0, i64 0, i64 0
  %_12 = getelementptr [3 x float], [3 x float]* %output_copy_1, i64 0, i64 0
  %_23 = getelementptr [3 x float], [3 x float]* %output_copy_2, i64 0, i64 0
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_0, i32 998, i32 1, i32 0, i1 false) ], !dbg !21
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_1, i32 998, i32 1, i32 0, i1 false) ], !dbg !21
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_2, i32 998, i32 1, i32 0, i1 false) ], !dbg !21
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_01, i32 998, i32 1, i32 0, i1 false) ], !dbg !389
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_12, i32 998, i32 1, i32 0, i1 false) ], !dbg !389
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(float* %_23, i32 998, i32 1, i32 0, i1 false) ], !dbg !389
  call void @apatb_activation_quant_hw([3 x float]* %input_copy_0, [3 x float]* %input_copy_1, [3 x float]* %input_copy_2, [3 x float]* %output_copy_0, [3 x float]* %output_copy_1, [3 x float]* %output_copy_2)
  call void @copy_back([3 x [3 x float]]* %0, [3 x float]* %input_copy_0, [3 x float]* %input_copy_1, [3 x float]* %input_copy_2, [3 x [3 x float]]* %1, [3 x float]* %output_copy_0, [3 x float]* %output_copy_1, [3 x float]* %output_copy_2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3a3f32([3 x [3 x float]]* "orig.arg.no"="0" %dst, [3 x [3 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [3 x [3 x float]]* %src, null
  %1 = icmp eq [3 x [3 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3 x [3 x float]], [3 x [3 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3 x [3 x float]], [3 x [3 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a3f32([3 x float]* %dst.addr, [3 x float]* %src.addr, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3f32([3 x float]* "orig.arg.no"="0" %dst, [3 x float]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [3 x float]* %src, null
  %1 = icmp eq [3 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3 x float], [3 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3 x float], [3 x float]* %src, i64 0, i64 %for.loop.idx2
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

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #3

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3f32.126.127(float* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, float* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, float* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [3 x float]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [3 x float]* %src, null
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
  %src.addr = getelementptr [3 x float], [3 x float]* %src, i64 0, i64 %for.loop.idx2
  %4 = load float, float* %src.addr, align 4
  switch i2 %3, label %dst.addr.case.2 [
    i2 0, label %dst.addr.case.0
    i2 1, label %dst.addr.case.1
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store float %4, float* %dst_0, align 4
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store float %4, float* %dst_1, align 4
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  %5 = icmp eq i2 %3, -2
  call void @llvm.assume(i1 %5)
  store float %4, float* %dst_2, align 4
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3a3f32.125.128([3 x float]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [3 x float]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [3 x float]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [3 x [3 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [3 x [3 x float]]* %src, null
  %1 = icmp eq [3 x float]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr_0 = getelementptr [3 x float], [3 x float]* %dst_0, i64 0, i64 %for.loop.idx2
  %dst.addr_1 = getelementptr [3 x float], [3 x float]* %dst_1, i64 0, i64 %for.loop.idx2
  %dst.addr_2 = getelementptr [3 x float], [3 x float]* %dst_2, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3 x [3 x float]], [3 x [3 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a3f32.126.127(float* %dst.addr_0, float* %dst.addr_1, float* %dst.addr_2, [3 x float]* %src.addr, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a3a3f32.124.129([3 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [3 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [3 x float]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [3 x [3 x float]]* noalias readonly "orig.arg.no"="1" %src) #4 {
entry:
  %0 = icmp eq [3 x float]* %dst_0, null
  %1 = icmp eq [3 x [3 x float]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a3a3f32.125.128([3 x float]* nonnull %dst_0, [3 x float]* %dst_1, [3 x float]* %dst_2, [3 x [3 x float]]* nonnull %src, i64 3)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_in([3 x [3 x float]]* noalias readonly "orig.arg.no"="0", [3 x float]* noalias align 512 "orig.arg.no"="1" "unpacked"="1.0" %_0, [3 x float]* noalias align 512 "orig.arg.no"="1" "unpacked"="1.1" %_1, [3 x float]* noalias align 512 "orig.arg.no"="1" "unpacked"="1.2" %_2, [3 x [3 x float]]* noalias readonly "orig.arg.no"="2", [3 x float]* noalias align 512 "orig.arg.no"="3" "unpacked"="3.0" %_01, [3 x float]* noalias align 512 "orig.arg.no"="3" "unpacked"="3.1" %_12, [3 x float]* noalias align 512 "orig.arg.no"="3" "unpacked"="3.2" %_23) #5 {
entry:
  call void @onebyonecpy_hls.p0a3a3f32.124.129([3 x float]* align 512 %_0, [3 x float]* align 512 %_1, [3 x float]* align 512 %_2, [3 x [3 x float]]* %0)
  call void @onebyonecpy_hls.p0a3a3f32.124.129([3 x float]* align 512 %_01, [3 x float]* align 512 %_12, [3 x float]* align 512 %_23, [3 x [3 x float]]* %1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3f32.136.137([3 x float]* "orig.arg.no"="0" %dst, float* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, float* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, float* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq float* %src_0, null
  %1 = icmp eq [3 x float]* %dst, null
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
  %dst.addr = getelementptr [3 x float], [3 x float]* %dst, i64 0, i64 %for.loop.idx2
  switch i2 %3, label %src.addr.case.2 [
    i2 0, label %src.addr.case.0
    i2 1, label %src.addr.case.1
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load float, float* %src_0, align 4
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_1 = load float, float* %src_1, align 4
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %4 = icmp eq i2 %3, -2
  call void @llvm.assume(i1 %4)
  %_2 = load float, float* %src_2, align 4
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %5 = phi float [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ], [ %_2, %src.addr.case.2 ]
  store float %5, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3a3f32.135.138([3 x [3 x float]]* "orig.arg.no"="0" %dst, [3 x float]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [3 x float]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [3 x float]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [3 x float]* %src_0, null
  %1 = icmp eq [3 x [3 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3 x [3 x float]], [3 x [3 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [3 x float], [3 x float]* %src_0, i64 0, i64 %for.loop.idx2
  %src.addr_1 = getelementptr [3 x float], [3 x float]* %src_1, i64 0, i64 %for.loop.idx2
  %src.addr_2 = getelementptr [3 x float], [3 x float]* %src_2, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a3f32.136.137([3 x float]* %dst.addr, float* %src.addr_0, float* %src.addr_1, float* %src.addr_2, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a3a3f32.134.139([3 x [3 x float]]* noalias "orig.arg.no"="0" %dst, [3 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %src_0, [3 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %src_1, [3 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.2" %src_2) #4 {
entry:
  %0 = icmp eq [3 x [3 x float]]* %dst, null
  %1 = icmp eq [3 x float]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a3a3f32.135.138([3 x [3 x float]]* nonnull %dst, [3 x float]* nonnull %src_0, [3 x float]* %src_1, [3 x float]* %src_2, i64 3)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_out([3 x [3 x float]]* noalias "orig.arg.no"="0", [3 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %_0, [3 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %_1, [3 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.2" %_2, [3 x [3 x float]]* noalias "orig.arg.no"="2", [3 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.0" %_01, [3 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.1" %_12, [3 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.2" %_23) #6 {
entry:
  call void @onebyonecpy_hls.p0a3a3f32.134.139([3 x [3 x float]]* %0, [3 x float]* align 512 %_0, [3 x float]* align 512 %_1, [3 x float]* align 512 %_2)
  call void @onebyonecpy_hls.p0a3a3f32.134.139([3 x [3 x float]]* %1, [3 x float]* align 512 %_01, [3 x float]* align 512 %_12, [3 x float]* align 512 %_23)
  ret void
}

declare void @apatb_activation_quant_hw([3 x float]*, [3 x float]*, [3 x float]*, [3 x float]*, [3 x float]*, [3 x float]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_back([3 x [3 x float]]* noalias "orig.arg.no"="0", [3 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %_0, [3 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %_1, [3 x float]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.2" %_2, [3 x [3 x float]]* noalias "orig.arg.no"="2", [3 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.0" %_01, [3 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.1" %_12, [3 x float]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.2" %_23) #6 {
entry:
  call void @onebyonecpy_hls.p0a3a3f32.134.139([3 x [3 x float]]* %1, [3 x float]* align 512 %_01, [3 x float]* align 512 %_12, [3 x float]* align 512 %_23)
  ret void
}

define void @activation_quant_hw_stub_wrapper([3 x float]*, [3 x float]*, [3 x float]*, [3 x float]*, [3 x float]*, [3 x float]*) #7 {
entry:
  %6 = alloca [3 x [3 x float]]
  %7 = alloca [3 x [3 x float]]
  call void @copy_out([3 x [3 x float]]* %6, [3 x float]* %0, [3 x float]* %1, [3 x float]* %2, [3 x [3 x float]]* %7, [3 x float]* %3, [3 x float]* %4, [3 x float]* %5)
  %8 = bitcast [3 x [3 x float]]* %6 to [3 x float]*
  %9 = bitcast [3 x [3 x float]]* %7 to [3 x float]*
  call void @activation_quant_hw_stub([3 x float]* %8, [3 x float]* %9)
  call void @copy_in([3 x [3 x float]]* %6, [3 x float]* %0, [3 x float]* %1, [3 x float]* %2, [3 x [3 x float]]* %7, [3 x float]* %3, [3 x float]* %4, [3 x float]* %5)
  ret void
}

declare void @activation_quant_hw_stub([3 x float]*, [3 x float]*)

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
!datalayout.transforms.on.top = !{!5, !14}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !{!6, !8, !10}
!6 = !{!7}
!7 = !{!"0", [3 x [3 x float]]* null}
!8 = !{!9}
!9 = !{!"array_partition", !"type=Complete", !"dim=2"}
!10 = !{!11, !12, !13}
!11 = !{!"0.0", [3 x float]* null}
!12 = !{!"0.1", [3 x float]* null}
!13 = !{!"0.2", [3 x float]* null}
!14 = !{!15, !8, !17}
!15 = !{!16}
!16 = !{!"1", [3 x [3 x float]]* null}
!17 = !{!18, !19, !20}
!18 = !{!"1.0", [3 x float]* null}
!19 = !{!"1.1", [3 x float]* null}
!20 = !{!"1.2", [3 x float]* null}
!21 = !DILocation(line: 12, column: 9, scope: !22)
!22 = distinct !DISubprogram(name: "activation_quant", linkageName: "_Z16activation_quantPA3_fS0_", scope: !23, file: !23, line: 10, type: !24, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !31, variables: !4)
!23 = !DIFile(filename: "Activation_quantzation/src/activation_quant.cpp", directory: "C:\5COneDrive\5CDesktop\5CViT")
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 96, elements: !29)
!28 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!29 = !{!30}
!30 = !DISubrange(count: 3)
!31 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !32, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, imports: !33)
!32 = !DIFile(filename: "C:/OneDrive/Desktop/ViT/Activation_quantzation/solution1/.autopilot/db\5Cactivation_quant.pp.0.cpp", directory: "C:\5COneDrive\5CDesktop\5CViT")
!33 = !{!34, !42, !48, !50, !52, !56, !58, !60, !62, !64, !66, !68, !70, !75, !79, !81, !83, !88, !90, !92, !94, !96, !98, !100, !102, !104, !106, !110, !115, !117, !119, !121, !123, !125, !127, !129, !131, !133, !135, !139, !143, !145, !147, !149, !151, !153, !155, !157, !159, !161, !163, !165, !167, !169, !171, !173, !177, !181, !185, !187, !189, !191, !193, !195, !197, !199, !201, !203, !207, !211, !215, !217, !219, !221, !226, !230, !234, !236, !238, !240, !242, !244, !246, !248, !250, !252, !254, !256, !258, !263, !267, !271, !273, !275, !277, !284, !288, !292, !294, !296, !298, !300, !302, !304, !308, !312, !314, !316, !318, !320, !324, !328, !332, !334, !336, !338, !340, !342, !344, !348, !352, !356, !358, !362, !366, !368, !370, !372, !374, !376, !378, !384}
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !36, file: !41, line: 52)
!35 = !DINamespace(name: "std", scope: null)
!36 = !DISubprogram(name: "abs", scope: !37, file: !37, line: 254, type: !38, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!37 = !DIFile(filename: "C:/Xilinx/Vitis_HLS/2023.2/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cmath.h", directory: "C:\5COneDrive\5CDesktop\5CViT")
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !40}
!40 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!41 = !DIFile(filename: "C:/Xilinx/Vitis_HLS/2023.2/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cbits/std_abs.h", directory: "C:\5COneDrive\5CDesktop\5CViT")
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !43, file: !47, line: 83)
!43 = !DISubprogram(name: "acos", scope: !37, file: !37, line: 190, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46}
!46 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!47 = !DIFile(filename: "C:/Xilinx/Vitis_HLS/2023.2/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccmath", directory: "C:\5COneDrive\5CDesktop\5CViT")
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !49, file: !47, line: 102)
!49 = !DISubprogram(name: "asin", scope: !37, file: !37, line: 189, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !51, file: !47, line: 121)
!51 = !DISubprogram(name: "atan", scope: !37, file: !37, line: 191, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !53, file: !47, line: 140)
!53 = !DISubprogram(name: "atan2", scope: !37, file: !37, line: 192, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DISubroutineType(types: !55)
!55 = !{!46, !46, !46}
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !57, file: !47, line: 161)
!57 = !DISubprogram(name: "ceil", scope: !37, file: !37, line: 198, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !59, file: !47, line: 180)
!59 = !DISubprogram(name: "cos", scope: !37, file: !37, line: 184, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !61, file: !47, line: 199)
!61 = !DISubprogram(name: "cosh", scope: !37, file: !37, line: 187, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !63, file: !47, line: 218)
!63 = !DISubprogram(name: "exp", scope: !37, file: !37, line: 193, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !65, file: !47, line: 237)
!65 = !DISubprogram(name: "fabs", scope: !37, file: !37, line: 204, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !67, file: !47, line: 256)
!67 = !DISubprogram(name: "floor", scope: !37, file: !37, line: 199, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !69, file: !47, line: 275)
!69 = !DISubprogram(name: "fmod", scope: !37, file: !37, line: 246, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !71, file: !47, line: 296)
!71 = !DISubprogram(name: "frexp", scope: !37, file: !37, line: 244, type: !72, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DISubroutineType(types: !73)
!73 = !{!46, !46, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !76, file: !47, line: 315)
!76 = !DISubprogram(name: "ldexp", scope: !37, file: !37, line: 243, type: !77, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!77 = !DISubroutineType(types: !78)
!78 = !{!46, !46, !40}
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !80, file: !47, line: 334)
!80 = !DISubprogram(name: "log", scope: !37, file: !37, line: 194, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !82, file: !47, line: 353)
!82 = !DISubprogram(name: "log10", scope: !37, file: !37, line: 195, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !84, file: !47, line: 372)
!84 = !DISubprogram(name: "modf", scope: !37, file: !37, line: 245, type: !85, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!85 = !DISubroutineType(types: !86)
!86 = !{!46, !46, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !89, file: !47, line: 384)
!89 = !DISubprogram(name: "pow", scope: !37, file: !37, line: 196, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !91, file: !47, line: 421)
!91 = !DISubprogram(name: "sin", scope: !37, file: !37, line: 183, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !93, file: !47, line: 440)
!93 = !DISubprogram(name: "sinh", scope: !37, file: !37, line: 186, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !95, file: !47, line: 459)
!95 = !DISubprogram(name: "sqrt", scope: !37, file: !37, line: 197, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !97, file: !47, line: 478)
!97 = !DISubprogram(name: "tan", scope: !37, file: !37, line: 185, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !99, file: !47, line: 497)
!99 = !DISubprogram(name: "tanh", scope: !37, file: !37, line: 188, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !101, file: !47, line: 1065)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !37, line: 373, baseType: !46)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !103, file: !47, line: 1066)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !37, line: 372, baseType: !28)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !105, file: !47, line: 1069)
!105 = !DISubprogram(name: "acosh", scope: !37, file: !37, line: 705, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !107, file: !47, line: 1070)
!107 = !DISubprogram(name: "acoshf", scope: !37, file: !37, line: 706, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DISubroutineType(types: !109)
!109 = !{!28, !28}
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !111, file: !47, line: 1071)
!111 = !DISubprogram(name: "acoshl", scope: !37, file: !37, line: 707, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DISubroutineType(types: !113)
!113 = !{!114, !114}
!114 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !116, file: !47, line: 1073)
!116 = !DISubprogram(name: "asinh", scope: !37, file: !37, line: 710, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !118, file: !47, line: 1074)
!118 = !DISubprogram(name: "asinhf", scope: !37, file: !37, line: 711, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !120, file: !47, line: 1075)
!120 = !DISubprogram(name: "asinhl", scope: !37, file: !37, line: 712, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !122, file: !47, line: 1077)
!122 = !DISubprogram(name: "atanh", scope: !37, file: !37, line: 715, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !124, file: !47, line: 1078)
!124 = !DISubprogram(name: "atanhf", scope: !37, file: !37, line: 716, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !126, file: !47, line: 1079)
!126 = !DISubprogram(name: "atanhl", scope: !37, file: !37, line: 717, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !128, file: !47, line: 1081)
!128 = !DISubprogram(name: "cbrt", scope: !37, file: !37, line: 877, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !130, file: !47, line: 1082)
!130 = !DISubprogram(name: "cbrtf", scope: !37, file: !37, line: 878, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !132, file: !47, line: 1083)
!132 = !DISubprogram(name: "cbrtl", scope: !37, file: !37, line: 879, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !134, file: !47, line: 1085)
!134 = !DISubprogram(name: "copysign", scope: !37, file: !37, line: 1063, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !136, file: !47, line: 1086)
!136 = !DISubprogram(name: "copysignf", scope: !37, file: !37, line: 1064, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DISubroutineType(types: !138)
!138 = !{!28, !28, !28}
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !140, file: !47, line: 1087)
!140 = !DISubprogram(name: "copysignl", scope: !37, file: !37, line: 1065, type: !141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DISubroutineType(types: !142)
!142 = !{!114, !114, !114}
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !144, file: !47, line: 1089)
!144 = !DISubprogram(name: "erf", scope: !37, file: !37, line: 901, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !146, file: !47, line: 1090)
!146 = !DISubprogram(name: "erff", scope: !37, file: !37, line: 902, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !148, file: !47, line: 1091)
!148 = !DISubprogram(name: "erfl", scope: !37, file: !37, line: 903, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !150, file: !47, line: 1093)
!150 = !DISubprogram(name: "erfc", scope: !37, file: !37, line: 906, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !152, file: !47, line: 1094)
!152 = !DISubprogram(name: "erfcf", scope: !37, file: !37, line: 907, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !154, file: !47, line: 1095)
!154 = !DISubprogram(name: "erfcl", scope: !37, file: !37, line: 908, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !156, file: !47, line: 1097)
!156 = !DISubprogram(name: "exp2", scope: !37, file: !37, line: 728, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !158, file: !47, line: 1098)
!158 = !DISubprogram(name: "exp2f", scope: !37, file: !37, line: 729, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !160, file: !47, line: 1099)
!160 = !DISubprogram(name: "exp2l", scope: !37, file: !37, line: 730, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !162, file: !47, line: 1101)
!162 = !DISubprogram(name: "expm1", scope: !37, file: !37, line: 734, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !164, file: !47, line: 1102)
!164 = !DISubprogram(name: "expm1f", scope: !37, file: !37, line: 735, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !166, file: !47, line: 1103)
!166 = !DISubprogram(name: "expm1l", scope: !37, file: !37, line: 736, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !168, file: !47, line: 1105)
!168 = !DISubprogram(name: "fdim", scope: !37, file: !37, line: 1109, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !170, file: !47, line: 1106)
!170 = !DISubprogram(name: "fdimf", scope: !37, file: !37, line: 1110, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !172, file: !47, line: 1107)
!172 = !DISubprogram(name: "fdiml", scope: !37, file: !37, line: 1111, type: !141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !174, file: !47, line: 1109)
!174 = !DISubprogram(name: "fma", scope: !37, file: !37, line: 1130, type: !175, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DISubroutineType(types: !176)
!176 = !{!46, !46, !46, !46}
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !178, file: !47, line: 1110)
!178 = !DISubprogram(name: "fmaf", scope: !37, file: !37, line: 1131, type: !179, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DISubroutineType(types: !180)
!180 = !{!28, !28, !28, !28}
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !182, file: !47, line: 1111)
!182 = !DISubprogram(name: "fmal", scope: !37, file: !37, line: 1132, type: !183, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DISubroutineType(types: !184)
!184 = !{!114, !114, !114, !114}
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !186, file: !47, line: 1113)
!186 = !DISubprogram(name: "fmax", scope: !37, file: !37, line: 1119, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !188, file: !47, line: 1114)
!188 = !DISubprogram(name: "fmaxf", scope: !37, file: !37, line: 1120, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !190, file: !47, line: 1115)
!190 = !DISubprogram(name: "fmaxl", scope: !37, file: !37, line: 1121, type: !141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !192, file: !47, line: 1117)
!192 = !DISubprogram(name: "fmin", scope: !37, file: !37, line: 1124, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !194, file: !47, line: 1118)
!194 = !DISubprogram(name: "fminf", scope: !37, file: !37, line: 1125, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !196, file: !47, line: 1119)
!196 = !DISubprogram(name: "fminl", scope: !37, file: !37, line: 1126, type: !141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !198, file: !47, line: 1121)
!198 = !DISubprogram(name: "hypot", scope: !37, file: !37, line: 882, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !200, file: !47, line: 1122)
!200 = !DISubprogram(name: "hypotf", scope: !37, file: !37, line: 883, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !202, file: !47, line: 1123)
!202 = !DISubprogram(name: "hypotl", scope: !37, file: !37, line: 887, type: !141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !204, file: !47, line: 1125)
!204 = !DISubprogram(name: "ilogb", scope: !37, file: !37, line: 748, type: !205, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DISubroutineType(types: !206)
!206 = !{!40, !46}
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !208, file: !47, line: 1126)
!208 = !DISubprogram(name: "ilogbf", scope: !37, file: !37, line: 749, type: !209, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DISubroutineType(types: !210)
!210 = !{!40, !28}
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !212, file: !47, line: 1127)
!212 = !DISubprogram(name: "ilogbl", scope: !37, file: !37, line: 750, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DISubroutineType(types: !214)
!214 = !{!40, !114}
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !216, file: !47, line: 1129)
!216 = !DISubprogram(name: "lgamma", scope: !37, file: !37, line: 911, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !218, file: !47, line: 1130)
!218 = !DISubprogram(name: "lgammaf", scope: !37, file: !37, line: 912, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !220, file: !47, line: 1131)
!220 = !DISubprogram(name: "lgammal", scope: !37, file: !37, line: 913, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !222, file: !47, line: 1134)
!222 = !DISubprogram(name: "llrint", scope: !37, file: !37, line: 946, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DISubroutineType(types: !224)
!224 = !{!225, !46}
!225 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !227, file: !47, line: 1135)
!227 = !DISubprogram(name: "llrintf", scope: !37, file: !37, line: 947, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DISubroutineType(types: !229)
!229 = !{!225, !28}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !231, file: !47, line: 1136)
!231 = !DISubprogram(name: "llrintl", scope: !37, file: !37, line: 948, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DISubroutineType(types: !233)
!233 = !{!225, !114}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !235, file: !47, line: 1138)
!235 = !DISubprogram(name: "llround", scope: !37, file: !37, line: 1038, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !237, file: !47, line: 1139)
!237 = !DISubprogram(name: "llroundf", scope: !37, file: !37, line: 1039, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !239, file: !47, line: 1140)
!239 = !DISubprogram(name: "llroundl", scope: !37, file: !37, line: 1040, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !241, file: !47, line: 1143)
!241 = !DISubprogram(name: "log1p", scope: !37, file: !37, line: 768, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !243, file: !47, line: 1144)
!243 = !DISubprogram(name: "log1pf", scope: !37, file: !37, line: 769, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !245, file: !47, line: 1145)
!245 = !DISubprogram(name: "log1pl", scope: !37, file: !37, line: 770, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !247, file: !47, line: 1147)
!247 = !DISubprogram(name: "log2", scope: !37, file: !37, line: 773, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !249, file: !47, line: 1148)
!249 = !DISubprogram(name: "log2f", scope: !37, file: !37, line: 774, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !251, file: !47, line: 1149)
!251 = !DISubprogram(name: "log2l", scope: !37, file: !37, line: 775, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !253, file: !47, line: 1151)
!253 = !DISubprogram(name: "logb", scope: !37, file: !37, line: 778, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !255, file: !47, line: 1152)
!255 = !DISubprogram(name: "logbf", scope: !37, file: !37, line: 779, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !257, file: !47, line: 1153)
!257 = !DISubprogram(name: "logbl", scope: !37, file: !37, line: 780, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !259, file: !47, line: 1155)
!259 = !DISubprogram(name: "lrint", scope: !37, file: !37, line: 942, type: !260, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DISubroutineType(types: !261)
!261 = !{!262, !46}
!262 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !264, file: !47, line: 1156)
!264 = !DISubprogram(name: "lrintf", scope: !37, file: !37, line: 943, type: !265, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DISubroutineType(types: !266)
!266 = !{!262, !28}
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !268, file: !47, line: 1157)
!268 = !DISubprogram(name: "lrintl", scope: !37, file: !37, line: 944, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DISubroutineType(types: !270)
!270 = !{!262, !114}
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !272, file: !47, line: 1159)
!272 = !DISubprogram(name: "lround", scope: !37, file: !37, line: 1035, type: !260, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !274, file: !47, line: 1160)
!274 = !DISubprogram(name: "lroundf", scope: !37, file: !37, line: 1036, type: !265, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !276, file: !47, line: 1161)
!276 = !DISubprogram(name: "lroundl", scope: !37, file: !37, line: 1037, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !278, file: !47, line: 1163)
!278 = !DISubprogram(name: "nan", scope: !37, file: !37, line: 1087, type: !279, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!279 = !DISubroutineType(types: !280)
!280 = !{!46, !281}
!281 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !282, size: 64)
!282 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !283)
!283 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !285, file: !47, line: 1164)
!285 = !DISubprogram(name: "nanf", scope: !37, file: !37, line: 1088, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!28, !281}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !289, file: !47, line: 1165)
!289 = !DISubprogram(name: "nanl", scope: !37, file: !37, line: 1089, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DISubroutineType(types: !291)
!291 = !{!114, !281}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !293, file: !47, line: 1167)
!293 = !DISubprogram(name: "nearbyint", scope: !37, file: !37, line: 931, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !295, file: !47, line: 1168)
!295 = !DISubprogram(name: "nearbyintf", scope: !37, file: !37, line: 932, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !297, file: !47, line: 1169)
!297 = !DISubprogram(name: "nearbyintl", scope: !37, file: !37, line: 933, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !299, file: !47, line: 1171)
!299 = !DISubprogram(name: "nextafter", scope: !37, file: !37, line: 1098, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !301, file: !47, line: 1172)
!301 = !DISubprogram(name: "nextafterf", scope: !37, file: !37, line: 1099, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !303, file: !47, line: 1173)
!303 = !DISubprogram(name: "nextafterl", scope: !37, file: !37, line: 1100, type: !141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !305, file: !47, line: 1175)
!305 = !DISubprogram(name: "nexttoward", scope: !37, file: !37, line: 1103, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DISubroutineType(types: !307)
!307 = !{!46, !46, !114}
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !309, file: !47, line: 1176)
!309 = !DISubprogram(name: "nexttowardf", scope: !37, file: !37, line: 1104, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!310 = !DISubroutineType(types: !311)
!311 = !{!28, !28, !114}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !313, file: !47, line: 1177)
!313 = !DISubprogram(name: "nexttowardl", scope: !37, file: !37, line: 1105, type: !141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !315, file: !47, line: 1179)
!315 = !DISubprogram(name: "remainder", scope: !37, file: !37, line: 1053, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !317, file: !47, line: 1180)
!317 = !DISubprogram(name: "remainderf", scope: !37, file: !37, line: 1054, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !319, file: !47, line: 1181)
!319 = !DISubprogram(name: "remainderl", scope: !37, file: !37, line: 1055, type: !141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !321, file: !47, line: 1183)
!321 = !DISubprogram(name: "remquo", scope: !37, file: !37, line: 1058, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{!46, !46, !46, !74}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !325, file: !47, line: 1184)
!325 = !DISubprogram(name: "remquof", scope: !37, file: !37, line: 1059, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!28, !28, !28, !74}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !329, file: !47, line: 1185)
!329 = !DISubprogram(name: "remquol", scope: !37, file: !37, line: 1060, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{!114, !114, !114, !74}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !333, file: !47, line: 1187)
!333 = !DISubprogram(name: "rint", scope: !37, file: !37, line: 937, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !335, file: !47, line: 1188)
!335 = !DISubprogram(name: "rintf", scope: !37, file: !37, line: 938, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !337, file: !47, line: 1189)
!337 = !DISubprogram(name: "rintl", scope: !37, file: !37, line: 939, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !339, file: !47, line: 1191)
!339 = !DISubprogram(name: "round", scope: !37, file: !37, line: 1030, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !341, file: !47, line: 1192)
!341 = !DISubprogram(name: "roundf", scope: !37, file: !37, line: 1031, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !343, file: !47, line: 1193)
!343 = !DISubprogram(name: "roundl", scope: !37, file: !37, line: 1032, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !345, file: !47, line: 1195)
!345 = !DISubprogram(name: "scalbln", scope: !37, file: !37, line: 871, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DISubroutineType(types: !347)
!347 = !{!46, !46, !262}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !349, file: !47, line: 1196)
!349 = !DISubprogram(name: "scalblnf", scope: !37, file: !37, line: 872, type: !350, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DISubroutineType(types: !351)
!351 = !{!28, !28, !262}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !353, file: !47, line: 1197)
!353 = !DISubprogram(name: "scalblnl", scope: !37, file: !37, line: 873, type: !354, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DISubroutineType(types: !355)
!355 = !{!114, !114, !262}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !357, file: !47, line: 1199)
!357 = !DISubprogram(name: "scalbn", scope: !37, file: !37, line: 867, type: !77, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !359, file: !47, line: 1200)
!359 = !DISubprogram(name: "scalbnf", scope: !37, file: !37, line: 868, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{!28, !28, !40}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !363, file: !47, line: 1201)
!363 = !DISubprogram(name: "scalbnl", scope: !37, file: !37, line: 869, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!114, !114, !40}
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !367, file: !47, line: 1203)
!367 = !DISubprogram(name: "tgamma", scope: !37, file: !37, line: 918, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !369, file: !47, line: 1204)
!369 = !DISubprogram(name: "tgammaf", scope: !37, file: !37, line: 919, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !371, file: !47, line: 1205)
!371 = !DISubprogram(name: "tgammal", scope: !37, file: !37, line: 920, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !373, file: !47, line: 1207)
!373 = !DISubprogram(name: "trunc", scope: !37, file: !37, line: 1044, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !375, file: !47, line: 1208)
!375 = !DISubprogram(name: "truncf", scope: !37, file: !37, line: 1045, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !377, file: !47, line: 1209)
!377 = !DISubprogram(name: "truncl", scope: !37, file: !37, line: 1046, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !379, file: !383, line: 38)
!379 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !35, file: !41, line: 84, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!382, !382}
!382 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!383 = !DIFile(filename: "C:/Xilinx/Vitis_HLS/2023.2/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cmath.h", directory: "C:\5COneDrive\5CDesktop\5CViT")
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !385, file: !383, line: 54)
!385 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !35, file: !47, line: 380, type: !386, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!386 = !DISubroutineType(types: !387)
!387 = !{!114, !114, !388}
!388 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!389 = !DILocation(line: 13, column: 9, scope: !22)
