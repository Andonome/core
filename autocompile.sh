#!/bin/bash
git subtree -P config pull ../config master
git subtree -P config push ../config fb
pdflatex First_Blood.tex
pdflatex First_Blood.tex
makeindex First_Blood.idx
makeglossaries First_Blood
