# python3 n-bodies-base.py 12 1000

import sys
import time
import random
import numpy as np

from n_bodies import *

nbbodies = int(sys.argv[1])
NBSTEPS = int(sys.argv[2])
DISPLAY = len(sys.argv) != 4

start_time = time.time()

# Modify only starting here

data = init_world(nbbodies)
if DISPLAY:
    #Initial bodies position
    displayPlot(data)
    plt.pause(2)

for t in range(NBSTEPS):
    force = np.zeros((nbbodies, 2)) # force[i] is a 2D vector
    for i in range(nbbodies):
        for j in range(nbbodies):
            force[i] = force[i] + interaction(data[i], data[j])
    for i in range(nbbodies):
        data[i] = update(data[i], force[i])


if DISPLAY:
    # New Bodies position
    displayPlot(data)
    plt.pause(2)
end_time = time.time()   
print("Duration:", end_time-start_time)
print("Signature: %.4e" % (signature(data)))
print("Unbalance: %d" % (100*(0)))

