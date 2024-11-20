from mpi4py import MPI
comm = MPI.COMM_WORLD
import numpy as np


size = comm.Get_size()
rank = comm.Get_rank()


#np.random.seed(0)
numbers = np.random.randint(100, size=10, dtype='i')


min_num = np.zeros(10, dtype='i')
max_num = np.zeros(10, dtype='i')


comm.Reduce(numbers, min_num, op=MPI.MIN, root=0)
comm.Reduce(numbers, max_num, op=MPI.MAX, root=0)


if(rank == 0):
    if(np.array_equal(min_num, max_num)):
        print("True")
    else:
        print("False")
