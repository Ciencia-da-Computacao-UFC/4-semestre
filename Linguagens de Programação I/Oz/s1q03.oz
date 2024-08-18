/* Pascal of section 1.5 */

Vamos supor que o conjunto de funções: AddList, ShiftRight e Shift Left realizam bem as suas funções.
Prova (Pascal): Seja N = 1, a sua definição satisfaz, está correto, então Pascal está correto!

Prova (ShiftLeft): ShiftRight está correto.

Prova (ShiftRight): ShiftLeft é a operação de adicionar 0 ao final de uma lista.
(i) Suponha que a definição é satisfeita para toda lista L com N elementos. Ao passar uma lista L de N + 1 elementos como um argumento,
 ShiftLeft decompõe L em cabeça H e cauda T, passa a cauda T para ShiftLeft e a combina com H. 
Assumindo que 0 é adicionado ao final de T, a definição é satisfeita quando o número de elementos é N + 1.
(ii) Lista com 1 elemento. A lista é decomposta em seus elementos e nula. Uma vez que nil se torna 0 ao ser passado como
     um argumento para ShiftLeft, 0 é adicionado ao fim da lista quando  N é 1.

(i) (ii) Indução matemática, Shift Left satisfaz a definição.
Prova (AddList): AddList é uma operação para adicionar os N's elementos de uma lista com o número de elementos N.
(i) Quando a lista do número de elementos N é adicionada corretamente, a lista do número de elementos N + 1 também é adicionada corretamente.
