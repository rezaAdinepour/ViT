#include "bit_linear.h"


void bit_linear(float input[ROWS][COLS], float weight[COLS][OUT_ROWS], float output[ROWS][OUT_ROWS])
{
	#pragma HLS ARRAY_PARTITION variable=input dim=2
	#pragma HLS ARRAY_PARTITION variable=weight dim=2
	#pragma HLS ARRAY_PARTITION variable=output dim=2


	float input_quant[ROWS][COLS];
	float weight_quantized[COLS][OUT_ROWS];

	#pragma HLS PIPELINE II=3

    activation_quant(input, input_quant);
    weight_quant(weight, weight_quantized);
    matrix_multiply(input_quant, weight_quantized, output);
}
