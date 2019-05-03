NAME = monografia
TEX  = ${NAME}.tex

LATEX    = latex    -interaction=nonstopmode -shell-escape
PDFLATEX = pdflatex -interaction=nonstopmode -shell-escape -output-format=pdf
XELATEX  = xelatex  -interaction=nonstopmode -shell-escape
LUALATEX = lualatex -interaction=nonstopmode -shell-escape

all: rmpdf ${NAME}.pdf copy

${NAME}.pdf: ${NAME}.aux
	${PDFLATEX} ${TEX}
	${PDFLATEX} ${TEX}

${NAME}.aux:
	${PDFLATEX} ${TEX}
	bibtex ${NAME}
#	makeindex ${NAME}.idx

v: view
view:
	evince ${NAME}.pdf

copy:
	cp ${NAME}.pdf ../pdf/

rm: rmpdf
rmpdf:
	rm -f ${NAME}.pdf

c: clean
clean:
	rm -f *~ *.log *.aux *.blg *.idx *.toc *.out *.ind *.ilg *.pdf *.lof *.dvi *.lot *.brf *.bbl *.run.xml *.bcf *.run.xml *.loa *.loc *.lol

