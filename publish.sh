#!/bin/sh
pdflatex First_Blood.tex
pdflatex First_Blood.tex
makeindex *idx
makeglossaries First_Blood
pdflatex First_Blood.tex
mv *pdf Finished_PDFs/First_Blood_Printable.pdf

sed -i 's/{report}/{book}/' First_Blood.tex
pdflatex First_Blood.tex
pdflatex First_Blood.tex
makeindex *idx
makeglossaries First_Blood
pdflatex First_Blood.tex
mv *pdf Finished_PDFs/First_Blood_Book.pdf

sed -i 's/{book}/{report}/' First_Blood.tex
sed -i 's/settoggle{verbose}{true}/settoggle{verbose}{false}/' First_Blood.tex
pdflatex First_Blood.tex
pdflatex First_Blood.tex
makeindex *idx
makeglossaries First_Blood
pdflatex First_Blood.tex
mv *.pdf Finished_PDFs/FB_Printable_Reference.pdf

sed -i 's/settoggle{verbose}{false}/settoggle{verbose}{true}/' First_Blood.tex

if [[ $1 == blind ]]; then
	git add Finished_PDFs
	git commit -m"update pdfs" && \
	git push
fi
