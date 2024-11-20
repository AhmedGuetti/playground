#mpirun -n 3 python3 timeNumpy.py
from mpi4py import MPI
import numpy
comm = MPI.COMM_WORLD
rank = comm.Get_rank()

comm.Barrier()
start = MPI.Wtime()

A = numpy.array([[1.,2.,3.],[4.,5.,6.],[7.,8.,9.]])
local_a = numpy.zeros(3)
comm.Scatter(A,local_a)
print ("process", rank, "has", local_a)

comm.Barrier()
end = MPI.Wtime()

print ("Durée sur", rank, ": ", end - start)

