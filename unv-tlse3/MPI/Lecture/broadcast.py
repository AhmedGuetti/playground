from mpi4py import MPI 
import numpy as np


comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

if rank == 0:
    A = np.arange(0,10,dtype='f')
else:
    A = np.zeros(10, dtype='f')

comm.Bcast(A, root=0)
print(f"{rank} : {A}")
