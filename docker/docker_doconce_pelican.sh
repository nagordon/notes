#!/bin/bash

# update and upgrade
echo "updating and upgrading..."
sudo apt-get update && sudo apt-get upgrade

# set up time sync
echo "install ntp..."
sudo apt-get install ntp

# allow windows share drives to mount 
echo "install cifs-utils..."
sudo apt-get install cifs-utils

#sudo apt-get install texlive-latex-base
echo "install tex"
sudo apt-get install --install-recommends texlive-full
sudo apt-get install pandoc

# html to pdf conversion
echo "install wkhtmltopdf..."
sudo add-apt-repository ppa:ecometrica/servers -y
sudo apt-get update
sudo apt-get install wkhtmltopdf  
sudo apt-get -f install  # install dependencies

# version control
echo "install version control..."
sudo apt-get install git
sudo apt-get install gedit
sudo apt-get install leafpad

#### python installation with conda
echo "python installtion"
conda_ver=Miniconda-latest-Linux-x86_64.sh
if [[ ! -f $conda_ver ]]; then
    wget http://repo.continuum.io/miniconda/$conda_ver
	#wget --quiet http://repo.continuum.io/miniconda/$conda_ver   ### hide progress bar
    chmod +x $conda_ver
    bash $conda_ver -b -p $HOME/miniconda
    export PATH="$HOME/miniconda/bin:$PATH"
    # conda info -a
fi

conda install pip -y
conda install matplotlib -y
conda install pandas -y
conda install numpy -y
conda install ipython-notebook -y

# random cool python programs
echo "installing various cool python programs"
pip install eg  # python bash help
pip install pyvim  # vim clone
pip install ptop   # python task manager

###### doconce install
echo "doconce install via conda..."
conda install --channel johannr doconce -y
#### or clone the git repo and install
#chmod +x install_doconce.sh
#bash install_doconce.sh

# pelican
echo "install pelican..."
pip install pelican # conda install -c https://conda.binstar.org/travis pelican

## to create a python virtual env
#conda create -n pylican python=2.7
#source activate pylican  # or just 'activate pylican' in windows

pip install Markdown
conda install ipython==2.4.1 -y  # this is important because of liquid tags

# for github blogs, this tool makes it very easy to update the blog
pip install ghp-import

## after all installs complete, start a new terminal and update all python packages
#conda update --all
