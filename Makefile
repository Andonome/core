BOOK = $(shell basename "$$(pwd)")
QR_TARGET = $(shell grep 'mailto' README.md | cut -d' ' -f2)

output: $(BOOK).pdf

.PHONY: clean all

qr.tex: README.md
	@printf '\qrcode[height=.2\\textwidth]{$(QR_TARGET)}' > qr.tex
.switch-gls:
	@touch -r Makefile .switch-gls
config/bind.sty:
	@git submodule update --init

svg-inkscape: | config/bind.sty .switch-gls qr.tex
	@pdflatex -shell-escape -jobname $(BOOK) main.tex
$(BOOK).pdf: svg-inkscape $(wildcard *.tex) $(wildcard config/*.sty)
	@pdflatex -jobname $(BOOK) main.tex

all: $(BOOK).pdf
	@latexmk -jobname=$(BOOK) -shell-escape -pdf main.tex

clean:
	rm -fr *.aux *.sls *.slo *.slg *.toc *.acn *.log *.out *.idx *.ist \
	*glo \
	*glg \
    *gls \
    *.acr \
    *.alg \
	*.ilg \
	*.ind \
	*.ptc \
	*.pdf \
	svg-inkscape \
	*.fdb_latexmk \
	qr.tex \
	*.fls

