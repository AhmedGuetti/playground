# mpirun -n 3 python3 time.py
from mpi4py import MPI
comm = MPI.COMM_WORLD
rank = comm.Get_rank()

comm.barrier()
start = MPI.Wtime()

A = [[1.,2.,3.],[4.,5.,6.],[7.,8.,9.]]
local_a = [0, 0, 0] 
local_a = comm.scatter(A)
print ("process", rank, "has", local_a)

end = MPI.Wtime()
comm.barrier()

print ("Duration on", rank, ": ", end - start, "s")

