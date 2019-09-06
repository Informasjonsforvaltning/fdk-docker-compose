#!/usr/bin/env bash

# this script allows to  generate changelogs in all repos
# note that often repos released individually, not all together.

#fdk
#create
(cd ../fdk && git checkout develop && git pull && npm run release)
#push
(cd ../fdk && git push --follow-tags origin)

#fdk-api-harvester
#create
(cd ../fdk-api-harvester && git checkout develop && git pull && npm run release)
#push
(cd ../fdk-api-harvester && git push --follow-tags origin)

#concept-catalogue
#create
(cd ../concept-catalogue && git checkout develop && git pull && npm run release)
#push
(cd ../concept-catalogue && git push --follow-tags origin)

#concept-catalogue-gui
#create
(cd ../concept-catalogue-gui && git checkout develop && git pull && npm run release)
#push
(cd ../concept-catalogue-gui && git push --follow-tags origin)
