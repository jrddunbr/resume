all: jrd.pdf jrd-linux.pdf jrd2.pdf

jrd.pdf: jrd.tex
	pdflatex jrd.tex
	rm *.aux *.log -f

jrd-linux.pdf: jrd-linux.tex
	pdflatex jrd-linux.tex
	rm *.aux *.log -f

jrd2.pdf: jrd2.tex
	pdflatex jrd2.tex
	rm *.aux *.log -f

open: jrd.pdf jrd-linux.pdf jrd2.pdf
	xdg-open jrd.pdf
	xdg-open jrd-linux.pdf
	xdg-open jrd2.pdf

clean:
	rm *.pdf *.aux *.log  -f
