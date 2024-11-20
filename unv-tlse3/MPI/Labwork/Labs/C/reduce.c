#include <mpi.h>
#include <stdio.h>

#define ROOT 0

int main(int argc, char** argv) {
    int rank, data, sum;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    data = rank;
    printf("Process %d sending data %d\n", rank, data);

    MPI_Reduce(&data, &sum, 1, MPI_INT, MPI_SUM, ROOT, MPI_COMM_WORLD);

    if (rank == ROOT) {
        printf("Root process received sum %d\n", sum);
    }

    MPI_Finalize();
    return 0;
}
