functor
export
andG:AndG orG:OrG xOrG:XOrG nandG:NandG norG:NorG

define
fun {GenerateGate F}
   fun{$ Xs Ys}
      fun {FLoop Xs Ys}
         case Xs#Ys of (X|Xr)#(Y|Yr) then {F X Y}|{FLoop Xr Yr} end
      end
   in
      thread {FLoop Xs Ys} end
   end
end
AndG={GenerateGate fun {$ X Y} X*Y end}
OrG ={GenerateGate fun{$ X Y} X+Y-X*Y end}
XOrG ={GenerateGate fun{$ X Y} X+Y-2*X*Y end}
NandG={GenerateGate fun {$ X Y} 1-X*Y end}
NorG ={GenerateGate fun {$ X Y} 1-X-Y+X*Y end}
end