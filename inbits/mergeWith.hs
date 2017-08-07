{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecursiveDo #-}

import Reflex.Dom

main :: IO ()
main = mainWidget bodyElement

bodyElement :: MonadWidget t m => m ()
bodyElement = do
  rec el "h2" $ text "Combining events with mergeWith and foldDyn"
      numbs <- foldDyn (+) (0 :: Int) $ mergeWith (+) [1 <$ evIncr, -1 <$ evDecr]
      el "div" $ display numbs
      evIncr <- button "Increment"
      evDecr <- button "Decrement"
  return ()

