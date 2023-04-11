reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x]

main = do
    putStrLn $ show $ reverse' ([] :: [Int])
    putStrLn $ reverse' []
    putStrLn $ show $ reverse' [1,4..10]
