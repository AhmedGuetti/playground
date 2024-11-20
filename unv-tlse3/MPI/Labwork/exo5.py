from mpi4py import MPI
comm = MPI.COMM_WORLD
import numpy as np

size = comm.Get_size()
rank = comm.Get_rank()


team = np.empty(1, dtype='i')

if rank == 0:
    teams = np.random.randint(2, size=size, dtype='i')
    print(f"The file contains {teams}")
else:
    teams = None

comm.Scatter(teams, team, root=0)

color = ["blue", "green"]
print(f"I am {rank} and my team is {color[team[0]]}")


