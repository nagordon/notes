# powershell script to install windows programs using the chocolately package maanger
# install from a powershell terminal. https://chocolatey.org/ 

# if packagename is suffixed with .install as in packagename.install, it satisifies any other pacakge that depends on packagename. If the .install version is not used, then it will reinstall the program with the other dependent program 

# make sure you run the cmd as admin (type admin in search, right click, run as admin)

# to install automatically, use the -y flag
# to update programs use 
cup programname
# or to update all
cup all

choco install chocolatey -y
choco install notepadplusplus.install
choco install vim
choco install googlechrome
#or
choco install chromium
choco install firefox

# python stuff
choco install graphviz -y
choco install imagemagick -y
choco install ghostscript -y
choco install strawberryperl -y
choco install pandoc -y
choco install wkhtmltopdf -y

choco install audacity
choco install gimp
choco install paint.net

choco install git.install
choco install sourcetree
choco install gitextensions

choco install keepassx

choco install googledrive
choco install dropbox

choco install sumatrapdf.install

choco install owncloud-client
choco install pandoc

choco install steam

choco install googleearth
choco install picasa

choco install ffmpeg

choco install greenshot
choco install 7zip.install

choco install makemkv

choco install freemind
choco install xmind

choco install unetbootin

choco install miniconda
choco install pycharm-community

choco install putty.install
choco install winscp.install

choco install f.lux

choco install virtualbox
choco install virtualbox.extensionpack

choco install vagrant


choco install wget
choco install calibre

choco install winmerge

