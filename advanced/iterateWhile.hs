-- Repeatedly execute an action until its result fails to satisfy a condition, returns that result
iterateWhile :: Monad m => (a -> Bool) -> m a -> m a
iterateWhile pred action = do
    res <- action
    if pred res
        then iterateWhile pred action
        else return res

main = do
    oddNum <- iterateWhile odd getInt
    putStr "First even number: "
    putStrLn . show $ oddNum
        where getInt = getLine >>= (return . read) 
