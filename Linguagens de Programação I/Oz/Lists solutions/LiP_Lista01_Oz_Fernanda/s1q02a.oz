declare Comb Comb2
fun {Comb n k}
   if k==0 then 1
   else n*{Comb n-1 k-1} end
end
fun {Comb2 n k}
   if k==0 then 1
   else {Comb n k} div {Comb k k} end
end

{Browse {Comb2 5 3}}
