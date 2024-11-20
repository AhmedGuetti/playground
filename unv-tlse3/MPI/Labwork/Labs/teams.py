# python3 teams.py

import numpy as np

size=1
teams = np.random.randint(2, size=size, dtype='i')
print(f"The file contains {teams}")

my_team = teams[0]

colors = {0: 'blue', 1:'green'}
print('I am', 0, 'and my team is', colors[my_team])
