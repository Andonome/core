#!/bin/bash

# if you're in the subtree, back up
[ ! -d .git ] && [ -e ../.git ] && \
	cd ..

# If you're setting up:
[ ! -e main.tex ] && [ -e config/main.tex ] && \
	cp config/main.tex . && \
	ln -s config/autocompile.sh .

git gc --auto

if [ $1 = clean ]; then
	rm -r *aux *log main.{i,g}* *toc *.ptc *.out svg-inkscape 2>/dev/null
	exit 0
fi

if [ $1 = tree ]; then
	[ -e ../config ] || ( echo "You don't have a local config repo" && exit 1 )
	git status
	git subtree -P config pull ../config master || exit 1
	git subtree -P config push ../config master || exit 1
fi
pdflatex -shell-escape main.tex
makeglossaries main
makeindex main.idx
pdflatex main.tex
