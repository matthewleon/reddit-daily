module Main where

import Criterion.Main
import Criterion.Types
import BaumSweet (bsSeq, bsSeq')

config :: Config
config = defaultConfig { reportFile = Just "report.html" }

main :: IO ()
main = defaultMainWith config [
  bgroup "bsSeq" [ bench "1"  $ nf bsSeq 1
                 , bench "10" $ nf bsSeq 10
                 , bench "100" $ nf bsSeq 100
                 , bench "1000" $ nf bsSeq 1000
                 , bench "10000" $ nf bsSeq 10000
                 , bench "100000" $ nf bsSeq 100000
                 , bench "1000000" $ nf bsSeq 1000000
                 , bench "10000000" $ nf bsSeq 10000000
                 ]
  , bgroup "bsSeq'" [ bench "1"  $ nf bsSeq' 1
                    , bench "10" $ nf bsSeq' 10
                    , bench "100" $ nf bsSeq' 100
                    , bench "1000" $ nf bsSeq' 1000
                    , bench "10000" $ nf bsSeq' 10000
                    , bench "100000" $ nf bsSeq' 100000
                    , bench "1000000" $ nf bsSeq' 1000000
                    , bench "10000000" $ nf bsSeq' 10000000
                   ]
  ]
