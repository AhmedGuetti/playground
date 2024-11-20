# python3 cumul.py 1000

import sys

def cumul(a,b):
    return sum(range(a,b))

nb = int(sys.argv[1])

res = cumul(0,nb)

print(res)

