# mpirun -n 2 python3 1stMPI.py

import numpy as np
from mpi4py import MPI
comm = MPI.COMM_WORLD
rank = comm.Get_rank()

randNum = np.random.randint(100, size=1, dtype='i')
if rank == 1:
        print ("Process", rank, "drew the number", randNum)
        comm.Send(randNum, dest=0)

if rank == 0:
        print ("Process", rank, "before receiving has the number", randNum)
        comm.Recv(randNum, source=1)
        print ("Process", rank, "received the number", randNum)
