#include <iostream>
#include "tb_MatMul.h"




void printMatrix(int matrix[N][N])
{
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

int main()
{
	int A[N][N] = { {1, 2}, {3, 4} };
	int B[N][N] = { {5, 6}, {7, 8} };
	int y[N][N];

    MatMul(A, B, y);

    printf("Result matrix y:\n");
    printMatrix(y);

    return 0;
}
