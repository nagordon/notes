# Notes about bash syntax

Nifty program to go along with man, but gives good examples
https://github.com/srsudar/eg
https://github.com/jlevy/the-art-of-command-line?utm_campaign=explore-email&utm_medium=email&utm_source=newsletter&utm_term=weekly

```
#!/bin/sh
# a list of commands in bash

###########################################################################
# http://fosswire.com/post/2007/08/unixlinux-command-cheat-sheet/
# and my own notes
# https://github.com/swcarpentry/boot-camps/tree/2013-07-bath/shell
###########################################################################

############################## Navigating and basic commands ##############################
ps --help # get info on ps command
man ps #  looks up info about a command , short for manual, example: man passwd
man -k  #   shows a list of possible manual pages, example: man -k passwd
clear # clears terminalc
exit  # closes terminal
export PS1='$ '   # changes prompt to '$'
cd #  takes you to the root directory
cd .. # go up one directory (parent)
cd .  # current directory
cd /etc   #  looks for etc directory located at system root
export dir1 = $PWD  # creates variable dir1 of the current directory
pwd # print working directory
echo $PWD  # prints environmental variable PWD
!$ # recalls the last command string after the first space
export HOME = ~/Dropbox/Git  # changes the home directory
|   # a pipe, info on the left as input on the right
alias djadmin = "cd /c/bin/django_install/django/contrib/admin/templates/admin"
ln -s dir1 dir1_link # creates a link dir1_link to dir1
; # multiple commands on a line
cd ~ # change directory to home
sudo reboot # restarts computer
sudo bash   # logs into bash as sudo
#!/bin/sh       # shebang line defining the filetype
sh script.sh  # runs scripts with the shebang defining sh file
./script   # runs the script in the current directory indicated by ./
############################## Files and directories ##############################

### location
/  # root directory
/root # home directory for the root user
/etc  # contains config files for the system
/proc # virtual filesystem that the kernal uses
/var # files created by applications
/boot # contains bootloader and linux kernal
/bin # default place command line program calls looks, contains all user programs
/sbin # contains administrator programs
/dev  # contains a file for all devices
    /dev/sda # 1st sata/scsi disk
    /dev/sda1 # 1st partition of the 1st disk
    /dev/sdb # 2nd scsi disk
    /dev/hd # IDE disk system
/home # user directories
/lib # library files, drivers
/mnt # antiquated directory used to mount cdroms and floppys
/media # used to mount removeable media, usb, flash memory
/usr # work and software used by the system
/opt # various file storage
/srv # server files
/sys # contains system information
/tmp # temporary file sotrage

nemo  # launches folder browser in linux mint
sudo nemo # launches a root folder browser in mint

### Commands
/dev/sda # fully qualified path because it starts with /
./ # refers to current directory
../ # parent directory
ls -lh # lists file information, permissions
ls -h
pwd # print working directory
ls # lists all files and directories
ls -a # list all files
touch fil1 # creates new file fil1
mkdir dir1 # creates directory dir1
cp # copies
rm -r # recursivley removes all
cp -r dir1 # recursivvley copies all files and directories within dir1
rm --help # gives help on the command
ls # directory listing
ls -al # formatted listing with hidden files
ls ; pwd  #   directory's contents and name
ls  # list files in directory
ls -F # creates a list of the current directory with details
la -F data
ls -F /data # will find the data directory
la -F -a  # show all    
ls -s -h  # shows size
ls /bin   #  lists files and directories within bin
ls /      # root directory
ls | more #    list of files in the current directory and pipes the results which shows one screen at a time
ls -a  # view hidden files
ls -la  #  lists all files in the directory including hidden
ls .* # shows all files that start with .
echo */ # gives all directories in the current directory
echo */*/ # gives all directories in the current directory and one below
ls -d */ # gives all directories in current directory
ls -a */ # shows all files and directories
ls -l */ # shows all directories and files in a nice informative view
ls -l | grep "^d"  # shows all directories using grep
ls -lh # see the file size
for i in $(ls -d */); do echo ${i%%/}; done  # or with a for loop
find # command that finds files
file /bin/bash # command that gives information about the file
less file1 # shows the contents of file1
head grepdat # views top of the file
echo $PATH # display contents of the variable PATH
env # prints information about the system, user etc
cd dir # change directory to dir
cd # change to home
pwd # show current directory
mkdir dir # create a directory dir
rm file # delete file
rm -r dir # delete directory dir
rm -f file # force remove file
rm -rf dir # force remove directory dir *
cp file1 file2 # copy file1 to file2
cp -r dir1 dir2 # copy dir1 to dir2; create dir2 if it doesn't exist
mv file1 file2 # rename or move file1 to file2 if file2 is an existing directory, moves file1 into directory file2
ln -s file link # create symbolic link link to file
touch file # create or update file
cat > file # places standard input into file
cat >> file2.txt  # creates file2.txt with the current user as owner
sudo cat >> file2.txt  # creates file2.txt with root as the owner
more file # output the contents of file
head file # output the first 10 lines of file
tail file # output the last 10 lines of file
tail -f file # output the contents of file as it grows, starting with the last 10 lines Process Management
wc *.pdb  # wordcount wildcard
*         #   wildcard - for example ls kid* would list all the files starting with "kid" add this line to .bash_profile to create a shortcut
cmp  #  compares the contents of 2 files or directories, example: cmp filename1 filename2
rm -i soon.to.be.gone.file # gives you a prompt to remove this file
rmdir  # removes directory if it is empty
rm -i *.html   #  use the asterisk wildcard to remove multiple files, example shows all the files in current directory that end in .html
cp -r . Backup_files  # backs up everything in current directory to a backup_files directory
find . -name lostfile - print  # this example finds and prints the filename lostfile
locate  #  finds system files
mkdir tmp  # makes directory called "tmp"
mkdir -p  #  creates directories and subdirectories at once, example: mkdir -p Projects/Cooking/Desserts
echo "line 1" >> greetings.txt # add some text to a text file
echo "line 2" >> greetings.txt
head temp_processes.txt # displays first few lines of text
tail temp_process.txt # displays last few lines of text
more temp_process.txt  # displays file page by page
less temp_process.txt # moves bachward in a document
sort temp_process.txt # sorts
grep Linux operatingsystems.txt  # searches for the word Linux in the file operatingsystems.txt in the current directory and prints the lines
more      # viewing contents one screen at a time, for example more fortunes would show the contents one screen at a time.  Use spacebar for next scren, B for back, and Q for quit
cat > file2  # create file2
cat >> file2   # dynamically add file content, exit with ctrl+c
cat oldfile.txt > newfile.txt  copy a file
cat file2       # displays file info of file2
touch # creates a file, example touch file.to.create

### Compression
tar cf file.tar files # create a tar named file.tar containing files
tar xf file.tar # extract the files from file.tar
tar czf file.tar.gz files # create a tar with Gzip compression
tar xzf file.tar.gz # extract a tar using Gzip
tar cjf file.tar.bz2 # create a tar with Bzip2  compression
tar xjf file.tar.bz2 # extract a tar using Bzip2
gzip file # compresses file and renames it to file.gz
gzip -d file.gz # decompresses file.gz back to file
unzip zipfile.zip

############################## Process Management ##############################
ps # display your currently active processes
top # display all running processes, type 'h' for info, 'q' to quit
# ctrl+c # kills current process
# ctrl+z # stops current process and puts it in the background
bg 1 # starts up the process you just put in the background
kill pid # kill process id pid
killall proc # kill all processes named proc *
$1 bg
$1 fg
bg # lists stopped or background jobs; resume a stopped job in the background
fg # brings the most recent job to foreground
fg n # brings job n to the foreground
jobs # lists the jobs running in the terminal
kill %2  # kills job number 2
fg # moves job into the foreground
bg # moves job into the background
ipython & # runs ipython and keeps shell available
pstree | less  # processes piped into less to enable scrolling
pstree -p  # gives PID with processes
ps -d  # lists all processes
ps -d | grep gedit  # lists process information about gedit
ps -d > processes.txt  # sends process data to a text file
kill 5123432  # kills the specified PID
cat /proc/version # OS info
cat /proc/cpuinfo
cat /proc/meminfo
cat /proc/partitions
free -o -h # how much memory is free
kill 1 # kills job 1
leafpad file.txt & # launches file.txt in the background

############################## System Info ##############################
uname -a # gives os name and info
date # show the current date and time
cal # show this month's calendar
uptime # show current uptime
w # display who is online
whoami # who you are logged in as
finger user # display information about user
uname -a # show kernel information
cat /proc/cpuinfo # cpu information
cat /proc/meminfo # memory information
man command # show the manual for command
df # show disk usage
du # show directory space usage
free # show memory and swap usage
whereis app # show possible locations of app
which app # show which app will be run by default

############################## Network  ##############################
ping host # ping host and output results
ping 192.168.1.200 -c 4 # sends 4 messages to the ip givend
ping www.google.com -c 4 # sends a message to google.com
# ping forever with a timestamp
ping www.google.com | while read pong; do echo "$(date): $pong"; done > pingdat.txt
sudo dhclient # refresh ip
whois domain # get whois information for domain
dig domain # get DNS information for domain
dig -x host # reverse lookup host
wget file # download file
wget http://guidata.googlecode.com/files/guidata-1.6.1.zip  # download url
wget -c file # continue a stopped download
ip addr show # shows ip address
hostname -I
# in ubuntu , ctrl+L to show address bar
smb://192.168.1.100/Media
/sbin/ifconfig # get ip address
nslookup www.google.com  # find the ip address of the server
# release and renew ip address
sudo dhclient -r wlan0 # or eth0
sudo dhclient wlan0

#iptables
chkconfig iptables on # turn on iptables at boot
chkconfig iptables off # turn off iptables at boot
# /etc/init.d/iptables save
# /etc/init.d/iptables stop

# cron centos
/sbin/service crond status # check to see if the service is running
vim /etc/crontab # edit crontab file 

# 01 * * * * root run-parts /etc/cron.hourly 
# 02 4 * * * root run-parts /etc/cron.daily 
# 22 4 * * 0 root run-parts /etc/cron.weekly 
# 42 4 1 * * root run-parts /etc/cron.monthly

# * implies to run every value of the field
# 1-4 implies to run 1,2,3,4 only
# 1,5,9 implies only those values
# */3 runs every third 

# minute — any integer from 0 to 59
# hour — any integer from 0 to 23
# day — any integer from 1 to 31 (must be a valid day if a month is specified)
# month — any integer from 1 to 12 (or the short name of the month such as jan or feb)
# dayofweek — any integer from 0 to 7, where 0 or 7 represents Sunday (or the short name of the week such as sun or mon)
# command — the command to execute (the command can either be a command such as ls /proc >> /tmp/proc or the command to execute a custom script)

/sbin/service crond start # start cron service
/sbin/service crond stop # stop cron service

# noip setup
yum install noip # fedora setup
sudo /usr/local/bin/noip2 # start application 
sudo /usr/local/bin/noip2 -C # status of noip application
sudo /usr/local/bin/noip2 -S # setup of noip program
sudo service noip start
sudo chkconfig noip on # congifure to run automatically
sudo service noip status # checks status of the noip applcation

### SSH
# search repo for ssh packages
apt-cache search openssh
sudo apt-get install openssh-server
man sshd_config
# default setting on isntall should be to start on startup
sshd -t # gives info about ssh
sudo apt-get install ssh # used to set up a secure shell connection
/sbin/service sshd start # starts ssh server
logout # exits ssh
exit   # exits ssh
which ssh # displays where the ssh program is located
ssh user@host # connect to host as user
ssh -p port user@host # connect to host on port port as user
ssh-copy-id user@host # add your key to host for user to enable a keyed or passwordless login
# ssh configuration , Settings for safe setup
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig  # make a copy before you screw it up
sudo nano /etc/ssh/sshd_config
# PermitRootLogin no
# PermitEmptyPasswords no
# X11Forwarding yes
# X11DisplayOffset 10
# TCPKeepAlive yes
# UsePrivilegeSeparation yes
# PasswordAuthentication no  # for keys
###
# choosing ports
# well used = 0-1023
# registered ports = 1024-49151
# dynamic ports = 49152-65535 USE THESE
###
ssh -p 20 pi@192.168.1.200 # connect to port -p 20 and login as pi at that ip
ps aux ¦ grep over ssh # gives info of ssh
# secure ssh

ssh -X neal@192.168.1.199 # connect to ssh from linux
# if haveing issues with ssh, reset keys
sudo rm /etc/ssh/ssh_host_*
sudo dpkg-reconfigure openssh-server
# restart ssh
/etc/init.d/sshd restart
#change the port number
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup
sudo nano /etc/ssh/sshd_config #change port 22 to 77 ,
# check to see if ssh keys exist
ls ~./ssh
ssh-keygen -t rsa -C neal@raspberry
/home/neal/.ssh/id_rsa # location of key on linux

sudo apt-get install tightvncserver # tightvnc for a Virtual Network Computing
service ssh restart

ls -al ~/.ssh
/c/Users/username/.ssh/id_rsa # location of key on windows using gitbash
ssh-keygen -t rsa -C "your_email@example.com"
# enter passphrase if you want one
ssh-agent -s # start the ssh-agent in the background
ssh-add ~/.ssh/id_rsa
clip < ~/.ssh/id_rsa.pub # add public key to Github
# paste into website GUI
ssh -T git@github.com # Attempts to ssh to GitHub

ssh-add -l

############### change the file ~/.vnc/xstartup to get tightvnc to work
#!/bin/sh
def
export XKL_XMODMAP_DISABLE=1
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &
gnome-terminal &
########################

## Virtual Box, host on windows 7, box on debian
# 1) Install Guest Additions on box
# 2) created folder on host named 'share'
# 3) create a folder named 'host' in home directory
# 4) Shared Folder Settings -> add share
sudo mount -t vboxsf share /home/user1/host
# put the mount command in /etc/rc.local to run on boot

# gives the machine its own ip address and can use ssh and log into it
Settings -> Network -> Bridged Adapter

Devices -> Shared Clipboard -> Bidirectional
Devices -> Drag n Drop -> Bidirectional


### Samba
sudo leafpad /etc/samba.smb.conf
sudo service samba restart
smbclient //192.168.1.200/NetDrive -U neal
smb://192.168.1.200/NetDrive1 # navigate to samba server
#ctrl+L opens address bar
network:///192.168.1.200 # also should navigate to network address
mount.cifs # program to mount a cifs drive
/usr/bin/smbclient -L 192.168.1.200 # shows status of smb server
# add this line to /etc/fstab to access nas drive from linux and have it automount
//mynetworknas /mnt/nas cifs defaults 0 0
# or for adding login credentials
//server/share /mnt/nas cifs defaults,rw,username=username1,password=password1,domain=domain1 0 0 

#permanant mount drive
# create mount point
mkdir /home/neal/nas
# create credentials file 
touch root/passwordfile # or cat >> root/passwordfile
echo "username=neal" >> root/passwordfile
echo "password=......"  >> root/passwordfile

# edit /etc/fstab to add drive settings
#    computer name or IP             mount point   drivce   uid=1000 users, uid=100 groups
//nascomputer/drive1/directory1   /home/neal/nas   cifs   uid=neal,credentials=/root/passwordfile

# this will mount the drive once
sudo mount -t cifs //192.168.1.5/media /mnt

############################## Searching ##############################
grep pattern files # search for pattern in files
grep -r pattern dir # search recursively for pattern in dir
command | grep pattern # search for pattern in the output of command
locate file # find all instances of file
#  ./ is current directory
ps -ef | grep sshd > grepdat # searches for application sshd and returns results to file grepdat
grep -w "boo" file # search for the word boo only

############################## Shorcuts ##############################
# Ctrl + a – go to the start of the command line
# Ctrl + e – go to the end of the command line
# Ctrl + k – delete from cursor to the end of the command line
# Ctrl + u – delete from cursor to the start of the command line
# Ctrl + w – delete from cursor to start of word (i.e. delete backwards one word)
# Ctrl + y – paste word or text that was cut using one of the deletion shortcuts (such as the one above) after the cursor
# Ctrl + xx – move between start of command line and current cursor position (and back again)
# Alt + b – move backward one word (or go to start of word the cursor is currently on)
# Alt + f – move forward one word (or go to end of word the cursor is currently on)
# Alt + d – delete to end of word starting at cursor (whole word if cursor is at the beginning of word)
# Alt + c – capitalize to end of word starting at cursor (whole word if cursor is at the beginning of word)
# Alt + u – make uppercase from cursor to end of word
# Alt + l – make lowercase from cursor to end of word
# Alt + t – swap current word with previous
# Ctrl + f – move forward one character
# Ctrl + b – move backward one character
# Ctrl + d – delete character under the cursor
# Ctrl + h – delete character before the cursor
# Ctrl + t – swap character under cursor with the previous one
# Ctrl+C # halts the current command
# Ctrl+Z # stops the current command, resume with  fg in the foreground or bg in the background
# Ctrl+D # log out of current session, similar to exit
# Ctrl+W # erases one word in the current line
# Ctrl+U # erases the whole line
# Ctrl+R # type to bring up a recent command !! - repeats the last command

############################## File Permissions ##############################

chmod octal file # change the permissions of file to octal, which can be found separately for user, group, and world by adding:
# 4 – read (r)
# 2 – write (w)
# 1 – execute (x)
chmod 777 # read, write, execute for all
chmod 755 # rwx for owner, rx for group
man chmod # manual
# Read is 4 , Write is 2 , Execute is 1 , 7 = read+write+execute
chmod a= file1 # removes all permissions from file1
chmod u+rwx file1 # gave 'u' user read write and execture privelages to file1
chmod 777 file1 # same operation different syntax
sudo chmod 777 /media/Media # changes file permissions
chown neal:neal /mnt/mynas
chown -R neal:neal /mnt/mynas  # recursivley



############################## Software ##############################
sudo apt-get install xyz # installs xyz software
sudo ./file.bin # run a bin file, but make sure it has execute permissions

yum install ntpdate # install to set date and time
ntpdate 0.us.pool.ntp.org  # sync to EST 
hwclock --systohc  # change hardware clock


############################## Users ##############################
su # substitues user, example: su ppastern
# repair corrupted /etc/sudoers
pkexec visudo
man sudoers # manual for command sudoers
sudo visudo # to edit users
# access root terminal results in a # prompt
sudo addsuer bob# adds user bob
sudo userrdel -r bob # deletes user bob
groupadd gordon # adds group gordon
sudo useradd -d /home/neal -m neal # add user neal and a home directory
sudo su
sudo -s # login as root in ubuntu
sudo adduser neal sudo # adds user neal to the superuser group
su neal # switch user to neal
passwd # change password
who # shows who has logged into the pi
sudo useradd -d /home/chelsea -m chelsea
sudo passwd chelsea # change password

############################## Hardware ##############################
sudo fdisk -l # lists all mounted and unmounted disk partitions
lsusb # list usb devices
dd if=/dev/cdrom of=~/cdrom_image.iso # creates an iso disk rip file
# clone a harddrive to a file
dd if=/dev/hdb of=/image.img
# clone a disk image to a disk
dd if=/image.img of=/dev/sda
# direct disk-to-disk clone
dd if=/dev/hdb of=/dev/hdc
# alternative create disk image
sudo cat /dev/srx > /home/<user_name>/<file_name.iso>
fdisk /dev/sda # disk tool
mkfs.ext4 /dev/sda1 # formats disk
# use an ext format native to linux, rather than ntfs, which cannot get linux file permissions
sudo blkid # shows all drives connect to computer
lsblk  # shows drives
sudo fdisk -l # lists all disk info
sudo umount /dev/sda1 # unmounts drive
# FSTAB Options
# Device name | Mount point | File system | Options | Dump options | File system check options
sudo leafpad /etc/fstab  # edits the mounted drives on startup
sudo mount -a  # mounts all drives, enter password to root of NAS server
df -h # lists all currently mounted drives
sudo dd if=/dev/sda of=/dev/sdc    # clones input file sda to output file sdc
