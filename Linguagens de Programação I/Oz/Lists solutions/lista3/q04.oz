declare
fun {Fact N}
  fun {FactIterative N A}
     if N==1 then A
     else {FactIterative N-1 N*A} end
  end
in
  {FactIterative N 1}
end
 
{Browse {Fact 10}}