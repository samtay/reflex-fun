{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecursiveDo #-}

import Reflex.Dom

main :: IO ()
main = mainWidget bodyElement

bodyElement :: MonadWidget t m => m ()
bodyElement = do
  rec el "h2" $ text "Using foldDyn with function payloads"
      numbs <- foldDyn ($) (0 :: Int) $ leftmost [ (+1) <$ evIncr
                                                 , (subtract 1) <$ evDecr
                                                 , (const 0) <$ evReset ]
      el "div" $ display numbs
      evIncr <- button "Increment"
      evDecr <- button "Decrement"
      evReset <- button "Reset"
  return ()

