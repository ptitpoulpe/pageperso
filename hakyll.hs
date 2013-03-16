import Control.Monad (liftM, mapM_)
import Text.Hakyll (hakyll)
import Text.Hakyll.File (directory)
import Text.Hakyll.Render (css, static, renderChain, render)
import Text.Hakyll.CreateContext (createPage)
import Text.Hakyll.ContextManipulations (changeExtension)
import Control.Arrow ((>>>))

main = hakyll "http://www.loria.fr/~bedaride" $ do
    directory css "css"
    directory static "files"
    mapM_ (renderChain ["templates/default.php"] . 
                       (\x -> createPage x >>> changeExtension "php"))
          ["index.md"
	  ,"teaching.md"
          ,"papers.md"
	  ,"projects.md"
	  ,"links.md"
          ,"aboutme.md"]
    --changeExtension "php"
