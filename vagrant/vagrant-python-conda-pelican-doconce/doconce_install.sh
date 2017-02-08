#!/bin/bash

# update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install texlive-latex-base
#sudo apt-get install -y --install-recommends texlive-full
sudo apt-get install -y pandoc

# html to pdf conversion
sudo add-apt-repository ppa:ecometrica/servers -y
sudo apt-get update -y
sudo apt-get install -y wkhtmltopdf  
sudo apt-get -f install  # install dependencies

###### doconce install
conda install --channel johannr doconce -y

#### or clone the git repo and install
# git clone https://github.com/hplgit/doconce.git
#chmod +x install_doconce.sh
#bash install_doconce.sh
