
# coding: utf-8

import turtle
wn = turtle.Screen()
wn.bgcolor("lightgreen")        # set the window background color
neal = turtle.Turtle()

neal.shape('turtle')

neal.speed(1)

neal.forward(150)
neal.left(90)
neal.forward(75)

neal.color("blue")              # make tess blue
neal.pensize(3)                 # set the width of her pen

neal.right(30)
neal.forward(125)
neal.left(145)
neal.forward(50)

#import numpy as np
#x = np.arange(0,np.pi,40)
#np.sin(x)
#np.cos(x)

wn.exitonclick() 



#==============================================================================
# New turtle
#==============================================================================
import turtle
wn = turtle.Screen()
wn.bgcolor("lightgreen")
tess = turtle.Turtle()
tess.color("blue")
tess.shape("turtle")

print(range(5, 200, 2))
tess.up()                     # this is new
for size in range(5, 60, 2):    # start with size = 5 and grow by 2
    tess.stamp()                # leave an impression on the canvas
    tess.forward(size)          # move tess along
    tess.right(24)              # and turn her

wn.exitonclick()


#==============================================================================
# circle turtle
#==============================================================================
import turtle
wn = turtle.Screen()
tim = turtle.Turtle()
tim.shape('turtle')
tim.penup()

for s in range(10):
    tim.forward(50)
    tim.stamp()
    tim.forward(-50)
    tim.right(36)
wn.exitonclick()
