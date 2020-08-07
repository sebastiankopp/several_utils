MAIN_NAME=thesis

APP=lualatex -interaction=nonstopmode

BIBLIOGRAPHY=bibliography.bib

CHAPTERS=$(shell find chapters/ -type f -name '*.tex')

ASSETS=$(shell find assets/ -regextype posix-egrep -iregex '.+\.(java|png|jpg)$$' -type f )

all: $(MAIN_NAME).pdf

$(MAIN_NAME).pdf: $(MAIN_NAME).tex $(CHAPTERS) $(BIBLIOGRAPHY) $(ASSETS)
	$(APP) $(MAIN_NAME).tex
	biber ${MAIN_NAME}.bcf
	$(APP) $(MAIN_NAME).tex
	$(APP) $(MAIN_NAME).tex

clean:
	rm -f *.pdf *.toc *.aux *.synctex.gz chapters/*.aux *.blg *.bcf *.bbl *.run.xml *.log *.out assets/*.class *.lot *.lof *.lol
