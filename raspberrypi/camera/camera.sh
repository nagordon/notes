#!/bin/sh
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git-core -y
sudo wget http://goo.gl/1BOfJ -O /usr/bin/rpi-update
sudo chmod +x /usr/bin/rpi-update
sudo rpi-update

# the commands to access the camera can be found in 
raspistill

# take a photo with a 5 sec delay 
raspistill -o first.jpg

# take photo without delay
raspistill -t 0 -o first.jpg

# take photo that is horizontally flipped
raspistill -hf -o first.jpg

# take a png photo
raspistill -e PNG -o first.jpg

# take a photo every 3000 milliseconds for 10 minutes (600000 milliseconds)
mkdir photos
raspistill -n -tl 3000 -t 600000 -o photos/phtot%04d.jpg

# create a video using ffmpeg. isntall first
sudo apt-get install libav-tools
cd photos
avconv -r 4 -i photo%04d.jpg -r 4 -vcodec libx264 -crf 20 -g 15 video.mp4

# record video
raspivid -t 60000 -fps 25 -o video.h264
# convert to mp4
avconv -r 25 -i video.h264 -vcodec copy video.mp4



