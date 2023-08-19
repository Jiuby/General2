import Control.Monad
import Data.List

isWordPossible :: String -> String -> Bool
isWordPossible word letters = all (\c -> count c letters >= count c word) word
  where
    count :: Char -> String -> Int
    count c = length . filter (== c)

solve :: FilePath -> FilePath -> IO ()
solve dictionaryPath inputPath = do
  dictionaryContents <- readFile dictionaryPath
  inputContents <- readFile inputPath
  let dictionary = lines dictionaryContents
      inputLines = lines inputContents
      testCases = read (head inputLines) :: Int
      cases = tail inputLines
      processCase caseLine = do
        let [wordLength, letters] = words caseLine
            matchingWords = filter (\word -> length word == read wordLength && isWordPossible word letters) dictionary
            wordCount = length matchingWords
        putStr $ show wordCount ++ " "
  
  mapM_ processCase (take testCases cases)
  putStrLn ""

main :: IO ()
main = solve "dictionary.txt" "input.txt" -- Reemplaza con los nombres reales de los archivos
