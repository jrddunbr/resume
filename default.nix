# To use, run `nix-build default.nix` while there are two files; `jrd-resume.tex` and `jrd-cv.tex`.
# This code is easily adapted for other uses with LaTeX, but my resume is all I use this code for.

with import <nixpkgs> {};

pkgs.runCommand "jared-resume" rec {
  resume_src = ./jrd-resume.tex;
  cv_src = ./jrd-cv.tex;
  bin = with pkgs.texlive; combine {
    # Yes, I know this imports like a metric load of files, but it has everything I need ever.
    inherit scheme-full collection-latexrecommended collection-fontsextra moderncv etoolbox;
  };
  buildInputs = [ bin ];
  allowSubstitutes = false;
} ''
  ln -s $resume_src jrd-resume.tex
  ln -s $cv_src jrd-cv.tex
  latexmk -pdf jrd-resume.tex
  latexmk -pdf jrd-cv.tex
  mkdir $out
  mv *pdf $out/
''
