{-# LANGUAGE OverloadedStrings #-}

import Reflex.Dom

main :: IO ()
main = mainWidget $ do
  el "h1" $ text "Welcome to this header!"
  el "div" $ do
    el "p" $ text "First paragraph has introduces a list:"
    el "ul" $ do
      el "li" $ text "Whoa"
      el "li" $ text "WHAT"
    el "p" $ do
      text "Second p tag has some text and then a"
      el "br" blank
      text "a newline"
