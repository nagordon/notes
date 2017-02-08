# -*- coding: utf-8 -*-
"""
Created on Fri Dec 26 15:11:36 2014
@author: ngordon
http://lgiordani.com/blog/2014/08/20/python-3-oop-part-1-objects-and-types/

also used python programming for absolute beginners-dawson

defintions
object - a way of organizing code such that it has attributes and actions that 
            can be performed on it so that it is made up of classes
class - set or subset of code that can contain all the following qualities
attribute - a quality of an object, similar to a variable, but specific to an object

attribute accessible from an object
self.mycolor = 'green'

class attribute is not accesbile external, but used within the class
mycolor = 'green'

private attributes are not accessible outside of the object, but are used internally

method - an action that an object can perform, similar to a function
constructor - a special method that is executed when the object is instantiated
instatiation - when a new object is spawned




"""

class Door:
    colour = 'brown'

    def __init__(self, number, status):
        self.number = number
        self.status = status

    # class wide method
    @classmethod
    def knock(cls):
        print("Knock!")
    
    # class wide method
    @classmethod
    def paint(cls, colour):
        cls.colour = colour

    def open(self):
        self.status = 'open'

    def close(self):
        self.status = 'closed'
## 

d = Door(1,'closed')

d.open()
d.status()


#%% inheritance

class SecurityDoor(Door):
    colour = 'gray'
    locked = True

    def open(self):
        if self.locked:
            return
        #Door.open(self)   # discouraged way to call a parent class
        super().open(self)

## 
SecurityDoor.__bases__

sd = SecurityDoor(3,'closed')

sd.locked
sd.open()



#%%

class Car(object):
    """A car for sale by Jeffco Car Dealership.

    Attributes:
        wheels: An integer representing the number of wheels the car has.
        miles: The integral number of miles driven on the car.
        make: The make of the car as a string.
        model: The model of the car as a string.
        year: The integral year the car was built.
        sold_on: The date the vehicle was sold.
    """

    def __init__(self, wheels, miles, make, model, year, sold_on):
        """Return a new Car object."""
        self.wheels = wheels
        self.miles = miles
        self.make = make
        self.model = model
        self.year = year
        self.sold_on = sold_on

    def sale_price(self):
        """Return the sale price for this car as a float amount."""
        if self.sold_on is not None:
            return 0.0  # Already sold
        return 5000.0 * self.wheels

    def purchase_price(self):
        """Return the price for which we would pay to purchase the car."""
        if self.sold_on is None:
            return 0.0  # Not yet sold
        return 8000 - (.10 * self.miles)

