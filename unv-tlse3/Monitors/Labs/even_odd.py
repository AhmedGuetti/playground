#!/usr/bin/python3

import time
import random
from multiprocessing import Process, Lock, Condition, Value

# 1) Specification
# Monitor EvenOdd
#     even()
#     odd()

# 2) Blocking and unblocking conditions
# Even, blocking : number is odd
# Even, unblocking: number just become even
# Odd, blocking : number is even
# Odd, unblocking : number just become odd

# 3) state and condition Variables
# state variable : the number
# state condition : one for odd processes, one for even processes

# 4) Code

class EvenOdd:
    def __init__(self):
        self.lock = Lock()
        self.c_even = Condition(self.lock)
        self.c_odd = Condition(self.lock)
        self.n = Value('i', 0, lock=False)

    def even(self,nb): # Can only increase even value
        with self.lock:
            while self.n.value % 2 != 0:
                self.c_even.wait()
            print(f'Even_{nb}: Old value: {self.n.value}', end='')
            self.n.value += 1
            print(f' -> New value: {self.n.value}')

            self.c_odd.notify()

    def odd(self,nb): # Can only increase even value
        with self.lock:
            while self.n.value % 2 != 1:
                self.c_odd.wait()
            print(f'Odd_{nb}: Old value: {self.n.value}', end='')
            self.n.value += 1
            print(f' -> New value: {self.n.value}')

            tmp = self.n.value
            self.c_even.notify()
            return tmp


def player(nb, parity, even_odd_monitor):
    for _ in range(3):
        if parity == 0:
            even_odd_monitor.even(nb)
        else:
            even_odd_monitor.odd(nb)
        
if __name__ == '__main__':

    even_odd_monitor = EvenOdd()

    evens = [Process(target=player, args=(nb, 0,even_odd_monitor)) for nb in range(4)]
    odds = [Process(target=player, args=(nb, 1,even_odd_monitor)) for nb in range(4)]

    for process in evens+odds:
        process.start()

    for process in evens+odds:
        process.join()
        
    
