#!/bin/bash

rm -rf arxiv-staging arxiv.zip

latexmk -pdf main

## The following will remove all the comments from main, and also in-line all the included TeX files
latexpand --empty-comments main.tex > main-stripped.tex

mkdir arxiv-staging
mv main-stripped.tex arxiv-staging/main.tex
cp main.bbl arxiv-staging/main.bbl
cp -rf *.sty *.cls arxiv-staging

cd arxiv-staging
zip -r ../arxiv.zip . *
cd ..
rm -rf arxiv-staging
