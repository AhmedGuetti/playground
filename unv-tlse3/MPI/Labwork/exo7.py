#! /usr/bin/python3

from mpi4py import MPI
comm = MPI.COMM_WORLD
import numpy as np

import time
import random


NB = 100001


size = comm.Get_size()
rank = comm.Get_rank()

def monte_carlo_pi_part(nb_points):
    inside = 0
    for _ in range(nb_points):
        x = random.random()
        y = random.random()
        if x*x + y*y <= 1.0:
            inside += 1
    return inside


NB_process = NB // size

random.seed(rank)
comm.barrier()
start_time = MPI.Wtime()

count_inside = monte_carlo_pi_part(NB_process)

total_inside = comm.reduce(count_inside, op=MPI.SUM, root=0)

# Root process calculates the final estimation of Pi and prints the result
if rank == 0:
    pi_estimate = 4 * total_inside / NB
    end_time = MPI.Wtime()
    comm.barrier()
    print(f"Estimated Pi: {pi_estimate}")
    print(f"Calculation Time: {end_time - start_time} seconds")
