#!/bin/sh


# create a variable of the doconce file
dofile='doconce_notes'

 ####### cleanup  ####### 
####remove the pdfs and tex file that will be overwritten
rm $dofile.pdf

 ####### Latex  ####### 
#### Create a plain tex file, it seems to throw an error if we dont make a plain tex file first
doconce format pdflatex $dofile

doconce format pdflatex $dofile \
			--latex_code_style=vrb \
			--latex_title_layout=std \
			--tables2csv  
			#--latex_code_style=vrb

rm -f *.aux
pdflatex $dofile.tex
bibtex $dofile
pdflatex $dofile.tex
pdflatex $dofile.tex
mv $dofile.pdf $dofile.simple.pdf

#### Create tex file with fancy formatting and custom latex
doconce format pdflatex $dofile \
			--latex_code_style=pyg \
			--latex_title_layout=std \
			--latex_preamble=customization.tex
			#--latex_todonotes  # includes inline notes

#### helps position the figures
doconce replace 'begin{figure}[t]' 'begin{figure}[H]' $dofile.tex

# create the pdf of the tex file	
rm -f *.aux				
pdflatex -shell-escape -interaction=batchmode $dofile.tex
bibtex $dofile
pdflatex -shell-escape -interaction=batchmode $dofile.tex
pdflatex -shell-escape -interaction=batchmode $dofile.tex
mv $dofile.pdf $dofile.1col.pdf

#### creates a two column article
# old method python insert_tex.py $dofile.tex
doconce subst 'twoside,' 'twocolumn,\ntwoside,' $dofile.tex

# create the pdf of the tex file	
rm -f *.aux				
pdflatex -shell-escape -interaction=batchmode $dofile.tex
bibtex $dofile
pdflatex -shell-escape -interaction=batchmode $dofile.tex
pdflatex -shell-escape -interaction=batchmode $dofile.tex
mv $dofile.pdf $dofile.2col.pdf

 ####### Markdown  ####### 

#create the github markdown from the doconce_notes.do.txt file
doconce format pandoc $dofile --github_md

#From markdown to docx
pandoc -s -S $dofile.md -o $dofile.md.docx

 ####### ipython notebook  ####### 

# create ipython notebook file
doconce format ipynb $dofile

# create an html file from the ipynb
ipython nbconvert $dofile.ipynb
mv $dofile.html $dofile.ipynb.html
wkhtmltopdf $dofile.ipynb.html $dofile.ipynb.pdf

 ####### Tables  ####### 
doconce format --tables2csv

 ####### HTML  ####### 

# create a styled html file
doconce format html $dofile --html_style=tactile-black
wkhtmltopdf $dofile.html $dofile.html.pdf


####### Change figure path when blogging ####### 
#      --figure_prefix=http://project.github.io/...

 ####### cleanup ####### 

doconce clean

# remove all the files that are generated during doconce make
rm *.toc *.log *.aux *.out *.idx *.bbl *.blg *.gz

# removes the trash directory
rm -R Trash
