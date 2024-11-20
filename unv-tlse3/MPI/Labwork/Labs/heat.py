#! /usr/bin/python3
# python3 heat_sol.py

import time
import random
import functools
import matplotlib.pyplot as plt
import numpy as np

def add_hot_spots(matrix, number):
    size_x, size_y = matrix.shape

    for i in range(number):
        x = random.randrange(1, size_x-1)
        y = random.randrange(1, size_y-1)
        matrix[x][y] = random.randint(500, 1000)

def get_val(matrix, x, y):
    tmp = matrix[x][y] + matrix[x-1][y] + matrix[x+1][y] + matrix[x][y-1] + matrix[x][y+1]
    return tmp // 5


def get_signature(matrix):
    return np.bitwise_xor.reduce(np.add.reduce(matrix))

if __name__ == '__main__':
    # Considered a known constant
    width = 120
    #
    
    # Simulates reading the matrix from a file
    matrix = np.zeros((width, width), dtype='i')
    random.seed(3)
    add_hot_spots(matrix, 400)
    #
    
    init_time = time.time()

    tmp_matrix = np.zeros((width, width), dtype='i')
    for _ in range(20):
        for x in range(1, width-1):
            for y in range(1, width-1):
                tmp_matrix[x][y] = get_val(matrix, x, y)
        matrix, tmp_matrix = tmp_matrix, matrix

    final_time = time.time()
    print('Total time:', final_time-init_time, 's')
    print('Signature:', get_signature(matrix))
    plt.imshow(matrix, cmap='hot', interpolation='nearest')
    plt.colorbar()

    plt.savefig('heat.pdf')  
    plt.show(block=True)
