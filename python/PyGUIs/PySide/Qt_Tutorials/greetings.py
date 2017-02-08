# -*- coding: utf-8 -*-
"""
Created on Wed Nov 26 15:17:15 2014

@author: ngordon
http://qt-project.org/wiki/PySideTutorials_Simple_Dialog
"""

import sys
from PySide.QtCore import *
from PySide.QtGui import *

class Form(QDialog):
    def __init__(self, parent=None):
        super(Form, self).__init__(parent)
        self.setWindowTitle("Neals Form")
        
        # Create widgets
        self.edit = QLineEdit("Your Name?")
        self.button = QPushButton("Show Greetings")
        
        # create the layout and add widgets
        # layout = QVBoxLayout()  # vertical 
        layout = QHBoxLayout()    # horizontakl
        
        layout.addWidget(self.edit)
        layout.addWidget(self.button)
        #set dialog layout
        self.setLayout(layout)
        
        # Add button signal to the greetings slot
        self.button.clicked.connect(self.greetings)
        
    def greetings(self):
        print("Hello %s" % self.edit.text())
        
if __name__ == '__main__':
    # Create the Qt Aplpcaition
    app = QApplication(sys.argv)
    # Create ans how the form
    form = Form()
    form.show()
    # Run the main Qt loop
    sys.exit(app.exec_())