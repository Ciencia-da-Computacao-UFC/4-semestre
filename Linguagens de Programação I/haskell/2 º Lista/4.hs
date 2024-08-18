notaFinal :: Float -> Float -> Float -> Float
notaFinal a b c =  (a*2)+(b*3)+(c*5)/10

classFinal :: Float -> Char
classFinal x | (x<5) = 'E'
	     | (x<6) = 'D'
	     | (x<7) = 'C'
	     | (x<8) = 'B'
	     | otherwise = 'A'

returnClass :: Float->Float->Float->Char
returnClass a b c = classFinal (notaFinal a b c) 

