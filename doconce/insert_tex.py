# -*- coding: utf-8 -*-
"""
Created on Thu May 28 2015
By Neal Gordon
https://github.com/nagordon

Inserts code into tex file to indicate a two column formatting
To be used with a sh file where a tex file is defined as 

dofile = 'mytexfile'
python insert_tex.py $dofile.tex

"""
import shutil, os, sys

texfile = str(sys.argv[1])
#beforetxt =  str(sys.argv[2])
#inserttxt =  str(sys.argv[3])

shutil.copyfile(texfile, 'tmp_'+texfile)

with open('tmp_'+texfile) as f_old, open(texfile, "w") as f_new:
    for line in f_old:
        f_new.write(line)
        if '\\documentclass' in line:
            f_new.write("twocolumn,\n")

os.remove('tmp_'+texfile)
