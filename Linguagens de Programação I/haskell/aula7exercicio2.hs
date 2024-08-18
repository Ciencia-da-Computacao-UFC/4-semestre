import Data.Char
main :: IO()
main = do putStr "Digite uma sentença:"
	  x<-getLine 
	  if x /= [] then
		putStrLn (map toUpper x) >> main
	  else
		return ()
			
