#!/bin/bash

# update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

# if you write Linux scripts in windows, you may to convert them to run on Linux
sudo apt-get install -y dos2unix

# set up time sync
sudo apt-get install -y ntp

# allow windows share drives to mount 
sudo apt-get install -y cifs-utils

# version control
sudo apt-get install -y git

# in shell editor
sudo apt-get install -y nano

# random cool python programs
pip install eg  # python bash help
pip install pyvim  # vim clone
pip install ptop   # python task manager


# python packages
conda install pip -y
conda install numpy -y
conda install ipython -y
conda install matplotlib -y
conda install pandas -y
conda install numpy -y
conda install ipython-notebook -y

