-- Passando uma função para uma função
myCount :: (a->Bool) -> [a] -> Int
myCount _ [] = 0
myCount f (x:xs) |(f x) = 1 + myCount f xs
		 | otherwise = myCount f xs

myCountC :: (a->Bool) -> [a] -> Int
myCountC f lista = length ([x|x<-lista,f x])
--outra alternativa seria length (filter f lista)

import Data.Char
extra :: String -> Int
extra lista = length(lista)-(count isLetter lista)
