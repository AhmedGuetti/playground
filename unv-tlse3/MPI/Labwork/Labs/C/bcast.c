#include <mpi.h>
#include <stdio.h>

#define ROOT 0

int main(int argc, char** argv) {
    int rank, data;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (rank == ROOT) {
        data = 42;
        printf("Root process sending data %d\n", data);
    }

    MPI_Bcast(&data, 1, MPI_INT, ROOT, MPI_COMM_WORLD);
    printf("Process %d received data %d\n", rank, data);

    MPI_Finalize();
    return 0;
}
