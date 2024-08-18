myZipp :: [Int] -> [Int] ->[(Int,Int)]
myZipp [] _ = []
myZipp _ [] = []
myZipp (x:xs) (z:zs) = (x,z) : myZipp xs zs