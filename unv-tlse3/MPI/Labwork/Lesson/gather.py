# mpirun -n 3 python3 gather.py

from mpi4py import MPI
comm = MPI.COMM_WORLD
import numpy as np

rank = comm.Get_rank()
size = comm.Get_size()

local_rank = np.array([rank], dtype='i')
A = np.empty(size, dtype = 'i')

print ("local_rank on ", rank, "=", local_rank)

comm.Gather(local_rank, A, root=0)
print ("A After Gather on ", rank, "=", A)

comm.Allgather(local_rank, A)
print ("A After AllGather on ", rank, "=", A)
