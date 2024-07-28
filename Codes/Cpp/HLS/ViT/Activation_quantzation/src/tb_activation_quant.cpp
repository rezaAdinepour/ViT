#include "tb_activation_quant.h"
#include <stdio.h>
#include <iostream>



void print_matrix(float matrix[ROWS][COLS])
{
    for (int i = 0; i < ROWS; ++i)
    {
        for (int j = 0; j < COLS; ++j)
            printf("%.4f ", matrix[i][j]);
        printf("\n");
    }
}


int main()
{
	float a[ROWS][COLS] = {
	        {0.8823, 0.9150, 0.3829},
	        {0.9593, 0.3904, 0.6009},
	        {0.2566, 0.7936, 0.9408}
	    };

	float a_act_quant[ROWS][COLS];
	activation_quant(a, a_act_quant);

	std::cout << std::endl;
	std::cout << "Input matrix: " << std::endl;
	print_matrix(a);

	std::cout << std::endl;

	std::cout << "activation quant matrix: " << std::endl;
	print_matrix(a_act_quant);
	std::cout << std::endl;
}
