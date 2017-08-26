{-# LANGUAGE OverloadedStrings #-}
import Reflex.Dom

main :: IO ()
main = mainWidget bodyElement

bodyElement :: MonadWidget t m => m ()
bodyElement = el "div" $ do
  el "h2" $ text "Text Input with cool events"

  el "div" $ do
    t1 <- textInput def
    evClick <- button "Click to see value!"
    el "br" blank
    text "Contents on last click: "
    let evText = tagPromptlyDyn (value t1) evClick
    dynText =<< holdDyn "" evText

  el "div" $ do
    t2 <- textInput def
    text "Hit [RET] to see value of this one!"
    el "br" blank
    text "Contents on last [RET]: "
    let evEnter = keypress Enter t2
        evText = tagPromptlyDyn (value t2) evEnter
    dynText =<< holdDyn "" evText

  el "div" $ do
    t3 <- textInput def
    evCopy <- button "Copy to >>>"
    let evText = tagPromptlyDyn (value t3) evCopy
    t4 <- textInput $ def & setValue .~ evText
    dynText =<< holdDyn "" evText
