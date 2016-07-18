ADDON=$1

npm uninstall $ADDON  --save-dev
npm prune
bower uninstall $ADDON --save
