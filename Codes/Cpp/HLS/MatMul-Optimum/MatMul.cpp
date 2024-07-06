#define N 2

void MatMul(int A[N][N], int B[N][N], int y[N][N])
{

	#pragma HLS ARRAY_PARTITION variable=A dim=2
	#pragma HLS ARRAY_PARTITION variable=B dim=2
	#pragma HLS ARRAY_PARTITION variable=y dim=2

	for(int i = 0; i < N; i++)
	{
		for(int j = 0; j < N; j++)
		{
			int acc = 0;
			for(int k = 0; k < N; k++)
			{
				#pragma HLS UNROLL
				acc += A[i][k] * B[k][j];
			}
			y[i][j] = acc;
		}
	}
}
