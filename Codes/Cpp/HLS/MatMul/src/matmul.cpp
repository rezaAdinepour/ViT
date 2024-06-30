#include "matmul.h"
#include "hls_print.h"

void matmul_1(hls::stream<axis_data> &in_A, hls::stream<axis_data> &out_C)
{
	#pragma HLS INTERFACE mode=axis register_mode=both port=in_A register
	#pragma HLS INTERFACE mode=axis register_mode=both port=out_C  register
	#pragma HLS INTERFACE mode=ap_ctrl_none port=return

	Mat_Dtype input_A[MATSIZE][MATSIZE];
	Mat_Dtype input_B[MATSIZE][MATSIZE];
	Mat_Dtype output_C[MATSIZE][MATSIZE];

	int row, col, index;
	Mat_Dtype res;
	axis_data local_stream;

	union converter {
		float fpval;
		unsigned int intval;
	} converter;

	// saving streaming data to respective variables
	loop_input_A1: for(row=0; row<MATSIZE; row++)
	{
		loop_input_A2: for(col=0; col<MATSIZE; col++)
		{
			local_stream = in_A.read();
			converter.intval = local_stream.data;
			input_A[row][col] = (float) converter.fpval;
			printf("%f\n", input_A[row][col]);
		}
	}
	printf("------------------\n");

	loop_input_B1: for(row=0; row<MATSIZE; row++)
	{
		loop_input_B2: for(col=0; col<MATSIZE; col++)
		{
			local_stream = in_A.read();
			converter.intval = local_stream.data;
			input_B[row][col] = (float) converter.fpval;
			printf("%f\n", input_B[row][col]);
		}
	}
	printf("------------------\n");

	// MATRIX MULTIPLICATION
	loop1: for(row=0; row<MATSIZE; row++)
		loop2: for(col=0; col<MATSIZE; col++)
		{
			res = 0;
			loop3: for(index=0; index<MATSIZE; index++)
				res += input_A[row][index]*input_B[index][col];

			output_C[row][col] = res;
			printf("%f\n", output_C[row][col]);
		}

	// stream output data back
	loop_output_C1: for(row=0; row<MATSIZE; row++)
		loop_output_C2: for(col=0; col<MATSIZE; col++)
		{
			local_stream.data = output_C[row][col];
			converter.fpval = output_C[row][col];
			local_stream.data = converter.intval;

			// generating the last signal and strobe signal
			if((row==MATSIZE-1) && (col==MATSIZE-1))
				local_stream.last = 1;
			else
				local_stream.last = 0;

			out_C.write(local_stream);
		}

}
//
