module BaumSweet (bsSeq) where

import qualified Data.Vector as V

bsSeq :: Int -> V.Vector Bool
bsSeq sz = bs
  where
  bs :: V.Vector Bool
  bs = V.fromListN sz $ True : (b <$> [1..])

  b :: Int -> Bool
  b n =
    if n `mod` 4 == 0
      then bs V.! (n `div` 4)
      else odd n && (bs V.! ((n - 1) `div` 2))
