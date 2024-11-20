import numpy as np
from mpi4py import MPI


comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()


comm.Barrier()
start = MPI.Wtime()

A = np.array([[1.,2. ,3.],[4.,5.,6.],[7.,8.,9.]])
local_a = np.zeros(3)
comm.Scatter(A,local_a)
print ("process", rank, "has", local_a)


comm.Barrier()
end = MPI.Wtime()


print(f"time = {end-start}")


