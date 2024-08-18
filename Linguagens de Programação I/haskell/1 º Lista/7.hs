suc :: Int -> Int
suc x = x+1

ant :: Int -> Int
ant x = x-1

mult :: Int -> Int -> Int
mult x y | x>0 = y + mult (ant x) y
         | otherwise = 0