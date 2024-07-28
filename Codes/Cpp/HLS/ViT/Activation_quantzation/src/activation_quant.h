


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


float clamp(float value, float min)
{
    return value < min ? min : value;
}
