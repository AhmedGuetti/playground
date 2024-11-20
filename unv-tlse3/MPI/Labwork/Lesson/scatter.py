# mpirun -n 3 python3 scatter.py

from mpi4py import MPI
comm = MPI.COMM_WORLD
import numpy as np

rank = comm.Get_rank()

if rank == 0:
	A = np.arange(0, 9, dtype='f')
else:
	A = None
	
local_A = np.zeros(3, dtype = 'f')
comm.Scatter(A, local_A, root=0)
print ("local_A on ", rank, "=", local_A)
