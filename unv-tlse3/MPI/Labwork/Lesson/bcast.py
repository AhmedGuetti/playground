# mpirun -n 3 python3 bcast.py

from mpi4py import MPI
comm = MPI.COMM_WORLD
import numpy as np

rank = comm.Get_rank()

if rank == 0:
	A = np.arange(0, 10, dtype='f')
else:
	A = np.zeros(10, dtype = 'f')
	
comm.Bcast(A, root=0)
print ("A on ", rank, "=", A)
