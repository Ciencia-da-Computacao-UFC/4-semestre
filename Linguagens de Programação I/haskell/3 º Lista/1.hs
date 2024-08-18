intersperse :: (Ord a) => a -> [a] -> [a]
intersperse _ [] = []
intersperse _ [x] = [x]
intersperse key (x:xs)= x : key : intersperse key xs
