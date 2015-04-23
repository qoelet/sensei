{-# LANGUAGE OverloadedStrings #-}
module ClientSpec (spec) where

import           Helper

import           HTTP
import           Client

spec :: Spec
spec = do
  describe "client" $ do
    it "does a HTTP request via a Unix domain socket" $ do
      inTempDirectory $ do
        withServer (return (True, "hello")) $ do
          client `shouldReturn` (True, "hello")

    it "indicates failure" $ do
      inTempDirectory $ do
        withServer (return (False, "hello")) $ do
          client `shouldReturn` (False, "hello")
