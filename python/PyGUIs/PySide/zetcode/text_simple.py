# -*- coding: utf-8 -*-
"""
Created on Wed Nov 26 15:59:11 2014

@author: ngordon
http://zetcode.com/gui/pysidetutorial/firstprograms/

"""

import sys

from PySide import QtGui

app = QtGui.QApplication(sys.argv)

wid = QtGui.QWidget()
wid.resize(250,150)
wid.setWindowTitle('Simple')
wid.show()

sys.exit(app.exec_())