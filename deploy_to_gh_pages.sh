#!/bin/bash
echo ">>> Webpack-Building app.js..."
time webpack
git commit cordova/www/app.js -m "updated cordova/www/app.js"
cp cordova/www/app.js gh_pages_transfer/
cp -R assets gh_pages_transfer/
echo ">>> Checking out gh-pages..."
if git checkout gh-pages; then

  echo ">>> Copying assets..."
  cp -R gh_pages_transfer/assets .

  echo ">>> Uglifying (-c)..."
  time uglifyjs gh_pages_transfer/app.js -c > ./app.js

  echo ">>> Committing and pushing updates..."
  git add app.js assets
  git commit -m "deploy"
  git push
  echo ">>> Switching back to out master..."
  git checkout master
  open https://shanebdavis.github.io/nvc/
  echo ">>> done."
else
  echo "Couldn't switch branches. Make sure your branch is clean."
fi
