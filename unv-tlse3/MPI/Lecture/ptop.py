from mpi4py import MPI
# this is a point to point message passing


comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

if rank == 0:
    print("I am the King")
    msg = "The king sent a messge to you"
    comm.send(msg, dest=1)
elif rank == 1:
    s = comm.recv()
    print(f"the woker {rank} recieved from the king : {s}")
else:
    print("Just a slave")

