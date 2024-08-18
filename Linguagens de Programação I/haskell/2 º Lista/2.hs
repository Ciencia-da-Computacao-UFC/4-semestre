dualList :: [Int] -> [Int] -> [Int]
dualList x [] = x
dualList [] y = y
dualList (x:xs) (y:ys) = x:y:dualList xs ys 
