import numpy as np
from mpi4py import *



comm = MPI.COMM_WORLD
size = comm.Get_size()


#rank = comm.Get_rank()

rank = np.zeros(1, dtype='i')
rank[0] = comm.Get_rank()

sum = np.zeros(1, dtype='i')
comm.Reduce(rank, sum, op = MPI.SUM, root=1)

print(f"Reduced on 0 ; rank: {rank[0]} et sum : {sum[0]}")


maxi = np.zeros(1, dtype='i')
comm.Allreduce(rank, maxi, op=MPI.MAX)
print(f"All reduce on {rank[0]} :: {maxi[0]}")
