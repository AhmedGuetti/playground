# mpirun -n 2 python3 1stMPIter.py

import numpy as np
from mpi4py import MPI
comm = MPI.COMM_WORLD
rank = comm.Get_rank()

if rank == 1:
        randNum = np.random.randint(100, size=10, dtype='i')
        req = comm.Isend(randNum, dest=0, tag=11)
        # This process can continue working during the communication
        req.wait()

if rank == 0:
        results = np.empty(10, dtype='i')
        req = comm.Irecv(results, source=1, tag=11)
        # This process can continue working during the communication
        req.wait()
        print ("Process", rank, "received", results)
        
