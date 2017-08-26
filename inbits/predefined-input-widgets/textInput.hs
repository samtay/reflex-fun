{-# LANGUAGE OverloadedStrings #-}
import Reflex.Dom
import Data.Monoid ((<>))

main :: IO ()
main = mainWidget bodyElement

bodyElement :: MonadWidget t m => m ()
bodyElement = el "div" $ do
  el "h2" $ text "Text Inputs"

  el "h4" $ text "Max length"
  t1 <- textInput $ def & attributes .~ constDyn ("maxlength" =: "14")
  dynText $ value t1

  el "h4" $ text "Initial Value"
  t2 <- textInput $ def & textInputConfig_initialValue .~ "input"
  dynText $ _textInput_value t2

  el "h4" $ text "Number input with initial value"
  t2 <- textInput $ def & textInputConfig_inputType .~ "number"
                        & textInputConfig_initialValue .~ "10"
  dynText $ value t2

