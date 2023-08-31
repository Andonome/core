BOOK = $(shell basename "$$(pwd)")

output: $(BOOK).pdf

.PHONY: clean all

global: config/bind.sty .switch-gls
.switch-gls:
	@touch -r Makefile .switch-gls
config/bind.sty:
	@git submodule update --init

svg-inkscape: | config/bind.sty
	@pdflatex -shell-escape -jobname $(BOOK) main.tex
$(BOOK).glo: | svg-inkscape
	@pdflatex -jobname $(BOOK) main.tex
$(BOOK).sls: | $(BOOK).glo
	@makeglossaries $(BOOK)
$(BOOK).pdf: $(BOOK).sls $(wildcard *.tex) $(wildcard config/*.sty)
	@pdflatex -jobname $(BOOK) main.tex

config/resources.pdf: config/bind.sty
	@make -C config resources.pdf
resources.pdf: config/resources.pdf
	@cp config/resources.pdf .

all: $(BOOK).pdf resources.pdf
	@latexmk -jobname=$(BOOK) -shell-escape -pdf main.tex

clean:
	rm -fr *.aux *.sls *.slo *.slg *.toc *.acn *.log *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg \
	*.ilg \
	*.ind \
	*.ptc \
	*.pdf \
	svg-inkscape \
	*.fdb_latexmk \
	*.fls

