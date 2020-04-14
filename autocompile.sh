#!/bin/bash
if [ $1 = clean ]; then
	rm *aux *log main.{i,g}* *toc
	exit 0
fi

if [ $1 = tree ]; then
	git subtree -P config pull ../config master && \
	git subtree -P config push ../config core
fi
pdflatex main.tex
pdflatex main.tex
makeindex main.idx
makeglossaries main
pdflatex main.tex
