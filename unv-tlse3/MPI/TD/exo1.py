import numpy as np
from mpi4py import MPI


comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

A = np.zeros(2, dtype='f')

if rank == 0:
    A[1] = 42
	
comm.Bcast(A, root=0)
print ("A on ", rank, "=", A)

result = np.empty(6, dtype = 'f')
comm.Allgather(A, result)
print ("AllGather", rank, "=", result)

A = A+1 # for numpy array, addition is element-wise

comm.Gather(A, result, root=2)
print ("Gather", rank, "=", result )


