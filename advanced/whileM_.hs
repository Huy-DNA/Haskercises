-- Repeat an action until a condition is false

whileM_ :: Monad m => m Bool -> m a -> m ()
whileM_ p f =
    p >>= \cond -> if cond
        then f >> whileM_ p f
        else return () 

main = whileM_ 
         (getLine >>= \input ->
            if input == "end"
                then return False
                else return True)
         (putStrLn "Enter 'end' to terminate!")
