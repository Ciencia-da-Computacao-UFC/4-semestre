ord :: (Ord a) => [a] -> [a]
ord [] = []
ord (x:xs) = ord (filter (<x) xs)++[x]++ord (filter (>=x) xs)
