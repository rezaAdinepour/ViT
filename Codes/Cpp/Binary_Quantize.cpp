#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <limits>

using namespace std;

// Function to compute the Sign(W - alpha) matrix
vector<vector<int>> computeTransformedMatrix(const vector<vector<double>>& W) 
{
    int n = W.size();
    int m = W[0].size();
    
    // Compute alpha
    double sum = 0.0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            sum += W[i][j];
        }
    }
    double alpha = sum / (n * m);

    // Compute the transformed matrix W_tilde
    vector<vector<int>> W_tilde(n, vector<int>(m, 0));
    for (int i = 0; i < n; ++i) 
    {
        for (int j = 0; j < m; ++j) 
        {
            double diff = W[i][j] - alpha;
            W_tilde[i][j] = (diff > 0) ? 1 : -1;
        }
    }

    return W_tilde;
}

const double EPSILON = std::numeric_limits<double>::epsilon();

// Clip function
double Clip(double x, double a, double b) {
    return max(a, min(b, x));
}

// Quant function that includes clipping and quantization
vector<vector<double>> Quant(const vector<vector<double>>& x, double Qb) {
    int n = x.size();
    int m = x[0].size();

    // Find the maximum absolute value in x
    double gamma = 0.0;
    for (const auto& row : x) {
        for (double val : row) {
            gamma = max(gamma, abs(val));
        }
    }

    // Compute the minimum value in x
    double eta = x[0][0];
    for (const auto& row : x) {
        for (double val : row) {
            eta = min(eta, val);
        }
    }

    // Compute the quantized matrix
    vector<vector<double>> x_tilde(n, vector<double>(m, 0.0));
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            double adjusted = (x[i][j] - eta) * (Qb / gamma);
            x_tilde[i][j] = Clip(adjusted, EPSILON, Qb - EPSILON);
        }
    }

    return x_tilde;
}





int main() 
{
    // Example matrix W
    vector<vector<double>> W = 
    {
        {0.5, -1.2, 3.0},
        {2.1, -0.4, 0.0},
        {-1.5, 2.3, -0.7}
    };

    vector<vector<double>> x = {
        {2.5, -7.2, 1.5},
        {7.6, -12.4, 0.85},
        {-4.5, 0.3, +1.7}
    };

    double Qb = 100.0; // Example quantization range upper bound

    // Compute the transformed matrix W_tilde
    vector<vector<int>> W_tilde = computeTransformedMatrix(W);

    // Compute the quantized matrix x_tilde
    vector<vector<double>> x_tilde = Quant(x, Qb);

    // Print the transformed matrix W_tilde
    cout << "Transformed Matrix W_tilde:" << endl;
    for (const auto& row : W_tilde) 
    {
        for (int value : row) 
            cout << value << " ";
        cout << endl;
    }


    // Print the quantized matrix x_tilde
    cout << "Quantized Matrix x_tilde:" << endl;
    for (const auto& row : x_tilde) {
        for (double value : row) {
            cout << value << " ";
        }
        cout << endl;
    }

    return 0;
}