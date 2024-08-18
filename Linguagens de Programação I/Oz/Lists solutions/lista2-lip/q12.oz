try <s>1 finally <s>2 end

local Boolean = {NewCell false} Exc in
   try
      <s>1
   catch X then
      Exc = X
      Boolean := true
   end
   <s>2
   if Boolean then raise Exc end end
end