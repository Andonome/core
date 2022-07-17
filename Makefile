filename=main
branch := $(shell git rev-parse --abbrev-ref HEAD)
output: ${filename}.pdf
${filename}.pdf: ${filename}.ind ${filename}.glg
svg-inkscape:
	pdflatex -shell-escape ${filename}.tex
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
tree:
	[ -e ../config ] || ( echo "You don't have a local config repo" && exit 1 )
	git status
	git subtree -P config pull ../config ${branch}
clean:
	rm -fr *.aux *.toc *.acn *.log *.ptc *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg *.ilg *.ind *.pdf .ref svg-inkscape
