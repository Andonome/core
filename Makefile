filename=main
branch := $(shell git rev-parse --abbrev-ref HEAD)
output: ${filename}.pdf
${filename}.pdf: ${filename}.ind ${filename}.glg
svg-inkscape: config/bind.sty
	pdflatex -shell-escape ${filename}.tex
config/bind.sty:
	git submodule update --init
${filename}.ind: svg-inkscape ${filename}.idx $(wildcard *.tex)
	pdflatex ${filename}.tex
	makeindex ${filename}.idx
${filename}.glg: svg-inkscape
	pdflatex ${filename}.tex
	makeglossaries ${filename}
	pdflatex ${filename}.tex
resources: resources.pdf ${filename}.pdf
resources.pdf: $(wildcard CS/*.tex)
	pdflatex CS/resources.tex
svg-ref:
	pdflatex  -shell-escape main_ref.tex
	pdflatex  main_ref.tex
	makeglossaries main_ref
	makeindex main_ref.idx
	pdflatex  main_ref.tex
ref: svg-ref
	pdflatex main_ref.tex
creds:
	cd images && pandoc artists.md -o ../art.pdf
all: ref ${filename}.pdf resources.pdf creds
clean:
	rm -fr *.aux *.toc *.acn *.log *.ptc *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg *.ilg *.ind *.pdf .ref svg-inkscape
