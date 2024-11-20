#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
    int rank, num_processes, data;
    int *recv_data;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &num_processes);
    recv_data = malloc(sizeof(int) * num_processes);
    
    data = rank;
    printf("Process %d sending data %d\n", rank, data);

    MPI_Allgather(&data, 1, MPI_INT, recv_data, 1, MPI_INT, MPI_COMM_WORLD);
    printf("Process %d received data: ", rank);
    for (int i = 0; i < num_processes; i++) {
        printf("%d ", recv_data[i]);
    }
    printf("\n");

    MPI_Finalize();
    return 0;
}
