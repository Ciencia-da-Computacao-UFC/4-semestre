declare Comb3
fun {Comb3 N K}
   if 2 * K =< N then {Comb N K}
   else {Comb N N-K} end
end

declare Fact Comb
fun {Fact N}
   if N == 0 then 1
   else N * {Fact N-1} end
end
fun {Comb N K}
   if K==0 then 1
   else {Fact N} div ({Fact N-K} * {Fact K}) end
end

{Browse {Comb3 4 2}}