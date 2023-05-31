foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' _ initial [] = initial
foldl' f initial (x:xs) = foldl' f (f initial x) xs

main = do
    putStrLn "Enter an integer array:"
    list <- read <$> getLine
    putStrLn . ("Result: " ++) . show $ foldl' (+) 0 list 
