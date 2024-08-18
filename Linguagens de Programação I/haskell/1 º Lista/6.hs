nMedia :: [Float] -> Float
nMedia [] = error "Lista vazia"
nMedia lista = sum lista / fromIntegral (length lista)