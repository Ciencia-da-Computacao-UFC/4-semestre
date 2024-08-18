fun {Leaf X} X\=(_|_) end

essa parte poderia ser reescrita da seguinte maneira:

fun {Leaf X} if X==(_|_) then false else true end end

Se usarmos essa versõa da lista seria ruim, pois ocorreria uma bloqueio. A instrução case pode ter a mesma estrutura mas ao verificar na inclusão, a comparação com o valor indefinido é um fator que bloqueia. 