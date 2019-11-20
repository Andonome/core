#!/bin/bash
git subtree -P config pull https://gitlab.com/FirstBloodRPG/config master
git subtree -P config push https://gitlab.com/FirstBloodRPG/config master
pdflatex First_Blood.tex
pdflatex First_Blood.tex
makeindex First_Blood.idx
makeglossaries First_Blood
