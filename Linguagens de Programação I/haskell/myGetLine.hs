myGetLine:: IO String
myGetLine = do x<-getChar
	     if x=='\n' then
		return []
	     else
		do xs<-myGetLine
			return(x:xs)
