# python3 ./number.py 42
import numpy as np

# try with and without commenting the next line
np.random.seed(0)
numbers = np.random.randint(100, size=10, dtype='i')

n_max = numbers
n_min = numbers
print(numbers)
print(n_min)
print(n_max)
print(np.array_equal(n_min, n_max))