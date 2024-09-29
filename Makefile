include config/vars

.PHONY: all
all: check $(RELEASE)

config/vars:
	@git submodule update --init

$(DBOOK): LOCTEX HANDOUTS STYLE_FILES EXTERNAL | qr.tex
	@$(COMPILER) main.tex

images/extracted/cover.jpg: images/Roch_Hercka/cave_fight.jpg images/extracted/inclusion.tex
	$(CP) $< $@
$(DROSS)/cover.pdf: config/cover.tex cover.tex images/extracted/cover.jpg $(DBOOK)
	$(RUN) $<
cover.pdf: $(DROSS)/cover.pdf
	$(CP) $< $@

.PHONY: clean
clean:
	$(CLEAN)
	$(RM) -r images/extracted
