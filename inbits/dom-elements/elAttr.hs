{-# LANGUAGE OverloadedStrings #-}

import Data.Monoid ((<>))

import qualified Data.Text as T
import qualified Data.Map as M

import Reflex.Dom

main :: IO ()
main = mainWidget $ do
  el "h1" $ text "Link to my blog in a new tab"
  el "p" $ text "via"
  el "pre" $ text "elAttr :: Text -> Map Text Text -> m a -> m a"
  elAttr
    "a"
    (  ("target" =: "_blank")
    <> ("href" =: "https://samtay.github.io")
    )
    $ text "A heaping teaspoon of Haskell"
  el "p" $ text "Or we can use the class shortcut"
  el "pre" $ text "elClass :: Text -> Text -> m a -> m a"
  elClass "div" "col-md-6" $ do
    elClass "p" "text-lead" $ text "lead text"
