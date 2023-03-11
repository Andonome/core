output: BIND.pdf

BIND.pdf: main.aux
	mv main.pdf BIND.pdf
main.pdf: main.aux
	pdflatex main.tex
main.aux: svg-inkscape/logo_svg-tex.pdf main.glo
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
BIND_ref.pdf: $(wildcard *tex) story BIND_ref.aux
	makeglossaries BIND_ref
	pdflatex BIND_ref.tex
BIND_ref.aux: svg-inkscape
	pdflatex BIND_ref.tex
	pdflatex BIND_ref.tex
svg-inkscape:
	pdflatex -shell-escape BIND_ref.tex
	pdflatex BIND_ref.tex

resources: resources.pdf
resources.pdf: main.aux $(wildcard CS/*tex)
	pdflatex CS/resources.tex

all: BIND.pdf resources ref

clean:
	rm -fr *.aux *.sls *.slo *.slg *.toc *.acn *.log *.ptc *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg *.ilg *.ind *.pdf sq/*aux svg-inkscape CS/*aux
