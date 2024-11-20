# /usr/bin/python3

# python3 scalar_product.py 20

import random
import sys
import numpy as np

def scalar_product(X, Y):
    return X*Y

if __name__ == '__main__':

    random.seed(0)
    #read from command line
    nb_elem = int(sys.argv[1])    #length of vectors

    X = np.random.randint(2, size=nb_elem)
    Y = np.random.randint(2, size=nb_elem)

    result = scalar_product(X, Y)

    print(result)
