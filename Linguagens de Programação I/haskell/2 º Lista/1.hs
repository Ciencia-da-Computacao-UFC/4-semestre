myMax :: Int -> Int -> Int ->Int
myMax x y z | x>y && x>z = x
            | y>z = y
            | otherwise = z