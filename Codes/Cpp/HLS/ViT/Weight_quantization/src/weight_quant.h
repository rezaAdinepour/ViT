

#define ROWS 3
#define COLS 3
#define MIN_CLAMP 1e-5



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
