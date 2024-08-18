boasvindas :: IO ()
boasvindas = do putStr "Como te chamas?\n"
	        nome <-getLine
		putStr ("Bem-vindo, " ++ nome ++ "!\n") 
