EXTERNAL_REFERENTS = stories judgement

include config/common.mk

$(DBOOK): qr.tex .switch-gls $(wildcard *.tex)

config/common.mk:
	@git submodule update --init

images/extracted/cover.jpg: images/Roch_Hercka/cave_fight.jpg images/extracted/inclusion.tex
	$(CP) $< $@
$(DROSS)/$(BOOK)_cover.pdf: config/share/cover.tex cover.tex images/extracted/cover.jpg $(DBOOK)
	$(RUN) -jobname $(BOOK)_cover $<
cover.pdf: $(DROSS)/$(BOOK)_cover.pdf
	$(CP) $< $@

