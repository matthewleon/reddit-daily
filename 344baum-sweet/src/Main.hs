module Main where

import qualified Data.Array as A

main :: IO ()
main = print . A.elems . fmap fromEnum . bsSeq =<< readLn

bsSeq :: Int -> A.Array Int Bool
bsSeq sz = bs
  where
  bs :: A.Array Int Bool
  bs = A.listArray (0, sz - 1) $ True : (b <$> [1..])

  b :: Int -> Bool
  b n =
    if n `mod` 4 == 0
      then bs A.! (n `div` 4)
      else odd n && (bs A.! ((n - 1) `div` 2))
