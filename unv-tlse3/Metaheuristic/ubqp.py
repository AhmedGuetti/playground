import numpy as np
import sys


def read_input_file(filename):
    with open(filename, 'r') as file:
        first_line = file.readline().strip().split()
        n = int(first_line[0])
        p = int(first_line[1])
        
        Q = []
        for _ in range(n):
            Q.append(list(map(int, file.readline().strip().split())))
        Q = np.array(Q)
    return n, p, Q

def generate_random_solution(n):
    return np.random.randint(0, 2, size=n)

def compute_f(Q, X):
    return np.sum(Q * np.outer(X, X))
filename = sys.argv[1]
n, p, Q = read_input_file(filename)

X = generate_random_solution(n)
f_X = compute_f(Q, X)

print("Matrix Q:\n", Q)
print("Random Solution X:", X)
print("Value of f(X):", f_X)
