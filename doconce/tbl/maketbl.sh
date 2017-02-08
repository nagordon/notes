#!/bin/sh

# create a variable of the filename
dofile='mytbl'

#### Convert csv to doconce
doconce format pdflatex $dofile --tables2csv

#### Convert csvs to doconce table
doconce csv2table $dofile.csv > $dofile.do

## Edit the table in excel, 
##  and copy and paste doconce table into document
