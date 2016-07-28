
cp cordova/www/app.js gh_pages_transfer/
git checkout gh_pages
cp gh_pages_transfer/* .
git add *
git commit -m "deploy"
git push
git checkout master
open https://shanebdavis.github.io/nvc/
