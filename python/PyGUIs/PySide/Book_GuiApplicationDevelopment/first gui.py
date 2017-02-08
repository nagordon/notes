import sys
from PySide.QtCore import Qt
from PySide.QtGui import QApplication, QLabel





if __name__ == '__main__':
    myApp = QApplication(sys.argv)
    
    appLabel = QLabel()
    appLabel.setText("Hello, World!!!\n Look at my first app using PySide")
    appLabel.setAlignment(Qt.AlignCenter)
    appLabel.setWindowTitle("My First Application")
    appLabel.setGeometry(300, 300, 250, 175)
    # Show the Label
    appLabel.show()
    # Execute the Application and Exit
    myApp.exec_()
    sys.exit()