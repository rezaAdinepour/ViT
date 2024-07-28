#include <math.h>
#include "ap_int.h"


#define ROWS 2
#define COLS 4
#define OUT_ROWS 2
#define MIN_CLAMP 1e-5




float find_max_abs(float arr[], int length)
{
    float max_val = 0.0f;
	#pragma HLS PIPELINE II=1
    for (int i = 0; i < length; ++i)
    {
		#pragma HLS UNROLL

        float abs_val = fabsf(arr[i]);
        if (abs_val > max_val)
            max_val = abs_val;
    }
    return max_val;
}


float abs_mean(float array[COLS][OUT_ROWS])
{
    float sum = 0.0f;
	#pragma HLS PIPELINE II=1
    for (int i = 0; i < COLS; i++)
    {
		#pragma HLS UNROLL
        for (int j = 0; j < OUT_ROWS; j++)
        {
			#pragma HLS UNROLL
        	sum += fabs(array[i][j]);
        }
    }
    return sum / (COLS * OUT_ROWS);
}

float clamp(float value, float min)
{
    return value < min ? min : value;
}

void activation_quant(float input[ROWS][COLS], float output[ROWS][COLS])
{
	#pragma HLS PIPELINE II=1
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

void weight_quant(float input[COLS][OUT_ROWS], float output[COLS][OUT_ROWS])
{
    float mean = abs_mean(input);
    float scale = 1.0 / clamp(mean, MIN_CLAMP);

	#pragma HLS PIPELINE II=1
    for (int i = 0; i < COLS; i++)
    {
		#pragma HLS UNROLL
        for (int j = 0; j < OUT_ROWS; j++)
        {
			#pragma HLS UNROLL

            float scaled = round(input[i][j] * scale);
            scaled = scaled > 1 ? 1 : (scaled < -1 ? -1 : scaled);
            output[i][j] = scaled / scale;
        }
    }
}

void matrix_multiply(float a[ROWS][COLS], float b[COLS][OUT_ROWS], float result[ROWS][OUT_ROWS])
{
	#pragma HLS PIPELINE II=1
    for (int i = 0; i < ROWS; i++)
    {
		#pragma HLS UNROLL
        for (int j = 0; j < OUT_ROWS; j++)
        {
			#pragma HLS UNROLL

            result[i][j] = 0;
            for (int k = 0; k < COLS; k++)
            {
				#pragma HLS UNROLL
            	result[i][j] += a[i][k] * b[k][j];
            }
        }
    }
}
