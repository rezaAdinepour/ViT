#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <string>
#include <fpm/fixed.hpp>

using namespace std;

/* Function to parse a line of space-separated values into a vector of doubles */
vector<double> parseLine(const string& line) 
{
    vector<double> result;
    stringstream ss(line);
    double value;
    while (ss >> value) 
        result.push_back(value);
    return result;
}

/* Function to read a matrix from a file */
vector<vector<double>> readMatrixFromFile(ifstream& file) 
{
    vector<vector<double>> matrix;
    string line;
    while (getline(file, line)) 
    {
        if (line.empty() || line == "B:")
            break; /* Stop reading when encountering an empty line or "B:" */
        matrix.push_back(parseLine(line));
    }
    return matrix;
}









int main() 
{
    ifstream inFile("test_case.txt");
    if (!inFile) 
    {
        cerr << "Error: Unable to open the file." << endl;
        return 1;
    }

    /* Read matrix A and B */
    vector<vector<double>> matrixA = readMatrixFromFile(inFile);
    vector<vector<double>> matrixB = readMatrixFromFile(inFile);

    /* Display matrices */
    cout << "Matrix A:" << endl;
    for (const auto& row : matrixA) 
    {
        for (double val : row)
            cout << val << " ";
        cout << endl;
    }

    cout << endl << "Matrix B:" << endl;
    for (const auto& row : matrixB) 
    {
        for (double val : row) 
            cout << val << " ";
        cout << endl;
    }

    inFile.close();
    return 0;
}