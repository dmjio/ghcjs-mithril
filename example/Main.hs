{-# LANGUAGE OverloadedStrings #-}

import Mithril
import GHCJS.Types
import GHCJS.DOM.Types
import GHCJS.DOM
import GHCJS.Foreign
import Control.Concurrent.MVar

main :: IO ()
main = do
  bod <- body
  m "h1" "yoooo" >>= mRender bod

