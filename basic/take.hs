take1 :: Int -> [a] -> [a]
take1 n (x:xs)
   | n <= 0 = []
   | otherwise = x:(take1 (n - 1) xs)
take1 n [] = [] 

take2 :: Int -> [a] -> [a]
take2 n xs
   | n <= 0 = []
   | otherwise = [xs!!i | i <- [0..n-1], i < length xs]

main = do
   putStrLn "Test take1"
   putStrLn $ show $ take1 3 [8, 6, 3]
   putStrLn $ show $ take1 (-2) ['a', 'b', 'c']
   
   putStrLn "Test take2"
   putStrLn $ show $ take2 3 [8, 6, 3]
   putStrLn $ show $ take2 (-2) ['a', 'b', 'c']
