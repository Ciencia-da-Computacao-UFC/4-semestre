declare
local
   fun {NotLoop Xs}
      case Xs of X|Xr then (1-X)|{NotLoop Xr} end
   end
in
   fun {NotG Xs}
      thread {NotLoop Xs} end
   end
end
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
declare
proc {Circuit1 X Y Z ?C ?S}
   K L M
in
    K={XOrG X Y}
    S={XOrG K Z}
    L={AndG K Z}
    M={AndG X Y}
    C={OrG L M}
end
declare
Z0=0|0|0|_
X0=1|1|0|_ Y0=0|1|0|_ C0 S0
X1=0|0|1|_ Y1=1|1|1|_ C1 S1
X2=0|0|0|_ Y2=0|0|0|_ C2 S2
in
{Circuit1 X0 Y0 Z0 C0 S0}
{Circuit1 X1 Y1 C0 C1 S1}
{Circuit1 X2 Y2 C1 C2 S2}
{Browse input}
{Browse X0#Y0}
{Browse X1#Y1}
{Browse X2#Y2}
{Browse output}
{Browse S0}
{Browse S1}
{Browse S0}