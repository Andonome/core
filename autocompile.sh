#!/bin/bash
if [ ! -z $1 ]; then
	git subtree -P config pull ../config master && \
	git subtree -P config push ../config core
fi
pdflatex main.tex
pdflatex main.tex
makeindex main.idx
makeglossaries main
pdflatex main.tex
