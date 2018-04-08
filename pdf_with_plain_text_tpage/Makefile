TITLE_SHEET=title
MAIN_NAME=example
FONT= # use your favourite ttf font
PDFMERGE=java -jar $(PDFBOX_HOME)/pdfbox-app-2.0.9.jar PDFMerger
TXT2PDF=java -Dfile.encoding=UTF-8 -jar $(PDFBOX_HOME)/pdfbox-app-2.0.9.jar TextToPDF -pageSize A4 -ttf $(FONT)

$(MAIN_NAME).pdf: $(MAIN_NAME)-cnt.pdf $(TITLE_SHEET).pdf
	$(PDFMERGE) $(TITLE_SHEET).pdf $(MAIN_NAME)-cnt.pdf $(MAIN_NAME).pdf

$(TITLE_SHEET).pdf: $(TITLE_SHEET).txt
	$(TXT2PDF) $(TITLE_SHEET).pdf $(TITLE_SHEET).txt

$(MAIN_NAME)-cnt.pdf: $(MAIN_NAME).adoc
	asciidoctor-pdf -o $(MAIN_NAME)-cnt.pdf $(MAIN_NAME).adoc

clean:
	rm $(TITLE_SHEET).pdf $(MAIN_NAME)-cnt.pdf
