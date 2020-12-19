filename=main
branch := $(shell git rev-parse --abbrev-ref HEAD)
output: svg-inkscape main.pdf 
	makeindex main.idx
	makeglossaries main
	pdflatex ${filename}.tex
svg-inkscape:
	pdflatex -shell-escape ${filename}.tex
main.pdf:
	pdflatex ${filename}.tex
resources:
	pdflatex CS/resources.tex
tree:
	[ -e ../config ] || ( echo "You don't have a local config repo" && exit 1 )
	git status
	git subtree -P config pull ../config ${branch}
	git subtree -P config push ../config ${branch}
clean:
	$(RM) *.aux *.toc *.acn *.log *.ptc *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg *.ilg *.ind *.pdf
