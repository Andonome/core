filename=docs
output: ${filename}.pdf
${filename}.pdf: ${filename}.tex bind.sty monsters.sty
	pdflatex ${filename}.tex
docs.aux:
	pdflatex docs.tex
	pdflatex docs.tex
docs: docs.aux
	pdflatex docs.tex
test:
	pdflatex test.tex
all: docs test
clean:
	rm -f *pdf *.aux *.toc *.acn *.acr *.log *.ptc *.out *.idx *.ist *.alg *.glo
