#include <stdio.h>
#include <math.h>


#define ROWS 3
#define COLS 3
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


float abs_mean(float array[ROWS][COLS])
{
    float sum = 0.0;
    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLS; j++)
            sum += fabs(array[i][j]);
    }
    return sum / (ROWS * COLS);
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



void weight_quant(float input[ROWS][COLS], float output[ROWS][COLS])
{
    float mean = abs_mean(input);
    float scale = 1.0 / clamp(mean, MIN_CLAMP);

    for (int i = 0; i < ROWS; i++) 
    {
        for (int j = 0; j < COLS; j++) 
        {
            float scaled = round(input[i][j] * scale);
            scaled = scaled > 1 ? 1 : (scaled < -1 ? -1 : scaled);
            output[i][j] = scaled / scale;
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

int main()
{
    float a[ROWS][COLS] = {
        {0.8823, 0.9150, 0.3829},
        {0.9593, 0.3904, 0.6009},
        {0.2566, 0.7936, 0.9408}
    };

    // float a[ROWS][COLS] = {
    //     {0.8823, 0.9150, 0.3829},
    //     {0.9593, 0.3904, 0.6009},
    //     {0.2566, 0.7936, 0.9408},
    //     {0.1332, 0.9346, 0.5936}
    // };

    // float a[ROWS][COLS] = {
    //     {18.8227, 19.1500, 13.8286, 19.5931, 13.9045},
    //     {16.0090, 12.5657, 17.9364, 19.4077, 11.3319},
    //     {19.3460, 15.9358, 18.6940, 15.6772, 17.4109},
    //     {14.2940, 18.8544, 15.7390, 12.6658, 16.2745},
    //     {12.6963, 14.4136, 12.9692, 18.3169, 11.0531}
    // };


    float a_act_quant[ROWS][COLS];
    float a_weigth_quant[ROWS][COLS];

    activation_quant(a, a_act_quant);
    weight_quant(a, a_weigth_quant);


    printf("Input matrix:\n");
    print_matrix(a);
    printf("\n");

    printf("Quantized activation matrix:\n");
    print_matrix(a_act_quant);
    printf("\n");

    printf("Quantized weight matrix:\n");
    print_matrix(a_weigth_quant);
    printf("\n");

    return 0;
}