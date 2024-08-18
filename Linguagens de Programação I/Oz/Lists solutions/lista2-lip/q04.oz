case <x> of <label>(<feat>1:<x>1 ... <feat>n:<x>n) then <s>1 else <s>2 end 


if {Label <x>}==<label> then
    if {Arity <x>}==[<feat>1 ... <feat>n] then
       local <x>1=<x>.<feat>1 ... <x>n=<x>.<feat>n in
      <s>1
       end
    else <s>2 end
 else <s>2 end