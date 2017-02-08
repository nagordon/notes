# -*- coding: utf-8 -*-
#pg 127 Schmidt

import RPi.GPIO as GPIO
from subprocess import call

CameraLedPin = 5

class Camera:
    def __init__(self):
        GPIO.setmode(GPIO.BCM)
        GPIO.setwarnings(False)
        GPIO.setup(CameraLedPin, GPIO.OUT, initial = False)
        
    def led_on(self):
        GPIO.output(CameraLedPin, True)
    
    def led_off(self):
        GPIO.output(CameraLedPin, False)
    
    def take_photo(self, filename):
        call([ 'raspistill -n -t 0 -hf -o {0}' .format(filename)], shell = True)
        
if __name__ == '__main__':
    #from camera import *
    camera = Camera()
    camera.led_off()
    camera.take_photo('photo.jpg')