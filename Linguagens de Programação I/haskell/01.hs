validarPrefixo :: [a] -> [a] -> Bool
-- x é o prefixo e y é o nome que deverá ser analisado
validarPrefixo  [] _= True
validarPrefixo (x:xs) (y:ys) | (x == y) = validarPrefixo xs ys
                             | otherwise = False

validarPrefixoIO :: IO()
validarPrefixoIO = do  putStrLn "Digite o prefixo"
		 x<-getLine
		 putStrLn "Digite a cadeia"
		 y<-getLine
		 if(prefixo x y) then 
			putStrLn "É um prefixo"
		 else 
			putStrLn "Não é um prefixo"
