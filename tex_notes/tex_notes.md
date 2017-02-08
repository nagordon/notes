Notes on tex/latex

to create a pdf from a tex file, run
```bash
pdflatex simpleTex1.tex
# open the pdf with 
evince simpleTex1.pdf
```

if this doesn't work, we can generate a post-script and dvi file using

```bash
latex simpleTex1.tex    # generate dvi file
dvips simpleTex1.dvi    # create postscript file
dvipdf simpleTex1.dvi   # create pdf
```

and I found [DocOnce](http://hplgit.github.io/doconce/doc/web/index.html) so I am probably not going to use latex directly anymore!


Paper size, orientations and margins

```tex
\usepackage[letterpaper, portrait, margin=0.75in]{geometry}

# or 

\setlrmarginsandblock{2.5cm}{2.5cm}{*} % Left and right margin
\setulmarginsandblock{3cm}{3cm}{*}  % Upper and lower margin
\checkandfixthelayout
```

# changing the number of columns
https://www.sharelatex.com/learn/Multiple_columns
```tex
# This works with figures and scales them to the column width
\documentclass[twocolumn]{article}


#### NOT RECOMMENDED, does not show figures
# at the beginning of the document, add
\usepackage{multicol}
\begin{document}
\begin{multicols}{2}
# at the end of the article, add
\end{multicols}
\end{document}
```


References
An Introduction to Python and LaTeX - Pramode C.E_.pdf
