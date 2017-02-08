# Python Notes

python is my favorite programming language for engineering, IT stuff, and goofing around doing anything with computers

http://docs.python-guide.org/en/latest/  
https://github.com/vinta/awesome-python  
http://matthiaseisen.com/fwl/py/?utm_content=buffer6591b&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer  
https://github.com/ipython/ipython/wiki/Cookbook%3A-Index  
https://docs.python.org/2/tutorial/  
http://www.diveintopython.net/  
http://interactivepython.org/courselib/static/diveintopython3/index.html  

conda install -c https://conda.binstar.org/krisvanneste pygame  

## windows compilers
http://.aka.ms/vcpython27  

https://wiki.python.org/moin/WindowsCompilers  


## easily launch an jupyter/ipython notebok in windows from a batch file
```
# create bat file run_jupyter.bat

:: change console to the current working directory
Pushd "%~dp0"

:: launch jupyter notebook
jupyter notebook


```


## Running Code and debugging
```
run -d Simpson.py # enter debugging mode in ipython
## commands    
c or continue  # continue to next breakpoint
s or step   # next line and will enter functions
p or print
n or next    # next line, does not enter functions
break 5 # create a beakpoint at line 5
disable 5 # turns off breakpoint on line 5
list 10 # shows the lines around line 10
whatis x # where x is a variable
```

```
#run .py file in ipython
run ball.py
execfile("ball.py")

#run in ipython notebook
!run ball.py

#run python in ipython with debugger
run -d countdemo.py

#run .py file in DOS/UNIX
python ball.py
```


start python/ipython interpretor in windows or bash console  
```$ python```  
```$ ipython```  

run python program in console (ensure you are in the same directory as the file)  
```$ python example.py```

run python program in ipython console  
```In [1]: run example.py```  

run python program in python console  
```bash
execfile("example.py")
```

when in ipython, to reset all variables type
```
%reset
```

starts an ipython notebook server with the pylab module imported and plotting inline  
```ipython notebook pylab --inline```  

install a python module with the setup.py file. will be installed to C:\Python27\Lib\site-packages with the python(x,y) package  
```python setup.py install```

windows,bash / python package management with pip
```
pip list
pip list --outdated
pip install SomePackage
pip install PackageNameHere --upgrade
pip show --files PyPdf2
pip show beautifulsoup4
```

To update all package in pip
```python
import pip
from subprocess import call

for dist in pip.get_installed_distributions():
    call("pip install --upgrade " + dist.project_name, shell=True)
```    
alternative method
```
for i in ` pip list|awk -F ' ' '{print $1}'`;do pip install --upgrade $i;done
```


## Installation and favorite packages

### when using ipython notebook install mathjax for offline use
```python
#install mathjax from console
python -m IPython.external.mathjax
```

```
# or from python
>>> from IPython.external import mathjax; mathjax.install_mathjax()
```

## assuming you have anaconda or miniconda installed.  

Anaconda distribution-I like it because it install most of the packages I need and is supported on linux and windows.
```

conda install -c https://conda.anaconda.org/pyzo pyside-pyzo
conda install pyqt

conda install pyside
export QT_API=pyside

pip install ptpython

pip install graphviz

conda update conda # updates conda
conda update --all   # updates all apckages
conda -h  # help
conda info
conda info --all
conda install matplotlib=1.2
conda update matplotlib
conda install rope
conda install ~/redis-py-2.7.2-py27_0.tar.bz2

pip install ggplot
pip install -U rodeo


```

## Importing modules
```
import math as m    # importing
from math import *   # import all
```

## System info
```
# displays the version of python installed
import sys
sys.version

# add a system path
sys.path.append("C:/bin/scripts")
import newmodule # which is the filename wihtout the .py extension
```

## getting help
```
import os
help(os)
os?    # only in ipython
```


## IDE tools

Favorite IDE
* Pycharm
* Spyder
* Pyzo
* calico

##pycharm

>crtl+r # renames all instances of a varaible. refactoring
>ctrl+lclick # goes to object or command
>shift+cmd+a # find action
>tab # autocomplete
>select code, right click on selection, and select "Execute Selection in console" ,
>select and ctrl+alt+e to execute in console
>type aly+enter to give options, can automatically create a function
>capitalize the first letter and type in parenthesis , at the beginning of the work alt+enter to create class
>also if you type in a method, it will automatically create it
>terminal shell path
>cmd.exe
>powershell.exe
>C:\Program Files (x86)\Git\bin\sh.exe --login
>or launch from an existing cmd
>"C:\Program Files (x86)\Git\bin\sh.exe" --login


location to change the templates to add a code toggle  
> C:\Users\ngordon\AppData\Local\Continuum\Anaconda\Lib\site-packages\IPython\html\templates

Location of notebook extensions  
> C:\Users\ngordon\.ipython\nbextensions



# Virtual Environments

However, some packages I install fail because of existing packages conflict. So, install a virtualenv using conda
windows virtual environment management. With Aanconda 2.7 64 bit version installed
to creates a virtual environment for 3.4, from the anaconda command prompt, type 

 
```
# list all the virtualenv
conda info -e
```

bash set myenv as the default python interpretor
```bash
export PATH=~/anaconda/envs/myenv/bin:$PATH
```

windows/bash set myenv as the default interpretor
```
set PATH=C:\Anaconda\envs\myenv\Scripts;%PATH%
# or 
set PATH=C:\Anaconda\envs\py34\Scripts;C:\Anaconda\envs\py34;%PATH%```
```

say we want to create a minimal env with scikit-learn
```bash
conda search --all scikit-learn
conda depends scikit-learn
conda create -n test scikit-learn
```

crate a virtualenv with just numpy   
```
conda create -n np1.6 anaconda numpy=1.6
```

create another virtualenv in bash
```
conda create -n py34 python=3.4 anaconda
source activate py34
source deactivate
```
create another virtualenv in windows
```
conda create -n py34 python=3.4 anaconda
activate py34
deactivate
```

delete virtualenv
```
conda remove --all -n ENV
```


## Science basic ipython install on windows
install [miniconda](http://repo.continuum.io/miniconda/Miniconda-latest-Windows-x86_64.exe)
```bat
conda create -n scienv python
activate scienv
:: see packages that are installed
conda list
:: install packages
conda install numpy
conda install pandas
conda install pywin32
pip install python-pptx
pip install pyinstaller
pip install moviepy

pip install scipy matplotlib
::or
conda install matplotlib=1.4.3

conda update matplotlib
```


simple http server
```
python3 -m http.server
#or
python -m SimpleHTTPServer
# or specify port 8000
python -m SimpleHTTPServer 8000

# retrieve the file
wget http://127.0.0.1:8000 /home/trijazzguy/randomefileyouwant

```

set matplotlib to piopout
```
import matplotlib
matplotlib.use('TkAgg') 
```


# packages that were tricky to install

## geoplotlib (mint)
```bash
sudo apt-get update ; sudo apt-get upgrade
pip install pyglet 
git clone https://github.com/andrea-cuttone/geoplotlib.git
cd geoplotlib
python setup.py install
```


 [scitools](https://github.com/hplgit/scitools)

```
git clone https://github.com/hplgit/scitools.git
```
and then run
```
python setup.py install

```

exec("from pylab import *\nx = arange(-pi*4,pi*4,.01)\ny = sin(x)/x\nplot(x,y)\nshow()")

exec("from pylab import * ; x = arange(-pi*4,pi*4,.01) ; y = sin(x)/x ; plot(x,y) ; show()")


A = lambda d : 3.14159*d**2/4
