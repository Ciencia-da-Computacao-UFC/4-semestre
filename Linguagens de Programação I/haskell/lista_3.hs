-- questao 1

intersperse :: a -> [a] -> [a]
intersperse _ [a] = [a]
intersperse a (x:xs) = a : x : intersperse a xs  

-- questao 2

insert :: Ord a => a -> [a] -> [a]
insert a [] = [a]
insert a (x:xs) = if a < x then a : x : xs
                  else x : insert a xs

-- questao 3
