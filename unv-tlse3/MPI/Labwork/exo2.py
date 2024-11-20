import numpy as np 
from mpi4py import MPI
# initialize the communicator
comm = MPI.COMM_WORLD

# MPI Varibale 
size = comm.Get_size()
rank = comm.Get_rank()

number = np.zeros(1, dtype='i')

if rank == 0:
    number = np.array([42], dtype='i')


print(f"At start in process of rank {rank} the passnumber is {number[0]}")
comm.Bcast(number, root=0)
print(f"After collective in process of rank {rank} the passnumber is {number[0]}")    
