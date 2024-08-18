import time
import random

def insertion(array, x, m):
    if(m == len(array)): array.append(x)
    elif(m < len(array)): array[m] = x
    k = m  
    while(k > 0):
        parent = int((k-1)/2)
        if(array[k] > array[parent]):
            aux = array[k]
            array[k] = array[parent]
            array[parent] = aux
            k = parent
        else:
            break
    return array


def heapify(array):
    for i in range(1,len(array)):
        insertion(array, array[i], i)
    return array


def deletion(array, length):
    if(length == 0): return "Heap is empty"
    aux = array[0]
    array[0] = array[length-1]
    k = 0
  
    while(2*(k+1)-1 < length):   
        child_1 = 2*(k+1)-1
        child_2 = 2*(k+1)
 
        if(length-1 == 2*(k+1)-1 or array[child_1] > array[child_2]):
            if(array[k] > array[child_1]): break
            aux_1 = array[k]
            array[k] = array[child_1]
            array[child_1] = aux_1
            k = child_1
        else:
            if(array[k] > array[child_2]): break
            aux_1 = array[k]
            array[k] = array[child_2]
            array[child_2] = aux_1
            k = child_2
    return aux


def heapsort(array):
    heapify(array)
    for i in range(len(array)-1,0,-1):
        array[i] = deletion(array, i+1)
    return array


array = [random.randint(1,1000000) for _ in range(1000000)]
start_time = time.clock()




heapsort(array)
print(time.clock() - start_time, "seconds")