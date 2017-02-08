import sys, time
from PySide.QtGui import QApplication, QMainWindow

class MainWindow(QMainWindow):

    def __init__(self):
        QMainWindow.__init__(self)
        self.setWindowTitle("Main Window")
        self.setGeometry(300,300,200,150)




if __name__ == '__main__':
    myApp = QApplication(sys.argv)
    myWindow = MainWindow()
    myWindow.show()
    myApp.exec_()
    sys.exit()