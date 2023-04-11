zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):(zip' xs ys)

main = do
   putStrLn $ show $ zip' [1,2,3,4] ['a','b','c','d','e']
