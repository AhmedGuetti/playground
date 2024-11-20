#include <mpi.h>
#include <stdio.h>

#define ROOT 0
#define SIZE 4

int main(int argc, char** argv) {
    int rank, data[SIZE];

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (rank == ROOT) {
        for (int i = 0; i < SIZE; i++) {
            data[i] = 2*i+1;
        }
    }

    int recv_data;
    MPI_Scatter(data, 1, MPI_INT, &recv_data, 1, MPI_INT, ROOT, MPI_COMM_WORLD);
    printf("Process %d received data %d\n", rank, recv_data);

    MPI_Finalize();
    return 0;
}
