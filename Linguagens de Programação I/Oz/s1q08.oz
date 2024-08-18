% Podemos ver que a célula de memória está sendo declarada e incializada dentro da função,
% os argumentos são salvos em áreas diferentes, no armazenamento. Isso faz com que o acumulador não acumule os inputs

declare
local Acc = {NewCell 0} in
   fun {Accumulate N}
      Acc:=@Acc+N
      @Acc
   end
end

{Browse {Accumulate 5}}
{Browse {Accumulate 100}}
{Browse {Accumulate 34}}