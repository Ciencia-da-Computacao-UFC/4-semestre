getElement :: Int -> [a] -> a
getElement _ [] = error "Lista vazia!"
getElement key (x:xs) | (key==1) = x 
                      | otherwise = getElement (key-1) xs