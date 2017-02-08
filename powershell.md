
```
# powershell notes
# launch from cmd
powershell

# print working directory
pwd

# get help for the command pwd
Get-Help pwd

# change directory
cd

# list files
ls

# recursive folder listing 
ls -R

# change to user directory
cd ~

# make new directory
mkdir new directory

# make new file
new-item file1.txt -type file

# view file
cat file1.txt

# move file
mv file1 file2

# copy file
cp file1 file2

# count text files
ls -filter *.txt | measure

# variable decalration
$num = 1

# prints to console or to a file via >
"Hello, World!"

# write strings in script1.ps1 to log.txt
script1.ps1 > log.txt

# change to C drive
C:

# for signed scripts run this to allow home-made scripts to run
Set-ExecutionPolicy Restricted

# run this command to allow for home-made scripts to run
Set-ExecutionPolicy Unrestricted

# prints all files on the current disk
tree \

# prints only directories in dir1
tree ./dir1

# prints all files and folders in dir1
tree /F ./dir1

# fix path issues
echo %path% # to show the path varaible
PATH   # or this 
# mycomputer>properties>advanced sytemsettings>Environmental variables>System variables
# add this to the path    c:\windows\system32;c:\windows;

# Windows tricks to make onces life easier
# shift + r-click on a file, select copy as path
# shift + r-click in windows, open command window here
```



to get file and directory tree
```
tree /F > tree.txt
```

## directorys and files  
```
                        Folder PATH listing
Volume serial number is 18C2-EE86
C:.
│   .gitignore
│   bash.md
│   batch.md
│   django.md
│   git.md
│   google.md
│   linux.md
│   markdown.md
│   powershell.md
│   python.md
│   python_notes.ipynb
│   README.md
│   vim.txt
│   web2py.md
│   
├───cherrypy
│   │   index.html
│   │   my.db
│   │   tut01.py
│   │   tut02.py
│   │   tut03.py
│   │   tut04.py
│   │   tut05.py
│   │   tut06.py
│   │   tut07.py
│   │   tut08.py
│   │   tut09.py
│   │   
│   └───public
│       └───css
│               style.css
│               
├───databases
│   │   data.dbl
│   │   databases.ipynb
│   │   dbase1
│   │   phone.sql
│   │   
│   └───.ipynb_checkpoints
│           databases-checkpoint.ipynb
│           
└───flask
    │   flask-test1.py
    │   
    └───discover-flask
        └───flask-intro
            │   app.py
            │   
            └───templates
                    welcome.html
                    

```

