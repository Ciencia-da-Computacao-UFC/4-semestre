import time
import random

def intercalate(array, start, middle, end):
    beginning = start
    j = middle + 1
    final_array = []
    while(start <= middle and j <= end):
        if(array[start] < array[j]):
            final_array.append(array[start])
            start += 1
        else:
            final_array.append(array[j])
            j += 1
    
    while( start <= middle):
        final_array.append(array[start])
        start += 1

    while(j <= end):
        final_array.append(array[j])
        j += 1

    # w = 0
    # for i in range(start, n+1):
    #     array[i] = final_array[w]
    #     w += 1
    array[beginning:end+1] = final_array



def mergeSortRec(array, i, j):
    if(i == j): return
    k = int((i+j)/2)
    mergeSortRec(array, i, k)
    mergeSortRec(array, k+1, j)
    intercalate(array, i, k, j)
    
array = []
for i in range(1000000000):
    array.append(i)
# array = [random.randint(1,100000000) for _ in range(100000000)]
#array = [32,1,3,45,-2,9,12,0]
start_time = time.clock()

# mergeSortRec(array, 0, len(array)-1)
array.sort()
print(time.clock() - start_time, "seconds")
#print(array)
