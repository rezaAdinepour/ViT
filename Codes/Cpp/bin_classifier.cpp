#include <stdio.h>


#define NUM_INPUTS 4
#define NUM_FEATURES 2
#define EPOCH 20
#define lr 0.1






float dot_product(float inputs[NUM_FEATURES], float weights[NUM_FEATURES + 1])
{
    float sum = 0.0;
    for (int i = 0; i < NUM_FEATURES; i++)
        sum += inputs[i] * weights[i + 1];
    return sum;
}


float predict(float inputs[NUM_FEATURES], float weights[NUM_FEATURES + 1])
{
    float summation = dot_product(inputs, weights) + weights[0];
    float activation = (summation > 0.0) ? 1.0 : 0.0;
    return activation;
}





int main()
{
    float x[NUM_INPUTS][NUM_FEATURES] = 
    {
        {0, 0},
        {1, 0},
        {0, 1},
        {1, 1}
    };

    float y[NUM_INPUTS] = {0, 0, 0, 1};
    float w[NUM_FEATURES + 1] = {0.5, -0.6, 0.2};

    printf("inputs:\n");
    for(int i = 0; i < NUM_INPUTS; i++)
        printf("%.3f, %.3f\n", x[i][0], x[i][1]);
    printf("--------------------------------------------------\n");

    printf("initial weights: %.3f, %.3f, %.3f\n", w[0], w[1], w[2]);
    printf("--------------------------------------------------\n");

    for(int epoch = 0; epoch < EPOCH; epoch++)
    {
        int fail_count = 0;

        for(int i = 0; i < NUM_INPUTS; i++)
        {
            float prediction = predict(x[i], w);
            float label = y[i];

            if(label != prediction)
            {
                for(int j = 0; j < NUM_FEATURES; j++)
                    w[j + 1] += lr * (label - prediction) * x[i][j];
                w[0] += lr * (label - prediction);
                fail_count += 1;
            }
        }

        if(fail_count == 0)
            break;
    }

    printf("weights after training: %.3f, %.3f, %.3f\n", w[0], w[1], w[2]);
    printf("--------------------------------------------------\n");


    for (int i = 0; i < NUM_INPUTS; i++) 
    {
        float prediction = predict(x[i], w);
        printf("Input: %.3f, %.3f, True Label: %.3f, Predicted Label: %.3f\n", x[i][0], x[i][1], y[i], prediction);
    }

    return 0;
}