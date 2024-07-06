#include <stdio.h>

#define ROW_A 2
#define COL_A 2
#define ROW_B 2
#define COL_B 2

void matMul(int A[ROW_A][COL_A], int B[ROW_B][COL_B], int C[ROW_A][COL_B]) 
{
    if (COL_A != ROW_B) 
    {
        printf("Matrix multiplication not possible\n");
        return;
    }

    for (int i = 0; i < ROW_A; i++) 
    {
        for (int j = 0; j < COL_B; j++) 
        {
            C[i][j] = 0;
        }
    }

    for (int i = 0; i < ROW_A; i++) 
    {
        for (int j = 0; j < COL_B; j++) 
        {
            int acc = 0;
            for (int k = 0; k < COL_A; k++) 
            {
                acc += A[i][k] * B[k][j];
            }
            C[i][j] = acc;
        }
    }
}

int main() 
{
    int A[ROW_A][COL_A] = { {1, 2}, {3, 4} };
    int B[ROW_B][COL_B] = { {5, 6}, {7, 8} };
    int C[ROW_A][COL_B];

    matMul(A, B, C);

    printf("Result matrix C:\n");
    for (int i = 0; i < ROW_A; i++) 
    {
        for (int j = 0; j < COL_B; j++) 
        {
            printf("%d ", C[i][j]);
        }
        printf("\n");
    }

    return 0;
}
