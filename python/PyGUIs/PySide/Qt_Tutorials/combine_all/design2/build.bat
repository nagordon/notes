::C:\Anaconda\Lib\site-packages;C:\Anaconda\Lib\site-packages\PySide;C:\Anaconda\Scripts

:: converts the user interface to python code
pyside-uic ui_combine.ui -o ui_combine.py

:: converts the icons to python v2.x file. 
:: NOTE-may need to update PATH variable to include different locations
pyside-rcc combine.qrc -o qrc_combine2.py

:: compile to windows
:: pyinstaller combine.py --onefile

:: run python
python combine.py