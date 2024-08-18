lastList::[Int]->Int
lastList [x] = x
lastList (x:xs) = lastList xs

firstLastList::[Int]->(Int,Int)
firstLastList [] = error"lista vazia"
firstLastList [x] = (x,x)
firstLastList (x:xs) = (x,lastList xs)

