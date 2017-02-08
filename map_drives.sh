#!/bin/sh
### based on https://wiki.ubuntu.com/MountWindowsSharesPermanently

#before running make sure you are root
# su root  # cinnamon
# su -r  # ubuntu  

# create mount point on local drive
mkdir /home/neal/networkdrive

# create credentials file
touch /root/passwordfile # or cat >> root/passwordfile
echo "username=neal" >> /root/passwordfile
echo "password=......"  >> /root/passwordfile

# Once the folder is create edit the fstab directory with the following line. uid can be the current user name or the group 100, which is all uid=1000 uid=neal

# add line to fstab file 
echo "//networkcomputer/home/neal /home/neal/networkdrive cifs uid=neal,credentials=/root/passwordfile" >> /etc/fstab

# mount all drives
mount -a 
