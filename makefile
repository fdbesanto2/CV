####################
# Makefile for automated CV creation in various formats
####################


## Setup 
DATE= $(shell date +"%m-%d-%Y")
CV_DIR = .
BASENAME = /MarcoDVisser_CurriculumVitea
MASTER = README.md
MD = $(CV_DIR)/Markdown/$(BASENAME)_$(DATE).md
PDF = $(CV_DIR)/PDF/$(BASENAME)_$(DATE).pdf
WORD = $(CV_DIR)/Word/$(BASENAME)_$(DATE).docx
HTML = $(CV_DIR)/PDF/$(BASENAME)_$(DATE).html

## functions
RNAME = cp '$<' '$@' 
PDOC = pandoc -s --smart '$<' -o '$@' 
## for now just rename the md files
## I intend to add pandoc code here
all: $(MD) $(HTML) $(PDF) $(WORD)

#########################
## main markdownx

$(MD):$(MASTER)
	$(RNAME)

$(HTML):$(MASTER) ./PDF/style.css
	pandoc --standalone -c ./PDF/style.css --from markdown --to html -o '$@' '$<'

$(PDF): $(HTML)
	wkhtmltopdf '$<' '$@' 

$(WORD):$(MASTER)
	$(PDOC)
