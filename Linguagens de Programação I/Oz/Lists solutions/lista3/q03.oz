declare
fun {BscMethod F A B}
   X = (A+B)/2.0
   V = {F X}
in
   if {Abs V} < 0.0001 then X
   else
      if V > 0.0 then {BscMethod F A X}
      else {BscMethod F X B} end
   end	 
end

declare
fun {BscMethod F A B}
   fun {BscMethodIter A B}
      X = (A+B)/2.0
      V = {F X}
   in
      if {GoodEnough V} then X
      else A1 B1 in
	 A1#B1={Improve A B V X}
	 {BscMethodIter A1 B1}
      end
   end
   fun {GoodEnough V}
      {Abs V} < 0.00001
   end
   fun {Improve A B V X}
      if V > 0.0 then A#X
      else X#B end
   end
in
   {BscMethodIter A B}  
end

{Browse {BscMethod fun{$ X} X*X - 2.0 end 0.0 2.0}}