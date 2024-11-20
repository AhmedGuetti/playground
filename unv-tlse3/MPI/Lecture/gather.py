import numpy as np
from mpi4py import MPI


comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()


local_rank = np.array([rank] ,dtype='i')
A = np.empty(size, dtype='i')

print(f"local_rank = {local_rank}")

comm.Gather(local_rank, A, root=0)
print(f"[{rank}] A after gather = {A}")


comm.Allgather(local_rank, A)
print(f"[{rank}]A after All gather = {A}")

