#!/bin/sh

# create a variable of the doconce file
dofile='doconce_notes'

 ####### cleanup  ####### 
####remove the pdfs and tex file that will be overwritten
rm $dofile.pdf

 ####### ipython notebook  ####### 

# create ipython notebook file
doconce format ipynb $dofile --figure_prefix=blogtest

mv $dofile.ipynb $dofile.blog.ipynb

# create an html file from the ipynb
ipython nbconvert $dofile.blog.ipynb

 ####### cleanup ####### 

doconce clean

# remove all the files that are generated during doconce make
rm *.toc *.log *.aux *.out *.idx *.bbl *.blg *.gz

# removes the trash directory
rm -R Trash
