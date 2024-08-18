-- questao 1 OK!

max3 :: Int -> Int -> Int -> Int
max3 a b c = if (a > b && a > c) then a
             else if (b > c && b > a) then b
             else c 

max3ez :: Int -> Int -> Int -> Int
max3ez a b c = maximum [a, b, c]

-- questao 2 OK!

intercala :: [a] -> [a] -> [a]
intercala a [] = a
intercala [] a = a
intercala (x:xs) (y:ys) = x : y : intercala xs ys


-- questao 3 OK!

areaTri :: Double -> Double -> Double -> Double
areaTri a b c = if validaTriangulo a b c then sqrt(s*(s-a)*(s-b)*(s-c))
                else 0
                where s = (a + b + c) / 2

validaTriangulo :: Double -> Double -> Double -> Bool
validaTriangulo a b c = if a + b > c && b + c > a && a + c > b then True
                        else False

-- questao 4 OK!

notaConceito :: Double -> Double -> Double -> Char
notaConceito a b c = if media >= 8 then 'A'
                     else if media >= 7 then 'B'
                     else if media >= 6 then 'C'
                     else if media >= 5 then 'D'
                     else 'E'
                     where media = calcMedia a b c

calcMedia :: Double -> Double -> Double -> Double
calcMedia a b c = (a*2 + b*3 + c*5) / 10 

-- questao 5

precoRetrato :: Int -> String -> Double
precoRetrato num_p dia = if acrescimo dia then 
                            if num_p == 1 then 100 + 0.2 * 100
                            else if num_p == 2 then 130 + 0.2 * 130
                            else if num_p == 3 then 150 + 0.2 * 150
                            else if num_p == 4 then 165 + 0.2 * 165
                            else if num_p == 5 then 175 + 0.2 * 175
                            else if num_p == 6 then 180 + 0.2 * 180
                            else 185 + 0.2 * 185
                            
                         else
                            if num_p == 1 then 100
                            else if num_p == 2 then 130
                            else if num_p == 3 then 150
                            else if num_p == 4 then 165
                            else if num_p == 5 then 175
                            else if num_p == 6 then 180
                            else 185
                         
                            

acrescimo :: String -> Bool
acrescimo dia = if dia == "sábado" || dia == "domingo" then True
                else False