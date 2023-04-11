partition :: (Ord a) => a -> [a] -> ([a], [a], [a])
partition _ [] = ([], [], [])
partition pivot (x:xs)
    | pivot == x = put x mid (partition pivot xs)
    | pivot > x  = put x left (partition pivot xs)
    | otherwise  = put x right (partition pivot xs)
    where mid = 1
          left = 0
          right = 2
          put x pos (lefts, mids, rights)
            | pos == mid  = (lefts, x:mids, rights)
            | pos == left = (x:lefts, mids, rights)
            | otherwise   = (lefts, mids, x:rights)

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort xs = (quicksort lefts) ++ mids ++ (quicksort rights)
    where (lefts, mids, rights) = partition (xs !! 0) xs

main = do
    putStrLn $ quicksort "anhuydonguyen"
    putStrLn $ show $ quicksort [-2, 10, 3, 4]
