dobroList :: [Int] -> [Int]
dobroList [] = []
dobroList (x:xs) = x*2:dobroList xs