#!/bin/bash
echo "\nWebpack-Building app.js..."
webpack
git commit cordova/www/app.js -m "updated cordova/www/app.js"
cp cordova/www/app.js gh_pages_transfer/
cp -R assets gh_pages_transfer/
echo "\nChecking out gh-pages..."
if git checkout gh-pages; then

  echo "\nCopying assets..."
  cp -R gh_pages_transfer/assets .

  echo "\nUglifying (-c)..."
  uglifyjs gh_pages_transfer/app.js -c > ./app.js

  echo "\nCommitting and pushing updates..."
  git add app.js assets
  git commit -m "deploy"
  git push
  echo "\nSwitching back to out master..."
  git checkout master
  open https://shanebdavis.github.io/nvc/
  echo "\ndone."
else
  echo "Couldn't switch branches. Make sure your branch is clean."
fi
