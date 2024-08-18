import time
import random

def bubbleSort(array):
    for i in range(0, len(array)-1):
        for j in range(0, len(array)-1-i):
            if(array[j] > array[j + 1]):
                aux = array[j]
                array[j] = array[j + 1]
                array[j+1] = aux
    return array


array = [random.randint(1,10000) for _ in range(10000)]

start_time = time.clock()
bubbleSort(array)

print(time.clock() - start_time, "seconds")


