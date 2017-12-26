module Main where

import BaumSweet (bsSeq)

main :: IO ()
main = print . fmap fromEnum . bsSeq =<< readLn

