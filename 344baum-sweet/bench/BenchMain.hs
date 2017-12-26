module Main where

import Criterion.Main
import BaumSweet (bsSeq)

main :: IO ()
main = defaultMain [
  bgroup "bsSeq" [ bench "1"  $ nf bsSeq 1
                 , bench "10" $ nf bsSeq 10
                 , bench "100" $ nf bsSeq 100
                 , bench "1000" $ nf bsSeq 1000
                 , bench "10000" $ nf bsSeq 10000
                 , bench "100000" $ nf bsSeq 100000
                 , bench "100000" $ nf bsSeq 1000000
                 , bench "100000" $ nf bsSeq 10000000
                 ]
  ]
