functor
import F at '/home/fer/workspace/ufc/lip/trabalho2/logicalGates.ozf'    
export
circuit1:Circuit1 circuit2:Circuit2 circuit3:Circuit3

define
proc {Circuit1 X Y Z ?C ?S}
    K L M
in
    K={F.xOrG X Y}
    S={F.xOrG K Z}
    L={F.andG K Z}
    M={F.andG X Y}
    C={F.orG L M}
end
proc {Circuit2 X Y Z ?C ?S}
    K L M N
 in
    K={F.orG X Y}
    L={F.orG Y Z}
    M={F.orG Z X}
    N={F.andG K L}
    S={F.nandG N M}
 end
 proc {Circuit3 X Y Z ?C ?S}
    K L M N O P Q
 in
    K={F.norG X Y}
    L={F.norG X K}
    M={F.norG K Y}
    N={F.norG L M}
    O={F.norG N Z}
    P={F.norG N O}
    Q={F.norG O Z}
    C={F.norG Q M}
    S={F.norG P Q}
 end
end    