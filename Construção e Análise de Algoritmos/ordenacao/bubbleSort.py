# import random

# def bubble_sort(v):
#     fim = len(v)
#     while fim > 0:

#         i = 0
#         #percorrendo o vetor de 0 até fim
#         while i < fim-1:
#             if v[i] > v[i+1]:
#                 aux = v[i]
#                 v[i] = v[i+1]
#                 v[i+1] = aux
#                 print(v)
#             i +=1

#         fim = fim-1

# # vetor = list(range(0,10)) #cria uma lista com n posições
# # random.shuffle(vetor)     #desordena a lista

# v = [2,1,4,34,-3,0,22]
# print(v)

# bubble_sort(v)

# print(v)


#versão usando for

def bubble_sort(v):
    for i in range(len(v)-1, 0, -1):
        for j in range(i):
            if v[j] > v[j+1]:
                aux = v[j]
                v[j] = v[j+1]
                v[j+1] = aux
                print(v)

v = [23,4,89,3,2,3,5]
print(v)
bubble_sort(v)
print(v)