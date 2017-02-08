import sys
from PySide.QtGui import QApplication, QWidget, QIcon

class SampleWindow(QWidget):

    def __init__(self):
        QWidget.__init__(self)
        self.setWindowTitle("Icon Sample")
        self.setGeometry(300,300,200,150)

    def setIcon(self):
        appIcon = QIcon()
        self.setWindowIcon(appIcon)



if __name__ == '__main__':
    myApp = QApplication(sys.argv)
    myWindow = SampleWindow()
    myWindow.setIcon()
    myWindow.show()

    # Execute the Application and Exit
    myApp.exec_()
    sys.exit()