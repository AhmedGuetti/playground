#! /usr/bin/python3

from mpi4py import MPI
comm = MPI.COMM_WORLD
import numpy as np

SIZE = 20

def get_max(tab):
    pos = np.argmax(tab)
    return [tab[pos], pos]

np.random.seed(42)
size = comm.Get_size()
rank = comm.Get_rank()

local_size = SIZE // size
local_array = np.empty(local_size, dtype=int)


if rank == 0:
    array = np.random.randint(100, size = SIZE, dtype=int)
    print(f"array = {array}")
    result_array = np.empty((size, 2), dtype=int)
else: 
    array = None
    result_array = None
comm.Scatter(array, local_array, root=0)


loc_max, loc_pos = get_max(local_array)
comm.Gather(np.array((loc_max, loc_pos)), result_array, root=0)

if rank == 0:
    print(result_array)
    max, r = get_max(result_array[:,0])
    print(max)
    print(f"max == {max}\npos={r}")
    position =  r * local_size + result_array[r][1]

    print(position, max)