# Linux - some notes on me trying to learn about linux

[Unix Overview](http://www.tutorialspoint.com/unix/unix-getting-started.htm)

## update all packages before installing stuff
```
sudo apt-get update && sudo apt-get upgrade
```

With the error ```bash: ./make.sh: /bin/sh^M: bad interpreter:```, the sh file has likely been edited in windows and needs to be converted
```bash
sudo apt-get install dos2unix
dos2unix make.sh
```

when compiling use 
```bash
sudo apt-get install build-essential
```

updating dns server
```bash
# update config file with dns ip 
sudo nano /etc/network/interfaces
dns-nameservers 66.212.63.228
sudo restart network-manager
```

searching packages in debian apt
```bash
apt-cache search keyword
```



# copying things to the clipboard  
```sudo apt-get install xclip```  
You can use xclip as well to output the contents of the clipboard:  
```xclip -o```
And to save the contents of the clipboard to a file (e.g. ~/test.txt), you'd call xclip as follows:  
```xclip -o > ~/test.txt```  


##firewall configuration using ufw
```bash
sudo ufw status
sudo ufw disable
sudo ufw enable
sudo ufw reload
```

## Networking stuff
* DNS - Domain naming service


save current firewall rules
```bash
sudo iptables-save > /root/firewall.rules
```

## databse setup
```bash
sudo apt-get install mysql-client
sudo apt-get install mysql-server
mysql -u root -p # log in to user
```

## Apache install
```bash
sudo apt-get install apache2 libapache2-mod-php5

apache2ctl start   
#or
/etc/init.d/apache2 start

apache2ctl stop
apache2ctl restart

#config files
/etc/apache2/httpd.conf
/etc/apache2/apache2.conf

# setup. Change names in
nano /etc/hostname

and update with ip addresses
nano /etc/hosts

127.0.0.1 localhost

to use python in an apache server, use WSGI - Web Server Gateway Interface
sudo apt-get install libapache2-mod-wsgi
```

# TMUX notes

# tmux cheatsheet
```bash
# Tmux notes
tmux # starts tmux terminal
ctrl+b # allows commands to be entered
d # command to detach
attach tmux # reattachs to tmux session

#start new:
tmux

# start new with session name:
tmux new -s myname

#attach:
tmux a  #  (or at, or attach)

#attach to named:
tmux a -t myname

#list sessions:
tmux ls

#kill session:
tmux kill-session -t myname

In tmux, hit the prefix `ctrl+b` and then:

## Sessions

    :new<CR>  new session
    s  list sessions
    $  name session

## Windows (tabs)

    c           new window
    ,           name window
    w           list windows
    f           find window
    &           kill window
    .           move window - prompted for a new number
    :movew<CR>  move window to the next unused number

## Panes (splits)

    %  horizontal split
    "  vertical split
    
    o  swap panes
    q  show pane numbers
    x  kill pane
    ⍽  space - toggle between layouts

## Window/pane surgery

    :joinp -s :2<CR>  move window 2 into a new pane in the current window
    :joinp -t :1<CR>  move the current pane into a new pane in window 1

* [Move window to pane](http://unix.stackexchange.com/questions/14300/tmux-move-window-to-pane)
* [How to reorder windows](http://superuser.com/questions/343572/tmux-how-do-i-reorder-my-windows)

## Misc

    d  detach
    t  big clock
    ?  list shortcuts
    :  prompt

Resources:

* [cheat sheet](http://cheat.errtheblog.com/s/tmux/)

Notes:

* You can cmd+click URLs to open in iTerm.

TODO:

* Conf copy mode to use system clipboard. See PragProg book.
```

# making a disk image (iso or img) from a cd or DVD  
see this [blog post](http://kvz.io/blog/2007/08/01/make-iso-images-on-linux/) for a good explanation
first, lets find the name of the cd or DVD
```
$ lsblk

NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 698.7G  0 disk 
├─sda1   8:1    0 692.7G  0 part /
├─sda2   8:2    0     1K  0 part 
└─sda5   8:5    0   5.9G  0 part [SWAP]
sr0     11:0    1 738.4M  0 rom  /media/neal/SFM0092
```

sr0 is our cdrom due to the type. So now, all we do is write the contents of the cd to a file  
```
sudo cat /dev/sr0 > /home/neal/mycd.iso
```

Alternativley, we can create use the command dd, or disk dump  
```
dd if=/dev/cdrom of=~/cdrom_image.iso
```


# Fedora python install
# installing python on a redhat linux machine
```
yum install wget
wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.1.0-Linux-x86_64.sh
bash Anaconda-2.1.0-Linux-x86_64.sh # follow command prompts, hit space to skip to bottom
export PATH=~/anaconda/bin:$PATH # if the commands aren't accesible after install, run this to create the environment variable
```

#full anaconda
```
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.2.0-Linux-x86_64.sh
bash Anaconda-2.2.0-Linux-x86_64.sh
```

#miniconda/Miniconda-latest-Linux-x86_64
```
wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh
```

# http://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client/
```
cd /usr/local/src
wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
tar xzf noip-duc-linux.tar.gz
cd no-ip-2.1.9
make
make install
/usr/local/bin/noip2 -C
/usr/local/bin/noip2 
```


# Cent OS
```
yum install wget
w # shows what users are logged in and what resources they are using
who # 
tail -f /path/thefile.log  # reads the file live
```


# debian software install

In ubuntu, to install open terminal here
```
sudo apt-get install nautilus-open-terminal
nautilus -q  
```

```
#!/bin/sh
sudo apt-get install texlive-latex-base
sudo apt-get install --install-recommends texlive-full

# commonly installed packages 

# update everything first
sudo apt-get update
sudo apt-get upgrade

# OS stuff
sudo apt-get install ssh
sudo apt-get install tightvncserver

#sudo apt-get install git
#sudo apt-get install gitg
#sudo apt-get install gitk
sudo apt-get install git-gui
#sudo apt-get leafpad
apt-get install gedit-dev
sudo apt-get install vim
sudo apt-get install wkhtmltopdf
sudo apt-get install tmux

# python stuff
bash Anaconda-2.1.0-Linux-x86_64.sh
pip install runipy

# fun stuff
sudo apt-get install wine


# random install junk

# Standard software to install for Neal in Linux

sudo apt-get update
sudo apt-get upgrade

# calibre linux
sudo -v && wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
```


# GParted
# cantor
# gimp

# pandoc fedora
# https://gist.github.com/grownseed/4fd2e91eca829cc039de
```
wget http://www.haskell.org/ghc/dist/7.8.2/ghc-7.8.2-x86_64-unknown-linux-centos65.tar.bz2
tar xf ghc-7.8.2-x86_64-unknown-linux-centos65.tar.bz2
cd ghc-7.8.2 && ./configure
cd ghc-7.8.2 && make install

wget http://www.haskell.org/cabal/release/cabal-install-1.20.0.3/cabal-install-1.20.0.3.tar.gz
tar xf cabal-install-1.20.0.3.tar.gz
cd cabal-install-1.20.0.3 && ./bootstrap.sh
```

# install pandoc in the software manager in debian
```
pip install pdfkit
sudo apt-get install wkhtmltopdf
```

```

sudo yum install texLive
sudo apt-get install texLive

sudo apt-get install apache2
ps -ef | grep apache # check to see if it is running

sudo apt-get install tmux
sudo apt-get install git
sudo apt-get install vim
sudo apt-get install tightvncserver
sudo apt-get install lynx # web browser in the console

sudo apt-get install htop

sudo apt-get install p7zip-full



### MyPASSWORDS
wget http://downloads.sourceforge.net/project/mypasswords7/binary/2.61/MyPasswords_2_61_Portable.zip
mkdir /opt/mypasswords
mv MyPasswords_2_61_Portable.zip /opt/mypasswords/
cd /opt/mypasswords/
unzip MyPasswords_2_61_Portable.zip
chown R user: /opt/mypasswords/
chmod 755 /opt/mypasswords/MyPasswords.sh
ln -s /opt/mypasswords/MyPasswords.sh /usr/bin/

### Simple Python install 
# command for installing
# sh pythoninstall.sh
#
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ipython
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
sudo apt-get ipython-notebook
sudo apt-get install python-numpy
sudo apt-get install python-scipy
sudo apt-get install python-matplotlib
sudo apt-get install python-dev
sudo apt-get install python-sympy # symbolic python
sudo apt-get install python-setuptools # so easy_install is available
sudo apt-get install python-requests
sudo apt-get install python-pandas
sudo apt-get install spyder

## Complex python install
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ipython
cd /home/Downloads
git clone https://github.com/ipython/ipython.git
cd ipython
sudo python setup.py install
# start the new version with ipython notebook --pylab inline
# see classnotes for ipython notebook
## GIT commands to setup
cd /home/Documents/SciComp
git config --global user.name "Neal Gordon"
git config --global user.email gordon.363@gmail.com
git clone https://nagordon@bitbucket.org/nagordon/repos.git
git clone https://rjleveque@bitbucket.org/rjleveque/uwhpsc.git
sudo apt-get install gdb # free fortran debugger
sudo apt-get install python-numpy
sudo apt-get install python-scipy
sudo apt-get install python-matplotlib
sudo apt-get install ipython-notebook
sudo apt-get install python-dev
sudo apt-get install git
sudo apt-get install python-sphinx
sudo apt-get install gfortran
sudo apt-get install git
sudo apt-get install xxdiff # to compare two files
sudo apt-get install python-sympy # symbolic python
sudo apt-get install gitk # to view git history
sudo apt-get install python-setuptools # so easy_install is available
sudo easy_install nose # helps testing new python software
sudo apt-get install imagemagick # so you can "display plot.png"
sudo easy_install nose # unit testing framework
sudo easy_install StarCluster # to help manage clusters on AWS
sudo apt-get install xfce4
sudo apt-get install jockey-gtk
sudo apt-get install xdm
sudo apt-get install openmpi-bin
sudo apt-get install liblapack-dev
sudo apt-get install thunar
sudo apt-get install xfce4-terminal


############################## Yoga 2 Pro  ##############################
# Lenovo Yoda 2 Pro laptop specific specific notes
#permentantly add the wireless to the blacklist, reboot
sudo nano /etc/modprobe.d/myownblacklist.conf
blacklist ideapad_laptop
sudo modprobe -r ideapad_laptop  # temporarly adds wireless to blacklist


# logitech gamepad driver
apt-get install joystick
jstest /dev/input/js0

# Simple-Samba-Fileshare-Setup

#file settings if not working
chmod -R 777 /mnt/nas
cron setup 
make shell script executable
chmod +x email_ip.sh

start cron service
sudo /etc/init.d/cron restart

sends email every hour
crontab -e
0 * * * * /home/pi/email_ip.sh


#samba settings in/etc/sa,ba/smb.conf
[pidrive]
comment=raspberrypi file share
path=/mnt/nas
browseable=yes
writeable=yes
guest ok=yes
public=yes
create mask=0777
directory mask=0777

# settings in /etc/fstab
/dev/sda1       /mnt/nas        ntfs-3g auto              0       0

# if linux automounts usb drive unmount it

sudo umount /media/maxtor
cat ~/.ssh/id_rsa.pub | ssh -p 54045 pi@raspberrypi 'cat >> .ssh/authorized_keys'

```
