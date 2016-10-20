#!/bin/bash
webpack
git commit cordova/www/app.js -m "updated cordova/www/app.js"
cp cordova/www/app.js gh_pages_transfer/
if git checkout gh-pages; then
  cp gh_pages_transfer/app.js .
  git add app.js
  git commit -m "deploy"
  git push
  git checkout master
  open https://shanebdavis.github.io/nvc/
else
  echo "Couldn't switch branches. Make sure your branch is clean."
fi
