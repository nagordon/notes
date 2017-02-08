# -*- coding: utf-8 -*-
"""
http://qt-project.org/wiki/Hello-World-in-PySide
"""

import sys
from PySide.QtCore import *
from PySide.QtGui import *

app = QApplication(sys.argv)

#label = QLabel("Hello World")
label = QLabel("<font color=red size=40>Hello World</font>")
label.show()
app.exec_()
sys.exit()