zad7 :: Integer -> Integer -> Integer -> [Integer] 
zad7 x y z = if y > x && y> z && z > x then [y, z, x] else if x > y && x> z && z > y then [x, z, y] else if y > x && y> z && x > z then [y, x, z] else if z > x && z> y && x > y then [z, x, y] else if z > x && z> y && y > x then [z, y, x] else if x > y && x> z && y > z then [x,y,z] else [0]

--getNums :: Integer -> [Char]
--getNums = map (read::Integer->Char)

--task9 :: Integer -> [Char]
--task9 num = [num `mod` 10^x | x <- length(num)]



digList :: Integer -> [Integer]
digList n | (n <= 9) = [n]
          | otherwise = (n `mod` 10) : digList (n `div` 10)
 