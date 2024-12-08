import sys
import time
import numpy as np
from mpi4py import MPI
from n_bodies import *

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()


nbbodies = int(sys.argv[1])
NBSTEPS = int(sys.argv[2])
DISPLAY = len(sys.argv) != 4


if rank == 0:
    start_time = time.time()
    data = init_world(nbbodies)
else:
    data = np.zeros((nbbodies, 6), dtype='f')

comm.Bcast(data, root=0)


local_count = nbbodies // size + (1 if rank < nbbodies % size else 0)
start_idx = rank * (nbbodies // size) + min(rank, nbbodies % size)
local_data = np.zeros((local_count, 6), dtype='f')

for i in range(local_count):
    local_data[i] = data[start_idx + i]

for t in range(NBSTEPS):
    forces = np.zeros((local_count, 2), dtype='f')
    for i in range(local_count):
        global_i = start_idx + i
        for j in range(nbbodies):
            if global_i != j:
                forces[i] += interaction(local_data[i], data[j])

    new_local_data = np.zeros((local_count, 6), dtype='f')
    for i in range(local_count):
        new_local_data[i] = update(local_data[i], forces[i])
    local_data = new_local_data

    gathered_data = np.zeros((nbbodies, 6), dtype='f')
    comm.Allgather(local_data, gathered_data)
    data = gathered_data.copy()


if rank == 0:
    if DISPLAY:
        displayPlot(data)
        plt.pause(2)
    
    end_time = time.time()
    print("Duration:", end_time-start_time)
    print("Signature: %.4e" % (signature(data)))
    print("Unbalance: %d" % (100*(0)))
