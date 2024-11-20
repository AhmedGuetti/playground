# python3 test_graphic.py

import matplotlib.pyplot as plt

plt.plot([0, 1, 1, 0], [1, 0, 1, 0])

plt.draw()
print("Opens a window and sleeps for 2 seconds")
plt.show(block=False)

plt.pause(2)
