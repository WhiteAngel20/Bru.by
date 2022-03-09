fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib 2 = 2
fib n = if n < 0 then error "negative argument"
	else fib(n-1)+fib(n-2) 

task2 :: Int -> [Int]
task2 n | n == 0 = []
	    | otherwise = task2 (n) ++ [n*n]

task3 :: [a] -> [a]
task3 (x:xs) = task3 xs ++ [x]
task3 [] = []

task4 :: Double -> Double -> [Double]
task4 h l = [sqrt((l/2)^2+h^2), asin(sin(h/sqrt((l/2)^2+h^2)))/pi*180, 180 - 2 * asin(sin(h/sqrt((l/2)^2+h^2)))/pi*180]








task41 :: Double -> Double -> Double -> Bool
task41 a b c = if a+b == c then False else True

task5 :: [Int] -> Int
task5 [] = 0 
task5 (x:xs) = (task5 xs) + if (x == 0) then 1 else 0


			


		
