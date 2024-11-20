#! /usr/bin/python3

import time
import random
import sys
from multiprocessing import Process, Lock, Condition, Value, Array



### Monitor start
class Buffer:
    def __init__(self, nb_cases):
        self.lock = Lock()
        self.c_prod = Condition(self.lock)
        self.c_cons = Condition(self.lock)
        self.nb_cases = nb_cases
        self.storage_val = Array('i', [-1]*nb_cases, lock=False)
        self.storage_type = Array('i', [-1]*nb_cases, lock=False)
        self.ptr_prod = Value('i', 0, lock = False)
        self.ptr_cons = Value('i', 0, lock = False)
        self.current_size = Value('i', 0, lock=False)


    def produce(self, msg_val, msg_type, msg_source):
        with self.lock:
            while(self.current_size.value == self.nb_cases):
                self.c_prod.wait()
            position = self.ptr_prod.value
            print('process %2d starts prod %2d (type:%d) in place %2d and the buffer is\t\t %s' %
                  (msg_source, msg_val, msg_type, position, self.storage_val[:]))
            time.sleep(random.random())
            self.storage_val[position] = msg_val
            self.storage_type[position] = msg_type
            self.current_size.value += 1
            self.ptr_prod.value = (position + 1) % self.nb_cases
            print('process %2d    produced %2d (type:%d) in place %2d and the buffer is\t\t %s' %
                  (msg_source, msg_val, msg_type, position, self.storage_val[:]))

            self.c_cons.notify()


    def consume(self, id_cons):
        with self.lock:
            while(self.current_size.value == 0):
                self.c_cons.wait()
            position = self.ptr_cons.value
            result = self.storage_val[position]
            result_type = self.storage_type[position]
            print('\tprocess %2d starts cons %2d (type:%d) in place %2d and the buffer is\t %s' %
                  (id_cons, result, result_type, position, self.storage_val[:]))
            time.sleep(random.random())
            self.storage_val[position] = -1
            self.storage_type[position] = -1
            self.current_size.value -= 1
            self.ptr_cons.value = (position + 1) % self.nb_cases
            print('\tprocess %2d    consumed %2d (type:%d) in place %2d and the buffer is\t %s' %
                  (id_cons, result, result_type, position, self.storage_val[:]))
            self.c_prod.notify()
            return result

#### Monitor end

def producer(msg_val, msg_type, msg_source, nb_times, buffer):
    for _ in range(nb_times):
        time.sleep(random.random())
        buffer.produce(msg_val, msg_type, msg_source)
        msg_val += 1


def consumer(id_cons, nb_times, buffer):
    for _ in range(nb_times):
        time.sleep(random.random())
        buffer.consume(id_cons)


if __name__ == '__main__':
    if len(sys.argv) != 6:
        print("Usage: %s <Nb Prod <= 20> <Nb Conso <= 20> <Nb Cases <= 20> <Nb times prod> <Nb times cons>" % sys.argv[0])
        sys.exit(1)

    nb_prod = int(sys.argv[1])
    nb_cons = int(sys.argv[2])
    nb_cases = int(sys.argv[3])

    # Question 1:
    nb_times_prod = int(sys.argv[4])
    nb_times_cons = int(sys.argv[5])

    # nb_times_prod = 2
    # nb_times_cons = 2

    buffer = Buffer(nb_cases)
    
    producers, consumers = [], []
    
    for id_prod in range(nb_prod):
        msg_val_start, msg_type, msg_source = id_prod * nb_times_prod, id_prod % 2, id_prod
        prod = Process(target=producer, args=(msg_val_start, msg_type, msg_source, nb_times_prod, buffer))
        prod.start()
        producers.append(prod)

    for id_cons in range(nb_cons):
        cons=Process(target=consumer, args=(id_cons, nb_times_cons, buffer))
        cons.start()
        consumers.append(cons)

    for prod in producers:
        prod.join()

    for cons in consumers:
        cons.join()
