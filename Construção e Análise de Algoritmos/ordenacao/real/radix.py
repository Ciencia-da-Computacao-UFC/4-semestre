import time
import random 
# def getDig(num, d):
#     aux = num
#     while(aux > (d+1)*(10**(d-1))):
#         aux //= 10
#     return int(aux%10)

def getDig(num, d, l):
    for _ in range(d, l):
        num //= 10
    return num%10
    

def radix(array):
    queues = [[],[],[],[],[],[],[],[],[],[]]
    l = len(str(max(array)))

    for k in range (l, 0, -1):
        for j in range(len(array)):
            b = getDig(array[j], k, l)
            queues[b].append(array[j])

        array = []
        for queue in queues:
            for element in queue:
                array.append(element)
        queues = [[],[],[],[],[],[],[],[],[],[]]
        
    return array



array = [random.randint(0,2) for _ in range(10000000)]

start_time = time.clock()

radix(array)
# array.sort()
print(time.clock() - start_time, "seconds")
