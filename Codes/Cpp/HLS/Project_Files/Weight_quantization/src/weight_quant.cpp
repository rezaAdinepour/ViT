#include <math.h>
#include "weight_quant.h"



void weight_quant(float input[ROWS][COLS], float output[ROWS][COLS])
{
	#pragma HLS ARRAY_PARTITION variable=input complete dim=2
	#pragma HLS ARRAY_PARTITION variable=output complete dim=2
	#pragma HLS PIPELINE II=2

    float mean = abs_mean(input);
    float scale = 1.0 / clamp(mean, MIN_CLAMP);

    for (int i = 0; i < ROWS; i++)
    {
		#pragma HLS UNROLL
        for (int j = 0; j < COLS; j++)
        {
			#pragma HLS UNROLL
            float scaled = round(input[i][j] * scale);
            scaled = scaled > 1 ? 1 : (scaled < -1 ? -1 : scaled);
            output[i][j] = scaled / scale;
        }
    }
}
