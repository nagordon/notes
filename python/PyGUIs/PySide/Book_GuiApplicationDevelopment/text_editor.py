# Import required modules
import sys
from PySide.QtGui import QApplication, QMainWindow, QStatusBar, \
                         QTextEdit, QAction, QIcon, QKeySequence, \
                         QMessageBox

class MainWindow(QMainWindow):
    """ Our Main Window class
    """
    def __init__(self):
        """ Constructor Function
        """
        QMainWindow.__init__(self)
        self.setWindowTitle("A Simple Text Editor")
        self.setWindowIcon(QIcon('appicon.png'))
        self.setGeometry(300, 250, 400, 300)                         
    
    def SetupComponents(self):
        """ Function to setup status bar, central widget, menu bar
        """
        self.myStatusBar = QStatusBar()
        self.setStatusBar(self.myStatusBar)
        self.myStatusBar.showMessage('Ready', 10000)
        self.textEdit = QTextEdit()
        self.setCentralWidget(self.textEdit)
        self.CreateActions()
        self.CreateMenus()
        self.fileMenu.addAction(self.newAction)
        self.fileMenu.addSeparator()
        self.fileMenu.addAction(self.exitAction)
        self.editMenu.addAction(self.copyAction)
        self.fileMenu.addSeparator()
        self.editMenu.addAction(self.pasteAction)
        self.helpMenu.addAction(self.aboutAction)         
    
    # slots called when the menu actions are triggered
    def newFile(self):
        self.textEdit.setText('')
    
    def exitFile(self):
        self.close()
    
    def aboutHelp(self):
        QMessageBox.about(self, "about a simple Text Editor",
          "This example demostrates the sue "
          " of the menu bar")
          
    def CreateActions(self):
        """ Function to create actions for menus
        """
        self.newAction = QAction( QIcon('new.png'), '&New',
                            self, shortcut=QKeySequence.New,
                            statusTip="Create a New File",
                            triggered=self.newFile)
        self.copyAction = QAction( QIcon('copy.png'), 'C&opy',
                        self, shortcut="Ctrl+C",
                        statusTip="Copy",
                        triggered=self.textEdit.copy)
        self.pasteAction = QAction( QIcon('paste.png'), '&Paste',
                        self, shortcut="Ctrl+V",
                        statusTip="Paste",
                        triggered=self.textEdit.paste)
        self.aboutAction = QAction( QIcon('about.png'), 'A&bout',
                        self, statusTip="Displays info about text editor",
                        triggered=self.aboutHelp)

        self.exitAction = QAction( QIcon('exit.png'), 'E&xit',
                        self, shortcut="Ctrl+Q",
                        statusTip="Exit the Application",
                        triggered=self.exitFile)                        

    # Actual menu bar item creation
    def CreateMenus(self):
        """ Function to create actual menu bar
        """
        self.fileMenu = self.menuBar().addMenu("&File")
        self.editMenu = self.menuBar().addMenu("&Edit")
        self.helpMenu = self.menuBar().addMenu("&Help")
        
        
if __name__ == '__main__':
    #QApplication.setStyle('plastique')
    myApp = QApplication(sys.argv)
    mainWindow = MainWindow()
    mainWindow.SetupComponents()
    mainWindow.show()
    myApp.exec_()
    sys.exit(0)
   