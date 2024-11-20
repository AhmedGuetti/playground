#!/usr/bin/python3

from mpi4py import MPI
import numpy as np

# Constants
n = 30
DIM = 3

# Initialize MPI
comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()


# def matrix_multiplication(A, B):
#     C = np.zeros((A.shape[0], B.shape[1]))
#     for i in range(A.shape[0]):
#         for j in range(B.shape[1]):
#             for k in range(A.shape[1]):
#                 C[i][j] += A[i][k] * B[k][j]
#     return C

def matrix_power(A, n):
    res = A.copy()
    for _ in range(n-1):
        tmp = np.zeros((A.shape[0], A.shape[0]))
        for lin in range(A.shape[0]):
            for col in range(A.shape[0]):
                for i in range(A.shape[0]):
                    tmp[lin][col] += A[lin][i] * res[i][col]
        res = tmp.copy()

# Check if DIM is divisible by size for proper splitting
# if DIM % size != 0:
#     if rank == 0:
#         print("Matrix dimension DIM must be divisible by the number of processes.")
#     exit()

chunk = DIM // size 


if rank == 0:
    # generate matrices
    np.random.seed(10)
    A = np.random.rand(DIM, DIM)

    # show reference
    ref = np.linalg.matrix_power(A, n)
    print('Signature ref:', ref.trace())
    print(ref)


    # C = np.identity(DIM)
else:
    A = None
    # C = None

A = comm.bcast(A, root=0)


a,b = rank * chunk, (rank+1) * chunk
C = np.zeros((chunk, DIM))
B= A.copy()

for x in range(a, b):
    for y in range(0,DIM):
        C[x-a][y] = 0
        for i in range(0,DIM):
            C[x-a][y] += B[i][y] * A[x][i]
comm.Allgather(C, B)


if rank == 0:
    print('Signature:', C.trace())
    print(C)