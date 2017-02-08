# vagrant-miniconda

I cannot get a silent install of miniconda to work for the life of me, so for now, looks like it is a manual install. Here are the instructions for a manual install and install scripts for other stuff

```bash
git clone https://github.com/nagordon/vagrant-miniconda.git
cd vagrant-miniconda
vagrant up
vagrant ssh
```

copy and paste these commands line by line into the vagrant shell to manually install miniconda

```bash

# downloads miniconda
wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh

# makes the miniconda installation executable
chmod +x Miniconda-latest-Linux-x86_64.sh

Make sure you select yes for adding the path. Also spacebar to skip the documentation at the beginning
bash Miniconda-latest-Linux-x86_64.sh

# installs miniconda manually. 
# [Enter] start installation
# [spacebar 2x] skip through licensing
# [yes] agree to license
# [yes] choose default install location
# [yes] append conda to path

# remove the downloaded fil
rm Miniconda-latest-Linux-x86_64.sh

```

now close the ssh connection and restart to access conda
```bash
exit
vagrant ssh
```

Issues with writing bash scripts in windows
As you start editing install scripts and the Vagrantfile, I have found that using windows text editors messes up the character encoding, so use gitbash and vim, like ```vim install.sh``` to launch the in shell editor. If you do edit files in windows, you may need to convert them. I have found dos2unix to work well. To install and convert a shell script in place, use
```bash
sudo apt-get install dos2unix
dos2unix script.sh
```

Run the install script to get all the packages you want

```bash
# change dirctory to the share directory
cd /vagrant

#make the script executable
chmod +x install.sh

# run the script
bash install.sh
```
