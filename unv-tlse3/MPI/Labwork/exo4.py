from mpi4py import MPI
comm = MPI.COMM_WORLD
import numpy as np
import sys


def cumul(a, b):
    return sum(range(a,b))

size = comm.Get_size()
rank = comm.Get_rank()

if len(sys.argv) < 2:
    print(f"[USAGE] {sys.argv[0]} <integer number>")
    exit()

res = np.zeros(1, dtype='i')

a = 0
b = int(sys.argv[1])


step = (b-a)/size
local_a = int(a + rank * step)
local_b = int(local_a + step)
c = np.array(cumul(local_a, local_b),dtype='i')

comm.Reduce(c,res,op=MPI.SUM,root=0)

if(rank==0):
    print(f"result = {res[0]}")

