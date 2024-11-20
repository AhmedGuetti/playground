from mpi4py import MPI
import numpy as np


comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

if rank == 0:
    data = np.array([1, 2, 3, 4, 5 ,6] ,dtype='i') 
    res = np.empty(2, dtype='i') #21
else:
    data = None
    res =  None



l_data = np.empty(2, dtype='i')
comm.Scatter(data, l_data, root=0)


comm.Reduce(l_data, res, op=MPI.SUM, root=0)

print(f"{rank}: {size} : {l_data}")

if rank == 0:
    print(f"sum = {res}")



