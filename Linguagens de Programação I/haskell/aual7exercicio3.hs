main :: [Int] -> IO ()
main  = do lista<-getList
	print(lista)
	putStr("A soma :" ++ Sum lista ++ "!")
		 
lerInt :: IO (Int)
lerInt = do n<-getLine
	 return (read n)

getList :: IO ([Int])
getList = do n<-lerInt
	 if n == 0 then 
	     return []
	 else do 
	     ns<-getList
	     return (n:ns) 
