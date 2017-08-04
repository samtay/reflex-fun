{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

import Data.FileEmbed

import Reflex.Dom

main :: IO ()
main = mainWidgetWithCss css body
  where css = $(embedFile "css/simple.css")

body :: MonadWidget t m => m ()
body = el "div" $ do
  el "h1" $ text "This h1 should be green"
  return ()
