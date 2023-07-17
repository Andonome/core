output: main.pdf
book: main.pdf
	mv main.pdf BIND.pdf

global: config/bind.sty .switch-gls
.switch-gls:
	touch -r Makefile .switch-gls
config/bind.sty:
	git submodule update --init

main.pdf: main.gls config $(wildcard *tex)
	pdflatex main.tex
main.gls: svg-inkscape/logo_svg-tex.pdf
	makeglossaries main
	pdflatex main.tex
svg-inkscape/logo_svg-tex.pdf: images/ global
	pdflatex -shell-escape main.tex
	pdflatex main.tex
	pdflatex main.tex

svg-inkscape: global
	pdflatex -shell-escape -jobname main.tex
	pdflatex -jobname main.tex

resources: resources.pdf
resources.pdf: main.gls global
	pdflatex resources.tex

all: resources book 

clean:
	rm -fr *.aux *.sls *.slo *.slg *.toc *.acn *.log *.ptc *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg *.ilg *.ind *.pdf sq/*aux svg-inkscape
