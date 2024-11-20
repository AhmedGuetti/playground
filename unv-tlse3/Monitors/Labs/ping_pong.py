#!/usr/bin/python3

# 1) Specification
# PingPong
#     access()
#     free()

# 2) Blocking and unblocking conditions
# Blocking: last side same as mine OR someone already on my side
# Unblocking: someone of the other side just finished

# 3) state and condition variables
# state: 'last side' and 'someone already' need two variables ; previous and playing
# conditions : two categories, need two conditions

# 4) Code

from multiprocessing import Process, Value, Array, Lock, Condition

import os
import random
import sys
import time

class PingPong :
    def __init__ (self) :
        self.previous = Value('i', 1, lock=False)
        self.playing = Value('i', 0, lock=False)
        self.verrou = Lock()
        self.acces = [Condition(self.verrou), Condition(self.verrou)]

    def access (self, rang, side) :
        with self.verrou:
            while self.previous.value == side or self.playing.value == 1:
                self.acces[side].wait()
            self.playing.value = 1

    def free (self, rang, side) :
        with self.verrou:
            self.playing.value = 0
            self.previous.value = side
            self.acces[(side+1)%2].notify()

def player (rang, side, monitor) :
    name = ['Ping', 'Pong']
    time.sleep(.1 + random.random())
    monitor.access(rang, side)
    print("Player", rang, "starts", name[side])
    time.sleep(.2 + random.random())
    monitor.free(rang, side)

if __name__ == '__main__' :

    if len(sys.argv) != 2 :
        print(f'Usage {sys.argv[0]} <nb players>')
        sys.exit(1)

    nbPlayers = int(sys.argv[1])

    processes = []
    monitor = PingPong()

    for rang_proc in range(nbPlayers) :
        proc = Process(target=player, args=(rang_proc, rang_proc%2, monitor))
        processes.append(proc)
        proc.start()

    for proc in processes :
        proc.join()
