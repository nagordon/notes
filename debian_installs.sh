#!/bin/sh

# make sure all sofware is updated and upgraded
sudo apt-get update
sudo apt-get upgrade

# set up time sync
sudo apt-get install ntp

# allow windows share drives to mount 
sudo apt-get install cifs-utils


sudo apt-get install virtualbox-guest-additions

# if on a virtual machine, installs the guest additions software
mount /dev/cdrom /mnt              # or any other mountpoint
cd /mnt
./VBoxLinuxAdditions.run
reboot

# files I always install in linux
sudo apt-get install build-essential
sudo apt-get install apache2 libapache2-mod-php5

# miniconda
wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
chmod +x Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh

# anaconda
#wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.2.0-Linux-x86_64.sh
#chmod +x Anaconda-2.2.0-Linux-x86_64.sh
#bash Anaconda-2.2.0-Linux-x86_64.sh

## after all installs complete, start a new terminal and update all python packages
# conda update --all

# creates open here in menu
sudo apt-get install nautilus-open-terminal
nautilus -q  

#sudo apt-get install texlive-latex-base
sudo apt-get install --install-recommends texlive-full
sudo apt-get install pandoc

# html to pdf conversion
sudo add-apt-repository ppa:ecometrica/servers
sudo apt-get update
sudo apt-get install wkhtmltopdf  
sudo apt-get -f install  # install dependencies

# version control
sudo apt-get install git
sudo apt-get install gitg
sudo apt-get install gitk
sudo apt-get install git-gui

# text editors
sudo apt-get leafpad
apt-get install gedit-dev
sudo apt-get install vim

# random stuff
sudo apt-get install tmux
sudo apt-get install wine
sudo apt-get install tightvncserver
sudo apt-get install lynx # web browser in the console
sudo apt-get install htop
sudo apt-get install p7zip-full

# Various conda packages if they are needed

conda install matplotlib
conda install pandas
conda install numpy
conda install ipython
conda install pip
conda install ipython-notebook



# Octave / MATLAB
sudo apt-add-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave

# remove any packages not needed
#sudo apt-get autoremove
