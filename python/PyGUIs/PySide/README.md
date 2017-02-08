Pyside package

Can install Pyside by running 

'''batch
pip install -U PySide
'''

to properly compile, make sure that modules are not import multiple times. I import only the base module 
for example do not do

'''python
from numpy import np
import numpy
'''
