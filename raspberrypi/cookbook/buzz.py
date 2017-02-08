from time import sleep
import RPi.GPIO as gpio


buzzer_pin = 18
gpio.setmode(gpio.BCM)
gpio.setup(buzzer_pin, gpio.OUT)

def buzz(pitch, duration):
    peroid = 1.0/pitch
    delay = peroid / 2.0
    cycles = int(duration*pitch)
    for i in range(cycles):
        gpio.output(buzzer_pin, True)
        sleep(delay)
        gpio.output(buzzer_pin, False)
        sleep(delay)


pitch = float(1000)
duration = float(2)
buzz(pitch, duration)
