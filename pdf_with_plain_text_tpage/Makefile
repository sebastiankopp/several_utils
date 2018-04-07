TITLE_SHEET=title
MAIN_NAME=example
PDFMERGE=java -jar $(PDFBOX_HOME)/pdfbox-app-2.0.9.jar PDFMerger

$(MAIN_NAME).pdf: $(MAIN_NAME)-cnt.pdf $(TITLE_SHEET).pdf
	$(PDFMERGE) $(TITLE_SHEET).pdf $(MAIN_NAME)-cnt.pdf $(MAIN_NAME).pdf

$(TITLE_SHEET).pdf: $(TITLE_SHEET).ps
	ps2pdf $(TITLE_SHEET).ps

$(TITLE_SHEET).ps: $(TITLE_SHEET).txt
	enscript -B -o $(TITLE_SHEET).ps $(TITLE_SHEET).txt

$(MAIN_NAME)-cnt.pdf: $(MAIN_NAME).adoc
	asciidoctor-pdf -o $(MAIN_NAME)-cnt.pdf $(MAIN_NAME).adoc

clean:
	rm *.pdf; rm *-cnt.pdf
