# mpirun -n 2 python3 1stMPIbis.py

import numpy as np
from mpi4py import MPI
comm = MPI.COMM_WORLD
rank = comm.Get_rank()

if rank == 1:
        randNum = np.random.randint(100, size=10, dtype='i')
        comm.Send(randNum, dest=0, tag=11)

if rank == 0:
        results = np.empty(10, dtype='i')
        comm.Recv(results, source=1, tag=11)
        print ("Process", rank, "received", results)
