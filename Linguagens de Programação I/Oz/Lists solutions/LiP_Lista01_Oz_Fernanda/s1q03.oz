/* Pascal of section 1.5 */

     Quando N == 0. 
     {Pascal 0 } == [1] retorna o valor correto.
     Para N == N-1: Suponha que {Pascal N-1} está correto. 
     Podemos assumir que AddList, ShiftList e LeftList também estão corretas. 
     Logo, {Pascal N} pode ser calculado como a soma de cada elemento de [0, ... {Pascal N-1}] e [... {Pascal N-1}, 0].
     Com a definição {AddList {ShiftLeft {Pascal N-1}} {ShiftRight {Pascal N-1}}}
     Por hipótese  {Pascal N-1}, AddList, ShiftLeft, ShiftRight estão corretos
     {Pascal N} também retorna a resposta correta.
     
