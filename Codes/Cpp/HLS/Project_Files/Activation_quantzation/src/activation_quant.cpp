#include <math.h>
#include "activation_quant.h"







void activation_quant(float input[ROWS][COLS], float output[ROWS][COLS])
{
	#pragma HLS ARRAY_PARTITION variable=input complete dim=2
	#pragma HLS ARRAY_PARTITION variable=output complete dim=2
	#pragma HLS PIPELINE II=2

    for (int i = 0; i < ROWS; ++i)
    {
		#pragma HLS UNROLL

        float max_val = find_max_abs(input[i], COLS);
        float scale = 127.0f / clamp(max_val, MIN_CLAMP);

        for (int j = 0; j < COLS; ++j)
        {
			#pragma HLS UNROLL

            float scaled_val = input[i][j] * scale;
            float rounded_val = roundf(scaled_val);
            float clamped_val = fminf(fmaxf(rounded_val, -128.0f), 127.0f);
            output[i][j] = clamped_val / scale;
        }
    }
}
