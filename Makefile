all: jrd.pdf jrd-linux.pdf

jrd.pdf: jrd.tex
	pdflatex jrd.tex
	rm *.aux *.log -f

jrd-linux.pdf: jrd-linux.tex
	pdflatex jrd-linux.tex
	rm *.aux *.log -f

open: jrd.pdf jrd-linux.pdf
	xdg-open jrd.pdf
	xdg-open jrd-linux.pdf

clean:
	rm jrd.pdf jrd-linux.pdf *.aux *.log  -f
