map1 :: (a -> b) -> [a] -> [b]
map1 _ [] = []
map1 f (x:xs) = f x : map1 f xs

main = do
    putStrLn "Enter a list of integers: "
    list <- read <$> getLine
    putStrLn "Enter an unary function in Haskell's syntax (for example, + 2): "
    putStrLn . ("Doubled: " ++ ) . show $ map1 (* 2) list 
