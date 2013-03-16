
install: hakyll
	./hakyll build
	ssh webloria "cd /global/web-homepages/bedaride/; rm -r *"
	scp -r _site webloria:/global/web-homepages/bedaride/
	ssh webloria "cd /global/web-homepages/bedaride/; mv _site/* ."

hakyll: hakyll.hs
	ghc --make hakyll3.hs
