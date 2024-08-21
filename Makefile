include config/vars

.PHONY: all
all: check $(RELEASE)

config/vars:
	@git submodule update --init

$(DBOOK): $(DEPS) | qr.tex
	@$(COMPILER) main.tex

.PHONY: clean
clean:
	$(CLEAN)
