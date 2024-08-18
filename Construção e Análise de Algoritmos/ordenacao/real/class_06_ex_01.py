from time import perf_counter
import sys
sys.setrecursionlimit(10000000)

def findMatch(array, i, j):
    if(i > j): return "Not found!"
    if(array[i] == i): return i
    if(array[j] == j): return j
    if(array[i] > i and array[j] < j): return findMatch(array, array[i], array[j])
    if(array[i] < i and array[j] > j): return findMatch(array, i+1, j-1)
    if(array[i] > i): return findMatch(array, array[i], j-1)
    if(array[j] < j): return findMatch(array, i+1, array[j])

def findMatch2(array):
    for i in range(len(array)):
        if(array[i] == i): return i

# array = [1,2,3,4,4,15,15,15]

array = []
for i in range(1000000):
    array.append(i+1)
# array[99999999] = 99999999

start_time = perf_counter()

# print(findMatch2(array))
print(findMatch(array,0,len(array)-1))
print(perf_counter() - start_time, "seconds")