include config/vars

.PHONY: all
all: check $(RELEASE)

config/vars:
	@git submodule update --init

$(DBOOK): LOCTEX HANDOUTS STYLE_FILES EXTERNAL | qr.tex
	@$(COMPILER) main.tex

.PHONY: clean
clean:
	$(CLEAN)
