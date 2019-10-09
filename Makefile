all: jrd.pdf

jrd.pdf: jrd.tex
	pdflatex jrd.tex
	rm *.aux *.log -f

open: jrd.pdf
	xdg-open jrd.pdf

clean:
	rm *.pdf *.aux *.log  -f
