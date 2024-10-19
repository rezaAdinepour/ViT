#ifndef __TB_ACTIVATION_QUANT_H__
#define __TB_ACTIVATION_QUANT_H__


#define ROWS 3
#define COLS 3
#define MIN_CLAMP 1e-5


void activation_quant(float input[ROWS][COLS], float output[ROWS][COLS]);


#endif //__TB_ACTIVATION_QUANT_H__
