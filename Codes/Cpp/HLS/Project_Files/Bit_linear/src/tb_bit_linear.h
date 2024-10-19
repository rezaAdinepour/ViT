#ifndef __TB_BIT_LINEAR_H__
#define __TB_BIT_LINEAR_H__


#define ROWS 2
#define COLS 4
#define OUT_ROWS 2
#define MIN_CLAMP 1e-5


void bit_linear(float input[ROWS][COLS], float weight[COLS][OUT_ROWS], float output[ROWS][OUT_ROWS]);


#endif //__TB_BIT_LINEAR_H__
