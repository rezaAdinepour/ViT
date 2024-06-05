import numpy as np


#-- read matrices from file --#
def read_matrix(filename):
    with open(filename, 'r') as file:
        content = file.read().strip().split('\n')
    
    matrices = {}
    current_matrix = None
    matrix_data = []
    
    for line in content:
        if(line.endswith(':')):
            if(current_matrix):
                matrices[current_matrix] = np.array(matrix_data, dtype=float)
            current_matrix = line[:-1]
            matrix_data = []
        else:
            matrix_data.append([float(x) for x in line.split()])
    
    if(current_matrix):
        matrices[current_matrix] = np.array(matrix_data, dtype=float)
    
    return matrices