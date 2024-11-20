# mpirun -n 4 python3 reduce.py

from mpi4py import MPI
import numpy

comm = MPI.COMM_WORLD

rank = numpy.zeros(1, dtype='i')
rank[0] = comm.Get_rank()

somme = numpy.zeros(1, dtype='i')
somme[0] = -1
comm.Reduce(rank, somme, op=MPI.SUM, root=1)
print ("Reduced on 1 : rank=", rank[0], "somme=", somme[0])

maxi = numpy.zeros(1, dtype='i')
comm.Allreduce(rank, maxi, op=MPI.MAX)
print ("Allreduce on ", rank[0], "maximum=", maxi[0])
