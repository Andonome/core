filename=example
output: ${filename}.pdf
	pdflatex ${filename}.tex
${filename}.pdf:
	pdflatex ${filename}.tex
new:
	if [ ! -d .git ] && [ -e ../.git ]
	then
		cp -n main.tex .gitignore ..
	fi
clean:
	rm -r *.{aux,toc,acn,acr,log,ptc,out,idx,ist,alg,glo} 2>/dev/null
