sizeList :: [Int] -> Int
sizeList [] = 0
sizeList (x:xs) = 1 + sizeList xs 
