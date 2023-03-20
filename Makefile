output: BIND.pdf

BIND.pdf: main.aux
	mv main.pdf BIND.pdf
main.pdf: main.aux
	pdflatex main.tex
main.aux: svg-inkscape/logo_svg-tex.pdf main.glo $(wildcard *tex)
	makeglossaries main
	pdflatex main.tex
main.glo: svg-inkscape/logo_svg-tex.pdf
svg-inkscape/logo_svg-tex.pdf: config/bind.sty images/
	pdflatex -shell-escape main.tex
	pdflatex main.tex
	pdflatex main.tex
config/bind.sty:
	git submodule update --init

ref: BIND_ref.pdf
BIND_ref.pdf: $(wildcard *tex) BIND_ref.aux
	makeglossaries BIND_ref
	pdflatex -jobname BIND_ref main.tex
BIND_ref.aux: svg-inkscape
	pdflatex -jobname BIND_ref main.tex
	pdflatex -jobname BIND_ref main.tex
svg-inkscape:
	pdflatex -shell-escape -jobname BIND_ref main.tex
	pdflatex -jobname BIND_ref main.tex

resources: resources.pdf
resources.pdf: main.aux cs
	pdflatex resources.tex

all: BIND.pdf resources ref

clean:
	rm -fr *.aux *.sls *.slo *.slg *.toc *.acn *.log *.ptc *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg *.ilg *.ind *.pdf sq/*aux svg-inkscape cs/*aux
