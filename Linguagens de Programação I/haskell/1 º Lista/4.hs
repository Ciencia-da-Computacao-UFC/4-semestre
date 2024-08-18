contains :: [Int] -> Int -> Bool
contains [] _ = False
contains (x:xs) key | (key==x) = True
                    | otherwise = contains xs key
                    