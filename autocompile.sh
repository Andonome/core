#!/bin/bash
[ -d ../config ] && git subtree -P config pull ../config master && git subtree -P config push ../config core
pdflatex main.tex
pdflatex main.tex
makeindex main.idx
makeglossaries main
pdflatex main.tex
