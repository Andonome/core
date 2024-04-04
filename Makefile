include config/vars

output: $(BOOK).pdf

config/vars:
	@git submodule update --init

.PHONY: clean all

qr.tex: README.md config/vars .switch-gls
	@printf '\qrcode[height=.2\\textwidth]{$(QR_TARGET)}' > qr.tex
.switch-gls:
	@touch -r Makefile .switch-gls

$(BOOK).pdf: $(wildcard *.tex) $(wildcard config/*.sty) | qr.tex
	@$(COMPILER) main.tex

.PHONY: all
all: $(BOOK).pdf

clean:
	$(CLEAN)
