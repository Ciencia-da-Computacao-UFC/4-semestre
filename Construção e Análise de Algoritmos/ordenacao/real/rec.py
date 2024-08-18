'''teste verifica qtd de chamadas limites da recursão'''

import sys
sys.setrecursionlimit(1000000)
def recurse(n):
    print(n)
    recurse(n+1)

recurse(1)