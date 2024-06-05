import numpy as np
from fxpmath import Fxp
import os
from utils import*


#-- Clear terminal before running --#
clear = lambda: os.system("clear")
clear()

#-------------- Define inline Matrix --------------#
# #-- Define the floating point matrices --#
# a = np.array([[2, 4, 3],
#               [1, 0, 5],
#               [6, 3, 3]])
# print("Matrix A is: ")
# print(a)
# print("-"*30)

# # b = np.array([[2, 4, 3],
# #               [1, 0, 5],
# #               [6, 3, 3]])
# b = np.identity(3)
# print("Matrix B is: ")
# print(b)
# print("-"*30)




#-------------- Read matrices A and B from test_case.txt --------------#
matrices = read_matrix("test_case.txt")
a = matrices['A']
b = matrices['B']

print("Matrix A is: ")
print(a)
print("-"*30)


print("Matrix B is: ")
print(b)
print("-"*30)

#-- Perform matrix multiplication --#
c = np.matmul(a, b)
print("Matrix multiplication result (c): ")
print(c)
print("-"*30)

#-- Convert array to the 8-bit fixed point --#
a_fix = Fxp(a, signed=False, n_word=8, n_frac=4)
b_fix = Fxp(b, signed=False, n_word=8, n_frac=4)

#-- Print the binary representation of the fixed-point matrix --#
print("\nFixed-point representation (a_fix):")
for i in range(a_fix.shape[0]):
    for j in range(a_fix.shape[1]):
        print(a_fix[i, j].bin(frac_dot=True), end=' ')
    print()

print("-"*30)

print("\nFixed-point representation (b_fix):")
for i in range(b_fix.shape[0]):
    for j in range(b_fix.shape[1]):
        print(b_fix[i, j].bin(frac_dot=True), end=' ')
    print()

print("-"*30)

#-- Perform matrix multiplication of fix point matrixes --#
c_fix = np.matmul(a_fix, b_fix)
print("Matrix multiplication result (c_fix): ")
print(c_fix)
print("-"*30)
