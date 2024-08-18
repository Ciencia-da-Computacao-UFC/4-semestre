import random
import time
import sys
sys.setrecursionlimit(12000)

def partition(array, start, end):
    pivot = array[start]
    j = start + 1
    k = end
    while(j <= k):
        if(array[j] > pivot and array[k] <= pivot):
            aux = array[j]
            array[j] = array[k]
            array[k] = aux
        if(array[j] <= pivot): j += 1
        if(array[k] > pivot): k -= 1
    
    aux = array[start]
    array[start] = array[k]
    array[k] = aux
    return k

def quicksort(array, i, j):
    if (i >= j): return
    k = partition(array, i, j)
    quicksort(array, i, k-1)
    quicksort(array, k+1, j)

# array = []
# for i in range (0, 10000):
    # array.append(i)
start_time = time.clock()

array = [random.randint(1,10000) for _ in range(10000)]


quicksort(array, 0, len(array)-1)
print(time.clock() - start_time, "seconds")
# print(array)

