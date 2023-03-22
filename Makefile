output: main.pdf
book: main.pdf
	mv main.pdf BIND.pdf

global: config/bind.sty .switch-gls
.switch-gls:
	touch -r Makefile .switch-gls
config/bind.sty:
	git submodule update --init
cs/CS.tex:
	git submodule update --init

main.pdf: main.gls config cs $(wildcard *tex)
	pdflatex main.tex
main.gls: svg-inkscape/logo_svg-tex.pdf
	makeglossaries main
	pdflatex main.tex
svg-inkscape/logo_svg-tex.pdf: images/ global
	pdflatex -shell-escape main.tex
	pdflatex main.tex
	pdflatex main.tex

ref: BIND_ref.pdf
BIND_ref.pdf: $(wildcard *tex) BIND_ref.gls
	pdflatex -jobname BIND_ref main.tex
BIND_ref.gls: svg-inkscape
	pdflatex -shell-escape -jobname BIND_ref main.tex
	makeglossaries BIND_ref
	pdflatex -jobname BIND_ref main.tex
svg-inkscape: global
	pdflatex -shell-escape -jobname BIND_ref main.tex
	pdflatex -jobname BIND_ref main.tex

resources: resources.pdf
resources.pdf: main.gls global
	pdflatex resources.tex

all: ref resources book 

clean:
	rm -fr *.aux *.sls *.slo *.slg *.toc *.acn *.log *.ptc *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg *.ilg *.ind *.pdf sq/*aux svg-inkscape cs/*aux
