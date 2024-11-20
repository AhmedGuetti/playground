#!/usr/bin/python3
from mpi4py import MPI
comm = MPI.COMM_WORLD
import numpy as np
import sys

size = comm.Get_size()
rank = comm.Get_rank()


def nb_primes(n):
    result = 0
    for i in range(1, n+1):
        if n%i == 0:
            result += 1
    return result


if rank == 0:
    upper_bound = np.array([int(sys.argv[1])],dtype='i')
    if(upper_bound % size != 0):
        raise ValueError("Upper bound must be devisible by the number of process")
    # no need for the chunk just the upper bound
    # chunk =  np.array([upper_bound // size], dtype='i')

else:
    # chunk = np.zeros(1, dtype='i')
    upper_bound = np.zeros(1, dtype='i')

comm.Bcast(upper_bound,root=0)

local_max = np.zeros(1, dtype='i')
maxi = np.zeros(1, dtype='i')

for val in range(rank, upper_bound[0]+1, size):
    tmp = nb_primes(val)
    local_max[0] = max(local_max[0], tmp)

comm.Allreduce(local_max, maxi, op=MPI.MAX)

if rank == 0:
    print(maxi[0])