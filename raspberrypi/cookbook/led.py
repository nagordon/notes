from time import sleep
import RPi.GPIO as gpio
gpio.setmode(gpio.BCM)

def on_off():
    gpio.setup(18, gpio.OUT)
    gpio.output(18, True)
    sleep(5)
    gpio.output(18, False)

def change_bright():
    led_pin = 18
    gpio.setup(led_pin, gpio.OUT)
    
    # set pulse width management to 500 Hz
    pulse_width = 500 #Hz
    pwm_led = gpio.PWM(led_pin, pulse_width)
    pwm_led.start(100)

    #while True:
    #    duty_s = raw_input("Enter Brightness 0-100 : ")
    #    duty = int(duty_s)
    #    pwm_led.ChangeDutyCycle(duty)

    while True:
        for duty in xrange(0,100,1):
            pwm_led.ChangeDutyCycle(duty)
            sleep(0.01)
            
        for duty in xrange(100,0,-1):
            pwm_led.ChangeDutyCycle(duty)
            sleep(0.01)

change_bright()
