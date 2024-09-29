include config/vars

.PHONY: all
all: check $(RELEASE) cover.pdf

config/vars:
	@git submodule update --init

$(DBOOK): LOCTEX HANDOUTS STYLE_FILES EXTERNAL | qr.tex
	@$(COMPILER) main.tex

images/extracted/cover.jpg: images/Roch_Hercka/cave_fight.jpg images/extracted/inclusion.tex
	$(CP) $< $@
$(DROSS)/$(BOOK)_cover.pdf: config/cover.tex cover.tex images/extracted/cover.jpg $(DBOOK)
	$(RUN) -jobname $(BOOK)_cover $<
cover.pdf: $(DROSS)/$(BOOK)_cover.pdf
	$(CP) $< $@

.PHONY: clean
clean:
	$(CLEAN)
	$(RM) -r images/extracted
