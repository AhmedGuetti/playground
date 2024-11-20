#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    int rank, data, sum;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    data = rank;
    printf("Process %d sending data %d\n", rank, data);

    MPI_Allreduce(&data, &sum, 1, MPI_INT, MPI_SUM, MPI_COMM_WORLD);
    printf("Process %d received sum %d\n", rank, sum);

    MPI_Finalize();
    return 0;
}
