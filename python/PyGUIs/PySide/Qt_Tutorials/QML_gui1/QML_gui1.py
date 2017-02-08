# -*- coding: utf-8 -*-
"""
Created on Wed Nov 26 12:19:44 2014

@author: ngordon
"""

import sys
from PySide.QtCore import *
from PySide.QtGui import *
from PySide.QtDeclarative import QDeclarativeView

# Create Qt Aplication and the QDeclarative view
app = QApplication(sys.argv)
view = QDeclarativeView()

# Create an URL to the QML file 
url = QUrl('view.qml')

#set the qml and show
view.setSource(url)

# resizes the red when the window size is changed
view.setResizeMode(QDeclarativeView.SizeRootObjectToView)

view.show()

#Enter Qt main loop
sys.exit(app.exec_())