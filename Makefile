filename=main
branch := $(shell git rev-parse --abbrev-ref HEAD)
output: main.pdf main.aux
	makeindex main.idx
	makeglossaries main
	pdflatex ${filename}.tex
main.aux:
	pdflatex ${filename}.tex
main.pdf:
	pdflatex ${filename}.tex
resources:
	pdflatex CS/resources.tex
	cd ..
	mv main.pdf bind.pdf
tree:
	[ -e ../config ] || ( echo "You don't have a local config repo" && exit 1 )
	git status
	git subtree -P config pull ../config ${branch}
	git subtree -P config push ../config ${branch}

clean:
	rm *.aux *.toc *.acn *.log *.ptc *.out *.idx *.ist *.glo
