import numpy as np
from mpi4py import MPI


comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

if rank == 0:
    data = np.arange(1000, dtype=np.float64)
    comm.Send(data, dest=1, tag=77)
elif rank == 1:
    data = np.empty(1000, dtype='i')
    comm.Recv(data, source=0, tag=77)
    print(data[1:10])


