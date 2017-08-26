{-# LANGUAGE OverloadedStrings #-}
import Reflex.Dom
import qualified Data.Text as T

main :: IO ()
main = mainWidget bodyElement

bodyElement :: MonadWidget t m => m ()
bodyElement = el "div" $ do
  el "div" $ do
    el "h2" $ text "Checkboxes (without labels)"
    cb1 <- checkbox True def
    dynText $ T.pack . show <$> value cb1
    cb2 <- checkbox False def
    dynText $ T.pack . show <$> value cb2
    return ()

  el "div" $ do
    el "h2" $ text "Checkboxes (with labels)"
    cb <- el "label" $ do
      cb1 <- checkbox True def
      text "Click me"
      return cb1
    return ()
