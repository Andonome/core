EXTERNAL_REFERENTS = stories judgement

targets += Monsters.pdf
targets += Knacks.pdf

output += booklets

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

booklets/a7_Knacks.tex: knacks.tex | booklets/ $(RELEASE)
	\printf '%s\n' '\documentclass[10pt,twoside]{book}' > $@
	\printf '%s\n' '\usepackage{config/bind}\usepackage{config/booklet}' >> $@
	\printf '%s\n' '\externalReferent{core}' >> $@
	\printf '%s\n' '\externalReferent{stories}' >> $@
	\printf '%s\n' '\externalReferent{judgement}' >> $@
	\printf '%s\n' '\begin{document}' >> $@
	\printf '%s\n' '\miniCover{Knacks}{}' >> $@
	\printf '%s\n' '\cleardoublepage\pagestyle{minizine}' >> $@
	sed '1 d;/multicols/d;/footnote/d; s/\\section/\\subsection/; s/footnote/exRef{core}{Core Rules}/' $< >> $@
	\printf '%s\n' '\end{document}' >> $@

booklets/a7_Monsters.tex: whales.tex eyeline.tex | booklets/ $(RELEASE)
	\printf '%s\n' '\documentclass[10pt,twoside]{book}' > $@
	\printf '%s\n' '\usepackage{config/bind}\usepackage{config/booklet}' >> $@
	\printf '%s\n' '\begin{document}' >> $@
	\printf '%s\n' '\miniCover{Monsters}{}' >> $@
	\printf '%s\n' '\cleardoublepage\pagestyle{minizine}\normalsize' >> $@
	sed '/multicols/d;/epigraph{/d;s/\\section/\\subsection/' $^ >> $@
	\printf '%s\n' '\clearpage\null\end{document}' >> $@
