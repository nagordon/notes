#!/bin/bash

# update and upgrade
sudo apt-get update && sudo apt-get upgrade

# not sure why I have to install this, but I get a warning message that it is missing
sudo apt-get install nodejs

# pelican
pip install pelican # conda install -c https://conda.binstar.org/travis pelican

pip install Markdown

conda install ipython==2.4.1 -y  # this is important because of liquid tags

# for github blogs, this tool makes it very easy to update the blog
pip install ghp-import

## after all installs complete, start a new terminal and update all python packages
#conda update --all
