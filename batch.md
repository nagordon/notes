A batch file (*.bat) is a simple windows script that can automate simple tasks. An superficial analogous file in linux is a bash file
Also, (*.ps1) files or powershell is a much better windows console

# batch file to launch git on windows
```batch
start "" "%SYSTEMDRIVE%\Program Files (x86)\Git\bin\sh.exe" --login
```

# set git bash as the default terminal in pycharm in windows
* File -> settings -> terminal -> shell path
```batch
C:\Program Files (x86)\Git\bin\sh.exe --login


:: windows commands



:: determine what files are associated to why extension
assoc | find "py"

:: waits for keyboard input from user
pause
```

:: open google in internet explorer from a batch file
start iexplore.exe http://google.com

:: open a jupyter notebook in the current directory
:: change console to the current working directory
Pushd "%~dp0"
:: launch jupyter notebook
jupyter notebook
