# -*- coding: utf-8 -*-
"""
Alternative to using a bash make file for creating doconce files
"""
import os, glob

def clearFiles(filetypes = ['toc', 'log', 'aux', 'out', 'idx', 'bbl', 'blg' , 'gz']):
    """clears the files """
    for fileext in filetypes:
        for f in glob.glob('*.'+fileext):
            try:
                os.remove(f)
            except:
                pass

clearFiles(['pdf','html'])

dofile = 'CATIA-Composites-Part-Design-Notes'

#create tex file 
os.system('doconce format pdflatex '+ dofile + ' --latex_code_style=vrb --latex_title_layout=std --latex_preamble=customization.tex')
os.system('doconce format pdflatex '+ dofile + ' --latex_code_style=vrb --latex_title_layout=std --latex_preamble=customization.tex')

# creates a two-column article
os.system("doconce subst 'twoside, ' 'twocolumn,\ntwoside, ' "+ dofile+".tex")

# create pdf from tex file
os.system('pdflatex '+dofile+'.tex')

# create html file
os.system('doconce format html '+dofile)

# create ipython notebook file
#doconce format ipynb $dofile

# convert ipython notebook to html
#ipython nbconvert $dofile.ipynb

clearFiles()
