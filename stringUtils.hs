module StringUtils
  ( contains,
    replaceFirst,
    replaceAll,
    strip,
    join,
    split,
  )
where

import Data.Char (isSpace)
import Data.List (dropWhile, intercalate)

slidingWindow :: Int -> String -> [String]
slidingWindow n s
  | n > length s = []
  | otherwise = take n s : slidingWindow n (tail s)

-- | Returns True if the second string contains the first string as a substring.
contains :: String -> String -> Bool
contains pattern s = pattern `elem` partitioned
  where
    patLen = length pattern
    partitioned = slidingWindow patLen s

findStartingIndex :: String -> String -> Maybe Int
findStartingIndex pattern s
  | not $ contains pattern s = Nothing
  | otherwise = Just $ loop pattern s 0
  where
    patLen = length pattern
    loop :: String -> String -> Int -> Int
    loop pat s counter
      | take patLen s == pattern = counter
      | otherwise = loop pattern (tail s) (counter + 1)

-- | Replaces the first occurrence of a pattern in a string with the given replacement.
replaceFirst :: String -> String -> String -> String
replaceFirst pattern replacement s = case findStartingIndex pattern s of
  Nothing -> s
  Just i -> take i s ++ replacement ++ drop (i + patLen) s
    where
      patLen = length pattern

-- | Replaces all occurrences of a pattern in a string with the given replacement.
replaceAll :: String -> String -> String -> String
replaceAll pattern replacement s
  | s `contains` pattern = replaceAll pattern replacement $ replaceFirst pattern replacement s
  | otherwise = s

stripFront :: String -> String
stripFront s = map fst cleaned
  where
    mask = map isSpace s
    combined = zip s mask
    cleaned = dropWhile snd combined

stripBack :: String -> String
stripBack = reverse . stripFront . reverse

-- | Removes leading and trailing whitespace from a string.
strip :: String -> String
strip = stripFront . stripBack

-- | Joins the input list of strings to a single string using the given separator string.
join :: String -> [String] -> String
join _ [] = ""
join sep xs = intercalate sep xs

-- | Splits the input string into substrings separated by the given separator string.
split :: String -> String -> [String]
split _ "" = [""]
split sep s = go s
  where
    sepLen = length sep

    go "" = [""]
    go str = case findStartingIndex sep str of
      Nothing -> [str]
      Just i ->
        let (first, rest) = splitAt i str
            remaining = drop sepLen rest
         in first : go remaining
