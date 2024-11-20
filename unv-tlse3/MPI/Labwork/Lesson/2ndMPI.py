#mpirun -n 2 python3 2ndMPI.py
from mpi4py import MPI
import numpy

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

# passing MPI datatypes explicitly
if rank == 0:
    data = numpy.arange(1000, dtype='i')
    comm.Send([data, MPI.INT], dest=1, tag=77)
elif rank == 1:
    data = numpy.empty(1000, dtype='i')
    comm.Recv([data, MPI.INT], source=0, tag=77)
    print(data[1:10])

print("***************** VERSION 2 ****************")
# automatic MPI datatype discovery
if rank == 0:
    data = numpy.arange(1000, dtype=numpy.float64)
    comm.Send(data, dest=1)
elif rank == 1:
    data = numpy.empty(1000, dtype=numpy.float64)
    comm.Recv(data, source=0)
    print(data[1:10])


