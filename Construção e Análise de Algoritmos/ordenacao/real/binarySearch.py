import time
import random

def binarySearch(array, i, n, x):
    if(i > n): return "x not found"
    k = (i+n)//2
    if(x == array[k]): return k
    elif(x < array[k]): return binarySearch(array, i, k-1, x)
    elif(x > array[k]): return binarySearch(array, k+1, n, x)

array = [1,2,3,4,12,24,34,100]
a = int(input())
print(binarySearch(array,0,(len(array)-1),a))

