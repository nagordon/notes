#!/bin/sh


# create a variable of the doconce file
dofile='doc1'

 ####### cleanup  ####### 
####remove the pdfs and tex file that will be overwritten
rm $dofile.pdf


 ####### Markdown  ####### 

#create the github markdown from the doconce_notes.do.txt file
doconce format pandoc $dofile --github_md

#From markdown to docx
pandoc -s -S $dofile.md -o $dofile.md.docx

 ####### ipython notebook  ####### 

# create ipython notebook file
doconce format ipynb $dofile

 ####### HTML  ####### 

# create an html file from the ipynb
ipython nbconvert $dofile.ipynb
mv $dofile.html $dofile.ipynb.html

# create an html file from the ipynb
doconce format html $dofile
mv $dofile.html $dofile.simple.html

# create a styled html file
doconce format html $dofile --html_style=tactile-black

####### Change figure path when blogging ####### 
#      --figure_prefix=http://project.github.io/...

 ####### cleanup ####### 

doconce clean

# remove all the files that are generated during doconce make
rm *.toc *.log *.aux *.out *.idx *.bbl *.blg *.gz

# removes the trash directory
rm -R Trash
