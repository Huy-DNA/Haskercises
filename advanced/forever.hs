-- Repeat an action indefinitely

forever :: Monad m => m a -> m b
forever x = x >> forever x

-- It works like this
---- If x represents some failed computations, the loop will terminate.
---- Otherwise, computation steps on the wrapped value are carried out
---- then the result of an iteration is just ignored (>>)
---- and the loop continues

main = forever $ putStrLn "Hello, world"
