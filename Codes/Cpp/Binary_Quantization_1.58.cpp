#include <iostream>
#include <cmath>
#include <algorithm>

// Define the dimensions of the weight matrix
const int N = 4;

// Function to perform binary quantization and absmax quantization
void Bin_Quant(double weights[N][N], int bweights[N][N], int quantizedMatrix[N][N], double &gamma_binarize, double &gamma_quantize, int Qb, double epsilon = 1e-5) {
    // Compute gamma for binarization
    double sum = 0.0;
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            sum += std::abs(weights[i][j]);
        }
    }
    gamma_binarize = (sum / (N * N)) + epsilon;

    // Binarize weights
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            double scaledWeight = weights[i][j] / gamma_binarize;
            bweights[i][j] = static_cast<int>(std::max(-1.0, std::min(1.0, std::round(scaledWeight))));
        }
    }

    // Compute gamma for absmax quantization
    double max_val = 0.0;
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            max_val = std::max(max_val, std::abs(weights[i][j]));
        }
    }
    gamma_quantize = max_val + epsilon;

    // Quantize input matrix
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            double scaledValue = weights[i][j] * Qb / gamma_quantize;
            quantizedMatrix[i][j] = static_cast<int>(std::max(-Qb + epsilon, std::min(Qb - epsilon, std::round(scaledValue))));
        }
    }
}

// Helper function to print the matrix
template <typename T>
void printMatrix(T matrix[N][N]) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            std::cout << matrix[i][j] << " ";
        }
        std::cout << std::endl;
    }
}

int main() {
    // Example weight matrix
    double weights[N][N] = {
        {0.2961, -0.0495, -0.0924, -0.4765},
        {0.0413, 0.3396, 0.2812, 0.2403},
        {-0.1808, 0.1304, 0.4322, -0.1771},
        {-0.4809, 0.3244, -0.1741, -0.3853}
    };

    // Output binarized weights matrix
    int bweights[N][N] = {0};
    int quantizedMatrix[N][N] = {0};

    // Parameters
    double epsilon = 1e-5;
    int Qb = 127; // for 8-bit quantization
    double gamma_binarize;
    double gamma_quantize;

    // Perform binary quantization and absmax quantization
    Bin_Quant(weights, bweights, quantizedMatrix, gamma_binarize, gamma_quantize, Qb, epsilon);

    // Print the binarized weights
    std::cout << "Binarized weights (bweights):" << std::endl;
    printMatrix(bweights);

    // Print the quantized matrix
    std::cout << "\nQuantized matrix:" << std::endl;
    printMatrix(quantizedMatrix);

    // Print gamma values
    std::cout << "\nGamma for binarization: " << gamma_binarize << std::endl;
    std::cout << "Gamma for quantization: " << gamma_quantize << std::endl;

    return 0;
}
