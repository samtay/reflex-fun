{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecursiveDo #-}

import Data.Monoid ((<>))

import qualified Data.Text as T
import qualified Data.Map as M

import Reflex.Dom

main :: IO ()
main = mainWidget $ do
  el "h1" $ text "elDynAttr"
  el "p" $ do
    el "pre" (text "elDynAttr")
    text "allows dynamic attributes."
    text "We simply stick the map in a "
    el "pre" (text "Dynamic t")
    text "type."
    text "We'll use " >> el "pre" (text "toggle")
    text "to create an attribute that toggles everytime an event happens."
  rec
    dynBool <- toggle False evClick
    let dynAttrs = attrs <$> dynBool
    elDynAttr "h1" dynAttrs $ text "Changing color"
    evClick <- button "Change Color"
  return ()

attrs :: Bool -> M.Map T.Text T.Text
attrs b = "style" =: ("color: " <> color b)
  where
    color True = "red"
    color _    = "green"
