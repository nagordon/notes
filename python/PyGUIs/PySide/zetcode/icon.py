# -*- coding: utf-8 -*-
"""
Created on Wed Nov 26 15:59:11 2014

@author: ngordon
http://zetcode.com/gui/pysidetutorial/firstprograms/

procedural style vs OOP. This is OOP
"""
import sys
from PySide import QtGui

class Example(QtGui.QWidget):
    def __init__(self):
        super(Example, self).__init__()
        
        self.initUI()
        
    def initUI(self):
        self.setGeometry(300,300,250,150)
        self.setWindowTitle('Icon')
        self.setWindowIcon(QtGui.QIcon('pysidelogo.png'))
        self.show()

def main():
    app = QtGui.QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
    

if __name__ == '__main__':
    main()