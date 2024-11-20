#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAIN 0
#define NUM_THROWS 1000000

int main(int argc, char *argv[]) {
  int num_processes, rank, global_count, count = 0;

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &num_processes);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);

  srand(time(NULL) + rank);

  for (int i = 0; i < NUM_THROWS / num_processes; i++) {
    if ((double)rand() / (double)RAND_MAX < 0.5) {
      count++;
    }
  }

  MPI_Reduce(&count, &global_count, 1, MPI_INT, MPI_SUM, MAIN, MPI_COMM_WORLD);

  double result = (double)global_count / NUM_THROWS;
  if (rank == MAIN) {
    printf("Probability of having tail on the throw is %.6f\n", result);
  }
  
  MPI_Finalize();
  return 0;
}
