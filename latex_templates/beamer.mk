MAIN_NAME=presentation

HANDOUT=$(MAIN_NAME)-ho.pdf
PRESENTATION=$(MAIN_NAME)-pres.pdf

APP=pdflatex -interaction=nonstopmode
HANDOUT_APP=$(APP) "\def\deskopphandoutenabled{}\input{$(MAIN_NAME)}"

ASSETS=$(shell find assets/ -regextype posix-egrep -iregex '.+\.(java|png|jpg)$' -type f )

all: $(HANDOUT) $(PRESENTATION)

$(PRESENTATION): $(MAIN_NAME).tex $(ASSETS)
	$(APP) $(MAIN_NAME).tex
	$(APP) $(MAIN_NAME).tex
	mv $(MAIN_NAME).pdf $(PRESENTATION)

$(HANDOUT): $(MAIN_NAME).tex $(ASSETS)
	$(HANDOUT_APP)
	$(HANDOUT_APP)
	mv $(MAIN_NAME).pdf $(HANDOUT)

clean:
	rm -f *.pdf *.toc *.aux *.synctex.gz chapters/*.aux *.blg *.bcf *.bbl *.run.xml *.log *.out *.nav *.snm
