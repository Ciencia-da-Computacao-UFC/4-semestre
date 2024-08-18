compareList :: [Int] -> [Int] -> Bool
compareList [] [] = True
compareList [] _ = False
compareList _ [] = False
compareList (a:b) (c:d) | (a == c) = compareList b d
                        | otherwise = False