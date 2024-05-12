import numpy as np
import matplotlib.pyplot as plt

def matrix(S, d, C, sigma):
    matrix = np.zeros((S, S))
    
    for i in range(S):
        for j in range(S):
            if i == j:
                matrix[i, j] = -d
            else:
                if np.random.rand() <= C:
                    matrix[i, j] = np.random.normal(0, sigma)
    return matrix

S1 = 100 
S2 = 500  
C = 8  
d = 7    
sigma = 1 

matrix_1 = matrix(S1, d, C, sigma)
ev1 = np.linalg.eigvals(matrix_1)
matrix_2 = matrix(S2, d, C, sigma)
ev2 = np.linalg.eigvals(matrix_2)

plt.scatter(np.real(ev1), np.imag(ev1), label = "Matrix size = 100")
plt.scatter(np.real(ev2), np.imag(ev2), label = "Matrix size = 500")
plt.legend()
plt.title("Eigenvalues")
plt.xlabel("Real part of eigenvalues")
plt.ylabel("Imaginary part of eigenvalues")
plt.show()

