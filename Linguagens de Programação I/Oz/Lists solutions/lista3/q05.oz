declare
fun {SumList Xs}
   fun {SumListIterative Ys A}
      case Ys
      of nil then A
      [] Y|Yr then {SumListIterative Yr A+Y} end
   end
in
   {SumListIterative Xs 0}
end

{Browse {SumList [1 2 3 4 5]}}