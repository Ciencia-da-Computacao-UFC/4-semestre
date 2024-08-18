import Data.Char
main :: IO()
main = do putStr "Digite uma palavra"
              word<-getLine
	  if validWord word then putStr reverse word
	  else putStr "ERROR"
	  

validWord :: String -> Bool
validWord [] = True
validWord (x:xs) = if isLetter x then validWord xs
		   else False
