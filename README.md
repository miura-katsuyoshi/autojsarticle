# autojsarticle
LaTeX class file to select automatically jsarticle based class file

## Outline

This class file automatically select a suitable class fils from jsarticle base class files (jsarticle.cls, bxjsarticle, and bxjsarticle) depending on LaTeX engine (platex, uplatex, pdflatex, lualatex, and xelatex).

## How to use

1. Copy autojsarticle.cls to the suitable directory such as /usr/local/texlive/texmf-local/tex/latex/local/
2. Execute ''mktexlsr''
3. Specify '\documentclass{autojsarticle}' in your tex file.
4. Compile your tex file with favarite latex engine (platex, uplatex, pdflatex, lualatex, and xelatex).
