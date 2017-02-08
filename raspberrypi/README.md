# RaspberryPi
my scripts and projects for a raspberry pi

Notes and links to check out

http://www.toptechboy.com/raspberry-pi-with-linux-lessons/
http://makezine.com/2015/09/11/5-raspberry-pi-projects-to-build-this-weekend/?utm_source=MakeNewsletter+20150922&utm_medium=email&utm_term=&utm_content=headline&utm_campaign=newsletter
https://github.com/ankitaggarwal011/PiScope

arcade player
http://blog.petrockblock.com/retropie/retropie-downloads/retropie-project-sd-card-image-for-raspberry-pi-2-version-3-0-beta-2/
http://piplay.org/
http://sourceforge.net/projects/raspicade/?source=recommended
https://learn.adafruit.com/retro-gaming-with-raspberry-pi/emulators

https://learn.adafruit.com/onion-pi/overview

Home automation

https://home-assistant.io/

https://www.raspberrypi.org/blog/gpio-zero-a-friendly-python-api-for-physical-computing/

# The Raspberry pi is a small microcomputer with an arm processor

## IF you are using Raspian many of these tasks are unescessary. With Raspbian:
* SSH is ready to go out of the box
* default runlevel is 3 
* many items can be configured with raspi-config tool

## Pidora (fedora clone) Notes

## Raspbian (debian clone Notes

###Adding more swap for high memory use concerns
```bash
  sudo dd if=/dev/zero of=/swap bs=1M count=1024
  sudo mkswap /swap
  sudo swapon /swap
```

###Switch Runlevel to 3 so you can run headless without GUI loading
```bash
[root@raspi ~] ln -sf /usr/lib/systemd/system/multi-user.target /etc/systemd/system/default.target
[root@raspi ~] ll /etc/systemd/system/default.target
```
###Switch back to Runlevel 5 to boot to GUI
```bash
[root@raspi ~] ln -sf /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
[root@raspi ~] ll /etc/systemd/system/default.target
```

###Options for memory and processor overclocking management
```bash
#FILE: /boot/config.txt

#Processor Management
arm_freq=1000
arm_freq_min=700
force_turbo=0 #allows the OS to dynamically adjust processor frequency possible not on all OS
core_freq=500
sdram_freq=500
over_voltage=6
force_turbo=0

#Memory Management
gpu_mem=16 #set to the amount of memory  you would like the gpu to consume
```

### set threshold for dynamic overclocking (60% utilization in example)
```bash
60 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
```

###Make sure SSH is running (Pidora and others)
```bash
systemctl enable sshd.service
systemctl start sshd.service
systemctl status sshd.service
systemctl enable sshd.service #makes it run on bootup
```

##Headless Mode (Pidora)
In order to run in headless mode right out of the gate you need to create a file called 'headless' on the SD card before you insert into the Pi. If you want get an ip address from dchp use an empty file, otherwise use something like the options below
```bash
IPADDR=192.168.1.105
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
RESIZE
SWAP=512
```
##Write Image to SD Card
```bash
diskutil list #to find the volume of the card
diskutil unmountdisk /dev/diskN
sudo dd bs=4M if=/path/to/image of=/dev/diskN
```
####bs=4M needed to be changed to 4m on some cards , not sure why

##Backing up sd card once you get it setup
#### Find the disc you want to backup
```bash
diskutil list
```
#### Copy to an image on the desktop
```bash
sudo dd if=/dev/<disk choice> of=~/Desktop/backup.dmg
```

### Run command on raspian startup
```bash
 sudo nano /etc/rc.local 
```

### Setup Ethernet as DHCP to allow connection over ethernet cable
[details](http://forums.debian.net/viewtopic.php?f=5&t=1096250
```bash
  sudo apt-get install isc-dhcp-server
```

##Wireless Client [Debian Tutorial](https://wiki.debian.org/WiFi/HowToUse)
[Raspberry Pi Website] (http://www.raspberrypi.org/forums/viewtopic.php?f=27&t=7592)
### Check for Available Networks
```bash
iwlist scan
```
###Edit /etc/network/interfaces
```bash
# my wifi device
auto wlan0
iface wlan0 inet dhcp
        wireless-essid [ESSID]
        wireless-key   [KEY]
        wireless-mode [MODE] 
```
More details with  `man interfaces`, `man wireless` and `/usr/share/doc/wireless-tools/README.Debian`.

##Get Realtek Drivers working with HOSTAPD
[Drivers](http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=1&PNid=21&PFid=48&Level=5&Conn=4&DownTypeID=3&GetDown=false&Downloads=true)
```bash
sudo unzip RTL8188C_8192C_USB_linux_v4.0.2_9000.20130911.zip
cd RTL8188C_8192C_USB_linux_v4.0.2_9000.20130911
cd wpa_supplicant_hostapd
sudo tar -xvf wpa_supplicant_hostapd-0.8_rtw_r7475.20130812.tar.gz
cd wpa_supplicant_hostapd-0.8_rtw_r7475.20130812
cd hostapd
sudo make
sudo make install

sudo mv hostapd /usr/sbin/hostapd
sudo chown root.root /usr/sbin/hostapd
sudo chmod 755 /usr/sbin/hostapd
```

##Wireless
[WICD](http://www.bartbania.com/index.php/easy-wireless-configuration-for-raspberry-pi/)

###Useful Links
[Extend Partition to Fill SD Card](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=51&t=45265)

[Edimax Wireless access pint](http://www.daveconroy.com/turn-your-raspberry-pi-into-a-wifi-hotspot-with-edimax-nano-usb-ew-7811un-rtl8188cus-chipset/)

##NGINX, Passenger and Sinatra
[Helpful Blog Post](http://pi.gadgetoid.com/article/ruby-with-nginx-passenger)
[why is it installed in /opt and how to start it](https://github.com/phusion/passenger/wiki/Why-can't-Phusion-Passenger-extend-my-existing-Nginx%3F#starting_nginx)
```bash
sudo apt-get install rubygems libcurl4-openssl-dev libssl-dev libmysqlclient-dev libpq-dev libmagickcore-dev libmagickwand-dev libsqlite3-dev bundler
sudo gem install passenger
sudo passenger-install-nginx-module

```

###REmove Apache
```bash
sudo apt-get remove apache2.2-common
```

### lock pi account which is the root account by default on the Pi
```bash
sudo passwd -l pi
```

#calibre raspberry pi
```
sudo apt-get update && sudo apt-get install calibre
calibre-server --with-library=/home/pi/calibre
```

#create and edit files
nano test.txt # creates a text file
sudo raspi-config # opens pi configurations
#create and edit files
nano test.txt # creates a text file
sudo shutdown -h now
sudo shutdown -h 21:55 # shutdown at a specific time
sudo halt # shutdown
sudo restart

free  # shows the memory usage

# wiringPi software allows for easy interface to the GPIO


## Retro-Pie

```
# F4 from emulation station to console
raspi-config   # to setup raspbian
```

