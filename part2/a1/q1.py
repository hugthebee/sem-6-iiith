import numpy as np

A = np.array([[0, 7, 3],
                [4, 5, 6],
                [7, 8, 9],
                [10, 11, 12]])

At = np.transpose(A)
AA = np.dot(At,A)
eigenvalues, eigenvectors = np.linalg.eig(AA) #calculates eigen values and eigen vectors
print(f'AA = {AA}\n')
print(f'eigenvalues = {eigenvalues}\n')
print(f'eigenvectors = {eigenvectors}\n')

#normalized eigenvectors
normal = [v/np.linalg.norm(v) for v in np.transpose(eigenvectors)]
V = np.column_stack(normal) #This is the required V matrix in SVD
print(f'V = {V}\n')

#now to find the sigma matrix - diagonal matrix which is same size as original
eigenvalues = sorted(eigenvalues,reverse=True)
S = np.zeros((4,3))
S[0,0] = np.sqrt(eigenvalues[0])
S[1,1] = np.sqrt(eigenvalues[1])
S[2,2] = np.sqrt(eigenvalues[2])
print(f'S = {S}\n')

# To find U we first do A x V, normalise and then multiply by sigma matrix
U = np.dot(A,V)
U = [v/np.linalg.norm(v) for v in np.transpose(U)]
U = np.column_stack(U) 

U = np.dot(U,np.transpose(S))

res = []
for v in np.transpose(U):
    if np.all(v == 0):
        res.append(v)
    else:
        res.append(v / np.linalg.norm(v))
U = np.column_stack(res) 
print(f'U = {U}\n')


print(f'A = {np.dot(np.dot(U,S),np.transpose(V))}\n')