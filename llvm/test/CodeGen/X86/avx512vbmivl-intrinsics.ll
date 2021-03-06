; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+avx512vbmi,+avx512vl --show-mc-encoding | FileCheck %s --check-prefixes=CHECK,X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512vbmi,+avx512vl --show-mc-encoding | FileCheck %s --check-prefixes=CHECK,X64

declare <16 x i8> @llvm.x86.avx512.permvar.qi.128(<16 x i8>, <16 x i8>)

define <16 x i8>@test_int_x86_avx512_mask_permvar_qi_128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 %x3) {
; X86-LABEL: test_int_x86_avx512_mask_permvar_qi_128:
; X86:       # %bb.0:
; X86-NEXT:    vpermb %xmm0, %xmm1, %xmm3 # encoding: [0x62,0xf2,0x75,0x08,0x8d,0xd8]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpermb %xmm0, %xmm1, %xmm2 {%k1} # encoding: [0x62,0xf2,0x75,0x09,0x8d,0xd0]
; X86-NEXT:    vpermb %xmm0, %xmm1, %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0x75,0x89,0x8d,0xc0]
; X86-NEXT:    vpaddb %xmm3, %xmm0, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0xfc,0xc3]
; X86-NEXT:    vpaddb %xmm0, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfc,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_permvar_qi_128:
; X64:       # %bb.0:
; X64-NEXT:    vpermb %xmm0, %xmm1, %xmm3 # encoding: [0x62,0xf2,0x75,0x08,0x8d,0xd8]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpermb %xmm0, %xmm1, %xmm2 {%k1} # encoding: [0x62,0xf2,0x75,0x09,0x8d,0xd0]
; X64-NEXT:    vpermb %xmm0, %xmm1, %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0x75,0x89,0x8d,0xc0]
; X64-NEXT:    vpaddb %xmm3, %xmm0, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0xfc,0xc3]
; X64-NEXT:    vpaddb %xmm0, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfc,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <16 x i8> @llvm.x86.avx512.permvar.qi.128(<16 x i8> %x0, <16 x i8> %x1)
  %2 = bitcast i16 %x3 to <16 x i1>
  %3 = select <16 x i1> %2, <16 x i8> %1, <16 x i8> %x2
  %4 = call <16 x i8> @llvm.x86.avx512.permvar.qi.128(<16 x i8> %x0, <16 x i8> %x1)
  %5 = bitcast i16 %x3 to <16 x i1>
  %6 = select <16 x i1> %5, <16 x i8> %4, <16 x i8> zeroinitializer
  %7 = call <16 x i8> @llvm.x86.avx512.permvar.qi.128(<16 x i8> %x0, <16 x i8> %x1)
  %res3 = add <16 x i8> %3, %6
  %res4 = add <16 x i8> %res3, %7
  ret <16 x i8> %res4
}

declare <32 x i8> @llvm.x86.avx512.permvar.qi.256(<32 x i8>, <32 x i8>)

define <32 x i8>@test_int_x86_avx512_mask_permvar_qi_256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 %x3) {
; X86-LABEL: test_int_x86_avx512_mask_permvar_qi_256:
; X86:       # %bb.0:
; X86-NEXT:    vpermb %ymm0, %ymm1, %ymm3 # encoding: [0x62,0xf2,0x75,0x28,0x8d,0xd8]
; X86-NEXT:    kmovd {{[0-9]+}}(%esp), %k1 # encoding: [0xc4,0xe1,0xf9,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpermb %ymm0, %ymm1, %ymm2 {%k1} # encoding: [0x62,0xf2,0x75,0x29,0x8d,0xd0]
; X86-NEXT:    vpermb %ymm0, %ymm1, %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0x75,0xa9,0x8d,0xc0]
; X86-NEXT:    vpaddb %ymm3, %ymm0, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0xfc,0xc3]
; X86-NEXT:    vpaddb %ymm0, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfc,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_permvar_qi_256:
; X64:       # %bb.0:
; X64-NEXT:    vpermb %ymm0, %ymm1, %ymm3 # encoding: [0x62,0xf2,0x75,0x28,0x8d,0xd8]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpermb %ymm0, %ymm1, %ymm2 {%k1} # encoding: [0x62,0xf2,0x75,0x29,0x8d,0xd0]
; X64-NEXT:    vpermb %ymm0, %ymm1, %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0x75,0xa9,0x8d,0xc0]
; X64-NEXT:    vpaddb %ymm3, %ymm0, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0xfc,0xc3]
; X64-NEXT:    vpaddb %ymm0, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfc,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <32 x i8> @llvm.x86.avx512.permvar.qi.256(<32 x i8> %x0, <32 x i8> %x1)
  %2 = bitcast i32 %x3 to <32 x i1>
  %3 = select <32 x i1> %2, <32 x i8> %1, <32 x i8> %x2
  %4 = call <32 x i8> @llvm.x86.avx512.permvar.qi.256(<32 x i8> %x0, <32 x i8> %x1)
  %5 = bitcast i32 %x3 to <32 x i1>
  %6 = select <32 x i1> %5, <32 x i8> %4, <32 x i8> zeroinitializer
  %7 = call <32 x i8> @llvm.x86.avx512.permvar.qi.256(<32 x i8> %x0, <32 x i8> %x1)
  %res3 = add <32 x i8> %3, %6
  %res4 = add <32 x i8> %res3, %7
  ret <32 x i8> %res4
}

declare <16 x i8> @llvm.x86.avx512.pmultishift.qb.128(<16 x i8>, <16 x i8>)

define <16 x i8>@test_int_x86_avx512_mask_pmultishift_qb_128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 %x3) {
; X86-LABEL: test_int_x86_avx512_mask_pmultishift_qb_128:
; X86:       # %bb.0:
; X86-NEXT:    vpmultishiftqb %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf2,0xfd,0x08,0x83,0xd9]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpmultishiftqb %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x83,0xd1]
; X86-NEXT:    vpmultishiftqb %xmm1, %xmm0, %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0xfd,0x89,0x83,0xc1]
; X86-NEXT:    vpaddb %xmm3, %xmm0, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0xfc,0xc3]
; X86-NEXT:    vpaddb %xmm0, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfc,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_pmultishift_qb_128:
; X64:       # %bb.0:
; X64-NEXT:    vpmultishiftqb %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf2,0xfd,0x08,0x83,0xd9]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpmultishiftqb %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x83,0xd1]
; X64-NEXT:    vpmultishiftqb %xmm1, %xmm0, %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0xfd,0x89,0x83,0xc1]
; X64-NEXT:    vpaddb %xmm3, %xmm0, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0xfc,0xc3]
; X64-NEXT:    vpaddb %xmm0, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfc,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <16 x i8> @llvm.x86.avx512.pmultishift.qb.128(<16 x i8> %x0, <16 x i8> %x1)
  %2 = bitcast i16 %x3 to <16 x i1>
  %3 = select <16 x i1> %2, <16 x i8> %1, <16 x i8> %x2
  %4 = call <16 x i8> @llvm.x86.avx512.pmultishift.qb.128(<16 x i8> %x0, <16 x i8> %x1)
  %5 = bitcast i16 %x3 to <16 x i1>
  %6 = select <16 x i1> %5, <16 x i8> %4, <16 x i8> zeroinitializer
  %7 = call <16 x i8> @llvm.x86.avx512.pmultishift.qb.128(<16 x i8> %x0, <16 x i8> %x1)
  %res3 = add <16 x i8> %3, %6
  %res4 = add <16 x i8> %res3, %7
  ret <16 x i8> %res4
}

declare <32 x i8> @llvm.x86.avx512.pmultishift.qb.256(<32 x i8>, <32 x i8>)

define <32 x i8>@test_int_x86_avx512_mask_pmultishift_qb_256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 %x3) {
; X86-LABEL: test_int_x86_avx512_mask_pmultishift_qb_256:
; X86:       # %bb.0:
; X86-NEXT:    vpmultishiftqb %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf2,0xfd,0x28,0x83,0xd9]
; X86-NEXT:    kmovd {{[0-9]+}}(%esp), %k1 # encoding: [0xc4,0xe1,0xf9,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpmultishiftqb %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x83,0xd1]
; X86-NEXT:    vpmultishiftqb %ymm1, %ymm0, %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0xfd,0xa9,0x83,0xc1]
; X86-NEXT:    vpaddb %ymm3, %ymm0, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0xfc,0xc3]
; X86-NEXT:    vpaddb %ymm0, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfc,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_pmultishift_qb_256:
; X64:       # %bb.0:
; X64-NEXT:    vpmultishiftqb %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf2,0xfd,0x28,0x83,0xd9]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpmultishiftqb %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x83,0xd1]
; X64-NEXT:    vpmultishiftqb %ymm1, %ymm0, %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0xfd,0xa9,0x83,0xc1]
; X64-NEXT:    vpaddb %ymm3, %ymm0, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0xfc,0xc3]
; X64-NEXT:    vpaddb %ymm0, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfc,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <32 x i8> @llvm.x86.avx512.pmultishift.qb.256(<32 x i8> %x0, <32 x i8> %x1)
  %2 = bitcast i32 %x3 to <32 x i1>
  %3 = select <32 x i1> %2, <32 x i8> %1, <32 x i8> %x2
  %4 = call <32 x i8> @llvm.x86.avx512.pmultishift.qb.256(<32 x i8> %x0, <32 x i8> %x1)
  %5 = bitcast i32 %x3 to <32 x i1>
  %6 = select <32 x i1> %5, <32 x i8> %4, <32 x i8> zeroinitializer
  %7 = call <32 x i8> @llvm.x86.avx512.pmultishift.qb.256(<32 x i8> %x0, <32 x i8> %x1)
  %res3 = add <32 x i8> %3, %6
  %res4 = add <32 x i8> %res3, %7
  ret <32 x i8> %res4
}

declare <16 x i8> @llvm.x86.avx512.vpermi2var.qi.128(<16 x i8>, <16 x i8>, <16 x i8>)

define <16 x i8>@test_int_x86_avx512_mask_vpermi2var_qi_128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 %x3) {
; X86-LABEL: test_int_x86_avx512_mask_vpermi2var_qi_128:
; X86:       # %bb.0:
; X86-NEXT:    vmovdqa %xmm0, %xmm3 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0x6f,0xd8]
; X86-NEXT:    vpermt2b %xmm2, %xmm1, %xmm3 # encoding: [0x62,0xf2,0x75,0x08,0x7d,0xda]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpermi2b %xmm2, %xmm0, %xmm1 {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x75,0xca]
; X86-NEXT:    vpermt2b %xmm2, %xmm3, %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0x65,0x89,0x7d,0xc2]
; X86-NEXT:    vpaddb %xmm3, %xmm0, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0xfc,0xc3]
; X86-NEXT:    vpaddb %xmm0, %xmm1, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf1,0xfc,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpermi2var_qi_128:
; X64:       # %bb.0:
; X64-NEXT:    vmovdqa %xmm0, %xmm3 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0x6f,0xd8]
; X64-NEXT:    vpermt2b %xmm2, %xmm1, %xmm3 # encoding: [0x62,0xf2,0x75,0x08,0x7d,0xda]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpermi2b %xmm2, %xmm0, %xmm1 {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x75,0xca]
; X64-NEXT:    vpermt2b %xmm2, %xmm3, %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0x65,0x89,0x7d,0xc2]
; X64-NEXT:    vpaddb %xmm3, %xmm0, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0xfc,0xc3]
; X64-NEXT:    vpaddb %xmm0, %xmm1, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf1,0xfc,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <16 x i8> @llvm.x86.avx512.vpermi2var.qi.128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2)
  %2 = bitcast i16 %x3 to <16 x i1>
  %3 = select <16 x i1> %2, <16 x i8> %1, <16 x i8> %x1
  %4 = call <16 x i8> @llvm.x86.avx512.vpermi2var.qi.128(<16 x i8> %x0, <16 x i8> %1, <16 x i8> %x2)
  %5 = bitcast i16 %x3 to <16 x i1>
  %6 = select <16 x i1> %5, <16 x i8> %4, <16 x i8> zeroinitializer
  %7 = call <16 x i8> @llvm.x86.avx512.vpermi2var.qi.128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2)
  %res3 = add <16 x i8> %3, %6
  %res4 = add <16 x i8> %res3, %7
  ret <16 x i8> %res4
}

declare <32 x i8> @llvm.x86.avx512.vpermi2var.qi.256(<32 x i8>, <32 x i8>, <32 x i8>)

define <32 x i8>@test_int_x86_avx512_mask_vpermi2var_qi_256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 %x3) {
; X86-LABEL: test_int_x86_avx512_mask_vpermi2var_qi_256:
; X86:       # %bb.0:
; X86-NEXT:    vmovdqa %ymm0, %ymm3 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0x6f,0xd8]
; X86-NEXT:    vpermt2b %ymm2, %ymm1, %ymm3 # encoding: [0x62,0xf2,0x75,0x28,0x7d,0xda]
; X86-NEXT:    kmovd {{[0-9]+}}(%esp), %k1 # encoding: [0xc4,0xe1,0xf9,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpermi2b %ymm2, %ymm0, %ymm1 {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x75,0xca]
; X86-NEXT:    vpermt2b %ymm2, %ymm3, %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0x65,0xa9,0x7d,0xc2]
; X86-NEXT:    vpaddb %ymm3, %ymm0, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0xfc,0xc3]
; X86-NEXT:    vpaddb %ymm0, %ymm1, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xf5,0xfc,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpermi2var_qi_256:
; X64:       # %bb.0:
; X64-NEXT:    vmovdqa %ymm0, %ymm3 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0x6f,0xd8]
; X64-NEXT:    vpermt2b %ymm2, %ymm1, %ymm3 # encoding: [0x62,0xf2,0x75,0x28,0x7d,0xda]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpermi2b %ymm2, %ymm0, %ymm1 {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x75,0xca]
; X64-NEXT:    vpermt2b %ymm2, %ymm3, %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0x65,0xa9,0x7d,0xc2]
; X64-NEXT:    vpaddb %ymm3, %ymm0, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0xfc,0xc3]
; X64-NEXT:    vpaddb %ymm0, %ymm1, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xf5,0xfc,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <32 x i8> @llvm.x86.avx512.vpermi2var.qi.256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2)
  %2 = bitcast i32 %x3 to <32 x i1>
  %3 = select <32 x i1> %2, <32 x i8> %1, <32 x i8> %x1
  %4 = call <32 x i8> @llvm.x86.avx512.vpermi2var.qi.256(<32 x i8> %x0, <32 x i8> %1, <32 x i8> %x2)
  %5 = bitcast i32 %x3 to <32 x i1>
  %6 = select <32 x i1> %5, <32 x i8> %4, <32 x i8> zeroinitializer
  %7 = call <32 x i8> @llvm.x86.avx512.vpermi2var.qi.256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2)
  %res3 = add <32 x i8> %3, %6
  %res4 = add <32 x i8> %res3, %7
  ret <32 x i8> %res4
}

define <16 x i8>@test_int_x86_avx512_mask_vpermt2var_qi_128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 %x3) {
; X86-LABEL: test_int_x86_avx512_mask_vpermt2var_qi_128:
; X86:       # %bb.0:
; X86-NEXT:    vmovdqa %xmm1, %xmm3 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0x6f,0xd9]
; X86-NEXT:    vpermt2b %xmm2, %xmm0, %xmm3 # encoding: [0x62,0xf2,0x7d,0x08,0x7d,0xda]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpermt2b %xmm2, %xmm0, %xmm1 {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x7d,0xca]
; X86-NEXT:    vpxor %xmm4, %xmm4, %xmm4 # EVEX TO VEX Compression encoding: [0xc5,0xd9,0xef,0xe4]
; X86-NEXT:    vpermt2b %xmm2, %xmm0, %xmm4 {%k1} {z} # encoding: [0x62,0xf2,0x7d,0x89,0x7d,0xe2]
; X86-NEXT:    vpaddb %xmm3, %xmm4, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xd9,0xfc,0xc3]
; X86-NEXT:    vpaddb %xmm0, %xmm1, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf1,0xfc,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpermt2var_qi_128:
; X64:       # %bb.0:
; X64-NEXT:    vmovdqa %xmm1, %xmm3 # EVEX TO VEX Compression encoding: [0xc5,0xf9,0x6f,0xd9]
; X64-NEXT:    vpermt2b %xmm2, %xmm0, %xmm3 # encoding: [0x62,0xf2,0x7d,0x08,0x7d,0xda]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpermt2b %xmm2, %xmm0, %xmm1 {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x7d,0xca]
; X64-NEXT:    vpxor %xmm4, %xmm4, %xmm4 # EVEX TO VEX Compression encoding: [0xc5,0xd9,0xef,0xe4]
; X64-NEXT:    vpermt2b %xmm2, %xmm0, %xmm4 {%k1} {z} # encoding: [0x62,0xf2,0x7d,0x89,0x7d,0xe2]
; X64-NEXT:    vpaddb %xmm3, %xmm4, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xd9,0xfc,0xc3]
; X64-NEXT:    vpaddb %xmm0, %xmm1, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xf1,0xfc,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <16 x i8> @llvm.x86.avx512.vpermi2var.qi.128(<16 x i8> %x1, <16 x i8> %x0, <16 x i8> %x2)
  %2 = bitcast i16 %x3 to <16 x i1>
  %3 = select <16 x i1> %2, <16 x i8> %1, <16 x i8> %x1
  %4 = call <16 x i8> @llvm.x86.avx512.vpermi2var.qi.128(<16 x i8> zeroinitializer, <16 x i8> %x0, <16 x i8> %x2)
  %5 = bitcast i16 %x3 to <16 x i1>
  %6 = select <16 x i1> %5, <16 x i8> %4, <16 x i8> zeroinitializer
  %7 = call <16 x i8> @llvm.x86.avx512.vpermi2var.qi.128(<16 x i8> %x1, <16 x i8> %x0, <16 x i8> %x2)
  %res3 = add <16 x i8> %3, %6
  %res4 = add <16 x i8> %res3, %7
  ret <16 x i8> %res4
}

define <32 x i8>@test_int_x86_avx512_mask_vpermt2var_qi_256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 %x3) {
; X86-LABEL: test_int_x86_avx512_mask_vpermt2var_qi_256:
; X86:       # %bb.0:
; X86-NEXT:    vmovdqa %ymm1, %ymm3 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0x6f,0xd9]
; X86-NEXT:    vpermt2b %ymm2, %ymm0, %ymm3 # encoding: [0x62,0xf2,0x7d,0x28,0x7d,0xda]
; X86-NEXT:    kmovd {{[0-9]+}}(%esp), %k1 # encoding: [0xc4,0xe1,0xf9,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpermt2b %ymm2, %ymm0, %ymm1 {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x7d,0xca]
; X86-NEXT:    vpxor %xmm4, %xmm4, %xmm4 # EVEX TO VEX Compression encoding: [0xc5,0xd9,0xef,0xe4]
; X86-NEXT:    vpermt2b %ymm2, %ymm0, %ymm4 {%k1} {z} # encoding: [0x62,0xf2,0x7d,0xa9,0x7d,0xe2]
; X86-NEXT:    vpaddb %ymm3, %ymm4, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xdd,0xfc,0xc3]
; X86-NEXT:    vpaddb %ymm0, %ymm1, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xf5,0xfc,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpermt2var_qi_256:
; X64:       # %bb.0:
; X64-NEXT:    vmovdqa %ymm1, %ymm3 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0x6f,0xd9]
; X64-NEXT:    vpermt2b %ymm2, %ymm0, %ymm3 # encoding: [0x62,0xf2,0x7d,0x28,0x7d,0xda]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpermt2b %ymm2, %ymm0, %ymm1 {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x7d,0xca]
; X64-NEXT:    vpxor %xmm4, %xmm4, %xmm4 # EVEX TO VEX Compression encoding: [0xc5,0xd9,0xef,0xe4]
; X64-NEXT:    vpermt2b %ymm2, %ymm0, %ymm4 {%k1} {z} # encoding: [0x62,0xf2,0x7d,0xa9,0x7d,0xe2]
; X64-NEXT:    vpaddb %ymm3, %ymm4, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xdd,0xfc,0xc3]
; X64-NEXT:    vpaddb %ymm0, %ymm1, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xf5,0xfc,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <32 x i8> @llvm.x86.avx512.vpermi2var.qi.256(<32 x i8> %x1, <32 x i8> %x0, <32 x i8> %x2)
  %2 = bitcast i32 %x3 to <32 x i1>
  %3 = select <32 x i1> %2, <32 x i8> %1, <32 x i8> %x1
  %4 = call <32 x i8> @llvm.x86.avx512.vpermi2var.qi.256(<32 x i8> zeroinitializer, <32 x i8> %x0, <32 x i8> %x2)
  %5 = bitcast i32 %x3 to <32 x i1>
  %6 = select <32 x i1> %5, <32 x i8> %4, <32 x i8> zeroinitializer
  %7 = call <32 x i8> @llvm.x86.avx512.vpermi2var.qi.256(<32 x i8> %x1, <32 x i8> %x0, <32 x i8> %x2)
  %res3 = add <32 x i8> %3, %6
  %res4 = add <32 x i8> %res3, %7
  ret <32 x i8> %res4
}

define <16 x i8>@test_int_x86_avx512_maskz_vpermt2var_qi_128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 %x3) {
; X86-LABEL: test_int_x86_avx512_maskz_vpermt2var_qi_128:
; X86:       # %bb.0:
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpermi2b %xmm2, %xmm1, %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0x75,0x89,0x75,0xc2]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_maskz_vpermt2var_qi_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpermi2b %xmm2, %xmm1, %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0x75,0x89,0x75,0xc2]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <16 x i8> @llvm.x86.avx512.vpermi2var.qi.128(<16 x i8> %x1, <16 x i8> %x0, <16 x i8> %x2)
  %2 = bitcast i16 %x3 to <16 x i1>
  %3 = select <16 x i1> %2, <16 x i8> %1, <16 x i8> zeroinitializer
  ret <16 x i8> %3
}

define <32 x i8>@test_int_x86_avx512_maskz_vpermt2var_qi_256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 %x3) {
; X86-LABEL: test_int_x86_avx512_maskz_vpermt2var_qi_256:
; X86:       # %bb.0:
; X86-NEXT:    kmovd {{[0-9]+}}(%esp), %k1 # encoding: [0xc4,0xe1,0xf9,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpermi2b %ymm2, %ymm1, %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0x75,0xa9,0x75,0xc2]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_maskz_vpermt2var_qi_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpermi2b %ymm2, %ymm1, %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0x75,0xa9,0x75,0xc2]
; X64-NEXT:    retq # encoding: [0xc3]
  %1 = call <32 x i8> @llvm.x86.avx512.vpermi2var.qi.256(<32 x i8> %x1, <32 x i8> %x0, <32 x i8> %x2)
  %2 = bitcast i32 %x3 to <32 x i1>
  %3 = select <32 x i1> %2, <32 x i8> %1, <32 x i8> zeroinitializer
  ret <32 x i8> %3
}
