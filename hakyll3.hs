{-# LANGUAGE OverloadedStrings #-}
import Control.Arrow ((>>>))
import Control.Monad (forM_)

import Hakyll

main :: IO ()
main = hakyll $ do
  match "css/*" $ do
    route   idRoute
    compile compressCssCompiler

  match "files/**" $ do
    route   idRoute
    compile copyFileCompiler

  match "templates/*" $ compile templateCompiler

  forM_ ["index.md"
        ,"teaching.md"
        ,"papers.md"
        ,"projects.md"
        ,"links.md"
        ,"aboutme.md"] $ \p ->  
    match p $ do
      route   $ setExtension "php"
      compile $ pageCompiler
        >>> applyTemplateCompiler "templates/default.php"
        >>> relativizeUrlsCompiler
