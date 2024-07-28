#include <stdio.h>
#include <math.h>
#include <iostream>

#define ROWS 2
#define COLS 4
#define OUT_ROWS 2
#define MIN_CLAMP 1e-5



float find_max_abs(float arr[], int length)
{
    float max_val = 0.0f;
    for (int i = 0; i < length; ++i)
    {
        float abs_val = fabsf(arr[i]);
        if (abs_val > max_val)
            max_val = abs_val;
    }
    return max_val;
}

float abs_mean(float array[COLS][OUT_ROWS])
{
    float sum = 0.0f;
    for (int i = 0; i < COLS; i++)
    {
        for (int j = 0; j < OUT_ROWS; j++)
            sum += fabs(array[i][j]);
    }
    return sum / (COLS * OUT_ROWS);
}

float clamp(float value, float min)
{
    return value < min ? min : value;
}

void activation_quant(float input[ROWS][COLS], float output[ROWS][COLS])
{
    for (int i = 0; i < ROWS; ++i)
    {
        float max_val = find_max_abs(input[i], COLS);
        float scale = 127.0f / clamp(max_val, MIN_CLAMP);

        for (int j = 0; j < COLS; ++j)
        {
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

    for (int i = 0; i < COLS; i++)
    {
        for (int j = 0; j < OUT_ROWS; j++)
        {
            float scaled = round(input[i][j] * scale);
            scaled = scaled > 1 ? 1 : (scaled < -1 ? -1 : scaled);
            output[i][j] = scaled / scale;
        }
    }
}

void matrix_multiply(float a[ROWS][COLS], float b[COLS][OUT_ROWS], float result[ROWS][OUT_ROWS])
{
    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < OUT_ROWS; j++)
        {
            result[i][j] = 0;
            for (int k = 0; k < COLS; k++)
                result[i][j] += a[i][k] * b[k][j];
        }
    }
}

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



void bit_linear(float input[ROWS][COLS], float weight[COLS][OUT_ROWS], float output[ROWS][OUT_ROWS])
{
    float input_quant[ROWS][COLS];
    float weight_quantized[COLS][OUT_ROWS];

    activation_quant(input, input_quant);
    weight_quant(weight, weight_quantized);

    matrix_multiply(input_quant, weight_quantized, output);

    printf("Quantized Input:\n");
    print_matrix(input_quant);
    std::cout << std::endl;

    printf("Quantized Weights:\n");
    print_matrix_weight(weight_quantized);
    std::cout << std::endl;
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