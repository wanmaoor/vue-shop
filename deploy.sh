yarn build &&
git checkout gh-pages &&
rm -rf *.html *.js *.css *.png &&
cp -r dist/* ./ &&
rm -rf dist;
git add . &&
git commit -m "update" &&
git push &&
ch master