
// matmul.h

#include <stdio.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <ap_fixed.h>

#define MATSIZE 3			// Matrix size

typedef float Mat_Dtype;

// define the axis data structure
//typedef ap_axiu<32, 1, 1, 1> axis_data;
typedef ap_axiu<32, 0, 0, 0> axis_data;

void matmul_1(hls::stream<axis_data> &in_A, hls::stream<axis_data> &out_C);
