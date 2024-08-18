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

def k_esim(array, start, end, k):
    h = partition(array, start, end)
    if(k == h+1): return array[h]
    if(k < h+1): return k_esim(array, start, h-1, k)
    if(k > h+1): return k_esim(array, h+1, end, k)
    

array = [5,8,2,3,10,9]
print(k_esim(array, 0, len(array)-1, len(array)-1))
# print(partition(array, 4, len(array)-1))
# print(array)
# print(array)
