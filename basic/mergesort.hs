import Data.List.Split

merge :: (Ord a) => [a] -> [a] -> [a]
merge left []       = left
merge [] right      = right
merge (l:lx) (r:rx)
    | l <= r        = l : merge lx (r:rx)
    | otherwise     = r : merge (l:lx) rx

mergesort :: (Ord a) => [a] -> [a]
mergesort []     = []
mergesort (x:[]) = [x]
mergesort list   = merge leftHalf rightHalf 
    where mid         = length list `div` 2
          listHalves  = splitPlaces [mid, length list - mid] list 
          leftHalf    = mergesort (listHalves !! 0)
          rightHalf   = mergesort (listHalves !! 1)

main = do
    putStrLn $ mergesort "anhuydonguyen"
    putStrLn $ show $ mergesort [-2, 10, 3, 4]
