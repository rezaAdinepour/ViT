#include <stdio.h>
#include <iostream>
#include "tb_bit_linear.h"





void print_matrix(float matrix[ROWS][COLS])
{
    for (int i = 0; i < ROWS; ++i)
    {
        for (int j = 0; j < COLS; ++j)
            printf("%.4f ", matrix[i][j]);
        printf("\n");
    }
}

void print_matrix_out(float matrix[ROWS][OUT_ROWS])
{
    for (int i = 0; i < ROWS; ++i)
    {
        for (int j = 0; j < OUT_ROWS; ++j)
            printf("%.4f ", matrix[i][j]);
        printf("\n");
    }
}

void print_matrix_weight(float matrix[COLS][OUT_ROWS])
{
    for (int i = 0; i < COLS; ++i)
    {
        for (int j = 0; j < OUT_ROWS; ++j)
            printf("%.4f ", matrix[i][j]);
        printf("\n");
    }
}






int main()
{
    float input[ROWS][COLS] = { {1.0, -1.0, 2.0, -2.0},
                                {0.5, -0.5, 1.0, -1.0} };

    float weight[COLS][OUT_ROWS] = { {0.2, 0.8},
                                     {0.5, -0.1},
                                     {-0.3, 0.4},
                                     {0.1, -0.5} };
    float output[ROWS][OUT_ROWS];

    printf("Input Tensor:\n");
    print_matrix(input);
    std::cout << std::endl;


    bit_linear(input, weight, output);


    printf("Initial weight:\n");
    print_matrix_weight(weight);
    std::cout << std::endl;


    printf("Output Tensor:\n");
    print_matrix_out(output);
    std::cout << std::endl;

    return 0;
}
