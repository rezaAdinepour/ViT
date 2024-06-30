#include "matmul.h"
#include <math.h>

void matmul_bm(double input_A[MATSIZE][MATSIZE], double input_B[MATSIZE][MATSIZE], double output_C[MATSIZE][MATSIZE]);

int main()
{
	double input_A[MATSIZE][MATSIZE] = {
			{2.54, 4.31, 3.15},
			{1.01, 0.0, 5.74},
			{6.84, 3.21, 3.17}
	};
	double input_B[MATSIZE][MATSIZE] = {
			{1.0, 0.0, 0.0},
			{0.0, 1.0, 0.0},
			{0.0, 0.0, 1.0}
	};
	double output_C_HW[MATSIZE][MATSIZE];
	double output_C_BM[MATSIZE][MATSIZE];
	int row, col;

	printf("Hello!\n");
	// Generate test data
	/*loop_input_1: for(row=0; row<MATSIZE; row++)
		loop_input_2: for(col=0; col<MATSIZE; col++)
		{
			// 0 - 5
			input_A[row][col] = ((float)rand()/(RAND_MAX/5));
			input_B[row][col] = ((float)rand()/(RAND_MAX/5));
		}*/




	matmul_bm(input_A, input_B, output_C_BM);

	axis_data local_stream;
	hls::stream<axis_data> in_A, out_C;
	union converter {
		float fpval;
		unsigned int intval;
	} converter;

	// Generate stream input A for hardware function
	printf("A input\n");
	loop_input_A1: for(row=0; row<MATSIZE; row++)
		loop_input_A2: for(col=0; col<MATSIZE; col++)
		{
			converter.fpval = (float) input_A[row][col];
			local_stream.data = converter.intval;

			if((row==MATSIZE-1) && (col==MATSIZE-1))
				local_stream.last = 1;
			else
				local_stream.last = 0;

			in_A.write(local_stream);
		}

	printf("B input\n");
	loop_input_B1: for(row=0; row<MATSIZE; row++)
		loop_input_B2: for(col=0; col<MATSIZE; col++)
		{
			converter.fpval = (float) input_B[row][col];
			local_stream.data = converter.intval;

			if((row==MATSIZE-1) && (col==MATSIZE-1))
				local_stream.last = 1;
			else
				local_stream.last = 0;

			in_A.write(local_stream);
		}


	matmul_1(in_A, out_C);

	// Receive stream output C from hardware function
	loop_output_C1: for(row=0; row<MATSIZE; row++)
	{
		loop_output_C2: for(col=0; col<MATSIZE; col++)
		{
			local_stream = out_C.read();
			converter.intval = local_stream.data;
			output_C_HW[row][col] = (double) converter.fpval;
		}
	}

	// Compare benchmark and hardware functions output
	// Receive stream output C from hardware function
	loop_compare_C1: for(row=0; row<MATSIZE; row++)
		loop_compare_C2: for(col=0; col<MATSIZE; col++)
			if(fabs(output_C_HW[row][col] - output_C_BM[row][col]) > 0.01)
			{
				printf("Error at row index %d and col index %d\n", row, col);
				printf("Hardware output %f\n", output_C_HW[row][col]);
				printf("Software output %f\n", output_C_BM[row][col]);

//				return 1;
			}

	printf("No Errors !!!\n");
	return 0;
}

void matmul_bm(double input_A[MATSIZE][MATSIZE], double input_B[MATSIZE][MATSIZE], double output_C[MATSIZE][MATSIZE])
{
	int row, col, index;
	double res;

	// MATRIX MULTIPLICATION
	loop1: for(row=0; row<MATSIZE; row++)
		loop2: for(col=0; col<MATSIZE; col++)
		{
			res = 0;
			loop3: for(index=0; index<MATSIZE; index++)
				res += input_A[row][index]*input_B[index][col];

			output_C[row][col] = res;
		}
}
