elem1 :: (Eq a) => a -> [a] -> Bool
elem1 _ [] = False
elem1 i (x:xs) = (x == i) || elem1 i xs 

elem2 :: (Eq a) => a -> [a] -> Bool
elem2 i = foldr (||) False . fmap (== i)

main = do
   putStrLn $ show $ 1 `elem1` [1,2,3,4]
   putStrLn $ show $ 'a' `elem1` ['b','c','d']
   putStrLn $ show $ 1 `elem2` [1,2,3,4]
   putStrLn $ show $ 'a' `elem2` ['b','c','d']
