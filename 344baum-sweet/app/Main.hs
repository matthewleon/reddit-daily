module Main where

import BaumSweet (bsSeq')
import qualified Data.Vector.Unboxed as VU

main :: IO ()
main = print . fmap fromEnum . VU.toList . bsSeq' =<< readLn
