#example to run: mpirun -n 4 python3 trapezeParallel-2.py 0.0 1.0 10000
import sys
from mpi4py import MPI
from mpi4py.MPI import ANY_SOURCE

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

#takes in command-line arguments [a,b,n]
a = float(sys.argv[1])
b = float(sys.argv[2])
n = int(sys.argv[3])

#we arbitrarily define a function to integrate
def f(x):
        return x*x

#this is the serial version of the trapezoidal rule
#parallelization occurs by dividing the range among processes
def integrateRange(a, b, n):
        integral = -(f(a) + f(b))/2.0
        # n+1 endpoints, but n trapezoids
        x = a
        h = (b-a)/n
        while (x<b):
                integral = integral + f(x)
                x = x + h

        integral = integral* (b-a)/n
        return integral


#h is the step size. n is the total number of trapezoids
h = (b-a)/n
#local_n is the number of trapezoids each process will calculate
#note that size must divide n
local_n = n/size

#we calculate the interval that each process handles
#local_a is the starting point and local_b is the endpoint
local_a = a + rank*local_n*h
local_b = local_a + local_n*h

#initializing variables.
integral = 0
total = 0

# perform local computation. Each process integrates its own interval
integral = integrateRange(local_a, local_b, local_n)

# communication
# root node receives results with a collective "reduce"
total = comm.reduce(integral, op=MPI.SUM, root=0)

# root process prints results
if comm.rank == 0:
        print ("With n =", n, "trapezoids, our estimate of the integral from", a, "to", b, "is", total) 
