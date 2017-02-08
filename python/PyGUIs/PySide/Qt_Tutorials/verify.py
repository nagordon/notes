# -*- coding: utf-8 -*-
"""
Created on Wed Nov 26 12:28:32 2014
@author: ngordon
http://qt-project.org/wiki/Setting_up_PySide
"""

import PySide
print(PySide.__version__)
# should be somethign life 1.0.0

import PySide.QtCore
print(PySide.QtCore.__version__)
#should be something like 4.7.4

print(PySide.QtCore.qVersion())
# should be somethign likfe 4.7.4


import sys
import PySide
from PySide.QtGui import QApplication
from PySide.QtGui import QMessageBox
 
# Create the application object
app = QApplication(sys.argv)
 
# Create a simple dialog box
msgBox = QMessageBox()
msgBox.setText("Hello World - using PySide version " + PySide.__version__)
msgBox.exec_()