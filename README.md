# ﻿notes

keep syntax and user notes for anything I cant keep in my head

- - - -

to see who edited a windows file last, check ```owner```  

- - - -

# Excel hotkeys
select row and insert row = shift+space and ctrl+ +
select column and insert column = ctrl+space and ctrl+ +

# Windows Search


http://windows.microsoft.com/en-us/windows7/advanced-tips-for-searching-in-windows  
http://windows.microsoft.com/en-us/windows-vista/tips-for-finding-files#search  

```
Upper AND "DOG" AND "C-A-T" AND *.pptx AND System.Author:Neal  

System.Size:<1mb   

contains the word Upper and DOG and is a xlsx file
(Upper DOG *.xlsx)

:: this searches for part of the word CAT and A-B-C and mouse and R
CAT AND "A-B-C" AND mouse AND "R*" AND (Upr OR Upper)

```

# powershell notes
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



- - - -
# Using virtualbox for virtualization

## Creating a share drive in Windows 7 and VirtualBox with Linux

1. Create a directory named ```share``` on the host machine, perferrably in the VM folder typically ```C:\Users\user1\VirtualBox VMs\xubuntu\share```
2. Create a directory in the home directory, ```mkdir /home/user1/share```
3. Launch virtual machine and add share definition with
```
> Devices
 > Shared Folder Settings
  > Add new share folder definition
```
4. run ```sudo mount -t vboxsf share /home/user1/share``` on the host machine to mount


To work through the command line with a shared folder, set up ssh, and connect with gitbash

```bash
sudo apt-get install ssh

#launch gitbash from the share folder
ssh neal@12.34.56.78
```

if having issues with Screen resolution and copy-paste etc, run the guest additions install

VirtualBox -> Devices -> Insert Guest Additions CD Image


# Websites
A collection of html documents and are accessed through a webrowser. The files can be static HTML, HTML generated via PHP, page updates using AJAX and JSON sata, or flash and java plugins dynamically getting content from the webserver

## Understanding Websites
### Webservers
Some examples of webservers

 - List item
 - lighttpd
 - nginx
 - apache
 - tornado
 - SimpleHTTPServer

### Content Management Systems
Once you have a webserver running, you need a CMS program to manage your content
Alternatively you can just host a static website without a CMS

 - Drupal (PHP CMS )
 - Wordpress (PHP CMS )
 - Joomla

Things to investigate

 - HTML5

- - - -
## Apache webservers
http://httpd.apache.org/docs/2.4/getting-started.html
### Getting Started
* URL - uniform resource locators which specify
	* protocol (eg HTTP),
	* servername (eg www.apache.com)
	* url path (/docs/current/getting-started.html
	* possibly a query string ( ?arg=value)
* a client, such as a web browser connects to a server
* a url path may represent

#### Hostnames and DNS
The hostname is where the server resides on the internet. More than one hostname may point to the same IP address, and more the one IP address can be attached the the same physical server using virtual hosts

For local tests without intern accessibility, you can put the host names in your hosts file ```/etc/hosts```
```bash
127.0.0.1 www.example.com
# or commonly
127.0.0.1 localhsot
```



#### Apache file config


#### Apache website content
content is stored in ```/var/www/html/site1/```  

- - - -
# Markdown Cheatsheet

* https://guides.github.com/features/mastering-markdown/
* https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet
* http://assemble.io/docs/Cheatsheet-Markdown.html
* http://daringfireball.net/projects/markdown/



- - - -

# Gmail

## searching mutiple tags with 'and'
in:inbox in:label2

## search multiple tags with 'or'
in:inbox OR in:label2

### search
from:(myemail@mydomain.com) (in:inbox OR in:label2)

### search all starred items
is:starred

### search all chats from john doe
in:chats john doe  

# Google Searches

### exact phrase
* "use quotes"
###exact phrase with missing words
* "I forget * words * this song "
###exclude words with minus    
* cat -dog
###synonyms , prefix a word with ~
* ~run
###site query, search within a website site:
* site:    site.com
###search specific sites that link to that specific site
* link: site.com
###use two peroids to indicate a range between numbers
* 21..374
###find sites that are related to specified site
* related:  www.google.com


#Google's scripting language  
https://script.google.com
```
/**
 * Creates a new site page using the Sites API.
 * For more information on using the Sites API, see
 * https://developers.google.com/apps-script/service_sites
 */
function createDemoPage() {
  var domain = 'yourdomain.com';
  var site = 'your_site';
  var pageName = 'script_center_demo';
  var html =
    '<div><div style="margin-left:auto;margin-right:auto;'
      + 'display:block;font-size:18px;font-weight:bold;"><img alt="Scripts Logo"'
      + 'border="0" src="http://gascriptcenter.appspot.com/images/docs_apps_scripts-48.gif">'
      + '&nbsp;Google Apps Script Center Project Page</div><div><p>&nbsp;</p>'
      + '<p style="font-size:14px;font-weight:bold;">Executive Summary</p>'
      + '<p>This project aims to....</p></div></div>';

  var site = SitesApp.getSite(domain, site);
  site.createWebPage('Script Center Demo', pageName, html);
};
```


# Batch files
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

- - - -
