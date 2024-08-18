import time
import random

def insertionSort(array):
    for i in range(1, len(array)):
        j = i
        while(array[j] < array [j-1] and j > 0):
            aux = array[j-1]
            array[j-1] = array[j]
            array[j] = aux
            j = j - 1
    return array




array = [random.randint(1,10000) for _ in range(10000)]

start_time = time.clock()

insertionSort(array)

print(time.clock() - start_time, "seconds")
