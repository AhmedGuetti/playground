#!/usr/bin/python3

from multiprocessing import Process, Lock, Condition, Value
import time
import random

# 1) Specification
# Monitor Court:
#     askCourt()
#     startPlay()
#     freeCourt()

# 2) Blocking and unblocking conditions
# Blocking: either:
#    - outside and 2 are either playing inside or finished playing and did not yet all left
#    - inside and alone and the game did not yet start
# Unblocking:
#    - outside and the last player of the last game has left
#    - inside and another player has come

# 3) Variables
# State:
# - alone -> number of player on the court : nb_players
# - the game did not yet start : playing
# - last player of the last game : exiting
# Conditions:
# One for players outside, one for players inside

# Monitor start
class Court:
    def __init__(self):
        self.lock = Lock()  
        self.court = Condition(self.lock)  
        self.outside = Condition(self.lock)
        self.nb_players = Value('i', 0)
        self.playing = Value('i', 0)
        self.exiting = Value('i', 0)
        
    def askCourt(self):
        with self.lock:
            while self.playing.value != 0 or self.nb_players.value >= 2:
                self.outside.wait()
            self.nb_players.value += 1
            if self.nb_players.value == 1:
                self.outside.notify()

    def startPlay(self):
        with self.lock:
            while self.nb_players.value == 1 and self.playing.value == 0:
                self.court.wait()

            self.playing.value += 1
            if self.playing.value == 1:
                self.court.notify()
        
    def freeCourt(self):
        with self.lock:
            self.nb_players.value -= 1
            self.exiting.value += 1
            if self.exiting.value == 2:
                self.exiting.value = 0
                self.playing.value = 0
                self.outside.notify()
# Monitor end

def player(nb, court):
    time.sleep(random.random())
    print(f'{nb} is waiting outside')
    court.askCourt()
    print(f'{nb} is waiting inside')
    court.startPlay()

    print(f'{nb} is playing')
    time.sleep(random.random())
    court.freeCourt()
    print(f'{nb} has left')

if __name__ == '__main__':
    court = Court()
    processes = []
    for i in range(10):
        p = Process(target=player, args=(i, court,))
        p.start()
        processes.append(p)

    for p in processes:
        p.join()
