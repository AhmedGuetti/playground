import numpy as np
from mpi4py import MPI
from mpi4py.MPI import ANY_SOURCE
# from mpi4py import *
import sys
import math


comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()


a, b, n = float(sys.argv[1]), float(sys.argv[2]), int(sys.argv[3])

def f(x):
    return x*x

def IntegraleRange(a, b, c):
    I = (f(b)-f(a))/2.0
    
    for x in np.linspace(a, b, n+1):
        I = I + f(x)

    I = I * (b-a)/n
    return I
# I = IntegraleRange(a,b,n)
# print(f"we have n = {n} our estimation of the function square root is : {I} between {a} and {b}")


# THIS IS GOING TO BE THE PARALLELE CODE

h = (b-a)/n
local_n = n//size

local_a = a +  local_n * rank  * h
#local_b = a +  local_n *(rank + 1)  * h
local_b = local_a + local_n * h


I = np.zeros(1)
recv_buffer = np.zeros(1)

I[0] = IntegraleRange(local_a, local_b, local_n)
total = 0
if rank == 0:
    total = I[0]
    for i in range(1, size):
        comm.Recv(recv_buffer, dest = ANY_SOURCE)
        total += recv_buffer[0]
else:
    comm.Send(I, source=0)

if rank == 0:
    print(f"[x^2]_{a}_{b} = {total} avec n = {n}")

