areaTri :: Float -> Float ->Float->Float
areaTri a b c | (verif a b c) = let s = (a+b+c)/2 in sqrt(s*(s-a)*(s-b)*(s-c))
	      | otherwise = error "Não são valores possiveis!"

verif :: Float -> Float -> Float -> Bool 
Verif a b c | and [(a<b+c),(b<a+c),(c<a+b),(a>0),(b>0),(c>0)] = True
	    | otherwise = False 
