type NimBoard = [Int]

getInt :: IO Int
getInt = getLine  >>= return . read

initNimBoard :: IO NimBoard
initNimBoard = do
    putStrLn "Enter the number of rows: "
    numRows <- getInt
    let getRow i = do
        putStrLn ("Enter the number of stones in row " ++ show i ++ ": ")
        getInt
    sequence [ getRow i | i <- [1..numRows] ] 

printNimBoard :: NimBoard -> IO ()
printNimBoard board = sequence_ [ printLine rowAmount | rowAmount <- board ]
    where printLine rowAmount = putStrLn (replicate rowAmount '*') 

notEmptyBoard :: NimBoard -> Bool
notEmptyBoard board = False `elem` fmap (== 0) board

removeFromRow :: NimBoard -> Int -> Int -> NimBoard
removeFromRow board row amount = if board !! row < amount
    then error "The actual number of stones is smaller!"
    else [if i == row 
              then board !! i - amount
              else board !! i
          | i <- [0..length board - 1]] 

main = do
    nimBoard <- initNimBoard
    putStrLn "Initial board:"
    printNimBoard nimBoard
    let play turn board = do
        putStrLn ""
        putStrLn ("Player " ++ show turn ++ "'s turn: ")
        putStrLn "How many stones? "
        amount <- getInt
        putStrLn "Which row? "
        row <- getInt
        let newBoard = removeFromRow board (row - 1) amount
        if (not . notEmptyBoard $ newBoard)
            then do
                putStrLn ("Player " ++ show turn ++ " has won") 
                return ()
            else do
                putStrLn ""
                putStrLn "Current board: "
                printNimBoard newBoard
                play (2 - (turn + 1) `mod` 2) newBoard
    play 1 nimBoard

