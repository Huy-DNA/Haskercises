replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n a = a:(replicate' (n - 1) a)

main = do
    putStrLn $ show $ replicate' 10 2
    putStrLn $ show $ replicate' 1 "Haskell" 
    putStrLn $ show $ replicate' 2 "FP"
    putStrLn $ show $ replicate' 0 "OOP"
