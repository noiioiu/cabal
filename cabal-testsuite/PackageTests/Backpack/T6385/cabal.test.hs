import Test.Cabal.Prelude
main =
  cabalTest $ withShorterPathForNewBuildStore $ do
    skipUnlessGhcVersion ">= 8.1"
    skipIfWindows -- TODO: https://github.com/haskell/cabal/issues/6271
    withRepo "repo" $ do
      cabal "v2-build" ["T6385"]
