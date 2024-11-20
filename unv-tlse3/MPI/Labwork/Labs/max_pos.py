# python3 max_pos.py

import numpy as np

def get_max(tab):
    pos = np.argmax(tab)
    return [tab[pos], pos]

SIZE=12

np.random.seed(42)
tab = np.random.randint(100, size = SIZE, dtype='i')
c_max, c_pos = get_max(tab)
print(c_pos)

