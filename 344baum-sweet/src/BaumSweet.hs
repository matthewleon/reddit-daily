module BaumSweet (bsSeq, bsSeq') where

import Control.Monad.ST (runST)
import Data.Foldable (forM_)
import qualified Data.Vector as V
import qualified Data.Vector.Unboxed as VU
import qualified Data.Vector.Unboxed.Mutable as VUM

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

bsSeq' :: Int -> VU.Vector Bool
bsSeq' sz = runST $ do
  bs <- VUM.unsafeNew sz
  VUM.unsafeWrite bs 0 True
  forM_ [1..(sz - 1)] $ \n -> VUM.unsafeWrite bs n =<<
    if n `mod` 4 == 0
      then VUM.unsafeRead bs (n `div` 4)
      else if even n then pure False else VUM.unsafeRead bs ((n - 1) `div` 2)
  VU.unsafeFreeze bs
