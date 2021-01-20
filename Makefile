filename=main
branch := $(shell git rev-parse --abbrev-ref HEAD)
output: ${filename}.pdf
	pdflatex ${filename}.tex
${filename}.pdf: ${filename}.ind ${filename}.glg
svg-inkscape:
	pdflatex -shell-escape ${filename}.tex
${filename}.ind: svg-inkscape ${filename}.idx
	pdflatex ${filename}.tex
	makeindex ${filename}.idx
${filename}.glg: svg-inkscape ${filename}.glo
	pdflatex ${filename}.tex
	makeglossaries ${filename}
resources:
	pdflatex CS/resources.tex
tree:
	[ -e ../config ] || ( echo "You don't have a local config repo" && exit 1 )
	git status
	git subtree -P config pull ../config ${branch}
	git subtree -P config push ../config ${branch}
clean:
	rm -fr *.aux *.toc *.acn *.log *.ptc *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg *.ilg *.ind *.pdf svg-inkscape
