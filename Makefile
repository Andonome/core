EXTERNAL_REFERENTS = stories judgement

include config/vars

config/vars:
	@git submodule update --init

$(DBOOK): $(DEPS) HANDOUTS STYLE_FILES | qr.tex
	@$(COMPILER) main.tex

images/extracted/cover.jpg: images/Roch_Hercka/cave_fight.jpg images/extracted/inclusion.tex
	$(CP) $< $@
$(DROSS)/$(BOOK)_cover.pdf: config/cover.tex cover.tex images/extracted/cover.jpg $(DBOOK)
	$(RUN) -jobname $(BOOK)_cover $<
cover.pdf: $(DROSS)/$(BOOK)_cover.pdf
	$(CP) $< $@

targets += cover.pdf

