-- Evaluate each action form left to right and collect the results
mysequence :: Monad m => [m a] -> m [a]
mysequence [] = return []
mysequence (action:actions) = do
    res <- action
    rest <- mysequence actions
    return (res:rest)

main = do
    putStrLn "Enter 5 lines:"
    res <- mysequence [getLine | i <- [1..5]]
    putStrLn . show $ res

