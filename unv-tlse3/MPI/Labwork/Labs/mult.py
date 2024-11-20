import numpy as np

# We assume n and DIM are constant known by all processes
n = 30
DIM = 12

# To simulate we read the matrix from a file
np.random.seed(10)
A = np.random.rand(DIM,DIM)

## Only for reference
res = np.linalg.matrix_power(A, n)
print('Signature ref', res.trace())

# Need a copy not a pointer on the same array
res = A.copy()
for _ in range(n-1):
    tmp = np.zeros((DIM, DIM))
    for lin in range(DIM):
        for col in range(DIM):
            for i in range(DIM):
                tmp[lin][col] += A[lin][i] * res[i][col]
    res = tmp.copy()

print('Signature    ', res.trace())
