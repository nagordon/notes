# -*- coding: utf-8 -*-
"""
Created on Thu Mar 16 08:50:46 2017

@author: ngordon


http://www.tkdocs.com/tutorial/concepts.html
https://docs.python.org/3.5/library/tkinter.html
http://effbot.org/tkinterbook/tkinter-index.htm
http://www.java2s.com/Code/Python/GUI-Tk/
https://github.com/dmnfarrell/pandastable
https://github.com/dmnfarrell/tkintertable

python 3.5
"""


#==============================================================================
# example 1
#==============================================================================
from tkinter import *

master = Tk()

# single selection = "browse"
listbox = Listbox(master, selectmode=EXTENDED)
listbox.pack()




listbox.insert(END, "a list entry")


for item in ["one", "two", "three", "four"]:
    listbox.insert(END, item)

mainloop()





#==============================================================================
# example 2
#==============================================================================

import tkinter # note that module name has changed from Tkinter in Python 2 to tkinter in Python 3
window = tkinter.Tk()
# Code to add widgets will go here...
window.title("My Window")
window.geometry("300x300")

# END
window.mainloop()


#==============================================================================
# example 3
#==============================================================================
#!/usr/bin/env python
import tkinter as tk

class Application(tk.Frame):
    def __init__(self, master=None):
        tk.Frame.__init__(self, master)
        self.grid()
        self.createWidgets()

    def createWidgets(self):
        self.quitButton = tk.Button(self, text='Quit',
            command=self.quit)
        self.quitButton.grid()

app = Application()
app.master.title('Sample application')
app.mainloop()


#==============================================================================
# example 4
#==============================================================================


from tkinter import *
from tkinter import ttk
root = Tk()
ttk.Button(root, text="Hello World").grid()
root.mainloop()


#==============================================================================
# example 5 - calculator
#==============================================================================
from tkinter import *
from tkinter import ttk

def calculate(*args):
    try:
        value = float(feet.get())
        meters.set((0.3048 * value * 10000.0 + 0.5)/10000.0)
    except ValueError:
        pass
    
root = Tk()
root.title("Feet to Meters")

mainframe = ttk.Frame(root, padding="3 3 12 12")
mainframe.grid(column=0, row=0, sticky=(N, W, E, S))
mainframe.columnconfigure(0, weight=1)
mainframe.rowconfigure(0, weight=1)

feet = StringVar()
meters = StringVar()

feet_entry = ttk.Entry(mainframe, width=7, textvariable=feet)
feet_entry.grid(column=2, row=1, sticky=(W, E))

ttk.Label(mainframe, textvariable=meters).grid(column=2, row=2, sticky=(W, E))
ttk.Button(mainframe, text="Calculate", command=calculate).grid(column=3, row=3, sticky=W)

ttk.Label(mainframe, text="feet").grid(column=3, row=1, sticky=W)
ttk.Label(mainframe, text="is equivalent to").grid(column=1, row=2, sticky=E)
ttk.Label(mainframe, text="meters").grid(column=3, row=2, sticky=W)

for child in mainframe.winfo_children(): child.grid_configure(padx=5, pady=5)

feet_entry.focus()
root.bind('<Return>', calculate)

root.mainloop()

#==============================================================================
#  example 6 - 
#==============================================================================

from tkinter import *
from tkinter import ttk
root = Tk()
# create a button, passing two options:
button = ttk.Button(root, text="Hello", command="buttonpressed")
button.grid()
#check the current value of the text option:
button['text']
#'Hello'
#change the value of the text option:
button['text'] = 'goodbye'
#another way to do the same thing:
button.configure(text='goodbye')
#check the current value of the text option:
#button['text']
#'goodbye'
#get all information about the text option:
button.configure('text')
#('text', 'text', 'Text', '', 'goodbye')
#get information on all options for this widget:
button.configure()

#==============================================================================
# event bindings
#==============================================================================
from tkinter import *
from tkinter import ttk
root = Tk()
l =ttk.Label(root, text="Starting...")
l.grid()
l.bind('<Enter>', lambda e: l.configure(text='Moved mouse inside'))
l.bind('<Leave>', lambda e: l.configure(text='Moved mouse outside'))
l.bind('<1>', lambda e: l.configure(text='Clicked left mouse button'))
l.bind('<Double-1>', lambda e: l.configure(text='Double clicked'))
l.bind('<B3-Motion>', lambda e: l.configure(text='right button drag to %d,%d' % (e.x, e.y)))
root.mainloop()


#==============================================================================
# grid test
#==============================================================================
from tkinter import *
from tkinter import ttk

root = Tk()

content = ttk.Frame(root, padding=(3,3,12,12))
frame = ttk.Frame(content, borderwidth=5, relief="sunken", width=200, height=100)
namelbl = ttk.Label(content, text="Name")
name = ttk.Entry(content)

onevar = BooleanVar()
twovar = BooleanVar()
threevar = BooleanVar()

onevar.set(True)
twovar.set(False)
threevar.set(True)

one = ttk.Checkbutton(content, text="One", variable=onevar, onvalue=True)
two = ttk.Checkbutton(content, text="Two", variable=twovar, onvalue=True)
three = ttk.Checkbutton(content, text="Three", variable=threevar, onvalue=True)
ok = ttk.Button(content, text="Okay")
cancel = ttk.Button(content, text="Cancel")

content.grid(column=0, row=0, sticky=(N, S, E, W))
frame.grid(column=0, row=0, columnspan=3, rowspan=2, sticky=(N, S, E, W))
namelbl.grid(column=3, row=0, columnspan=2, sticky=(N, W), padx=5)
name.grid(column=3, row=1, columnspan=2, sticky=(N, E, W), pady=5, padx=5)
one.grid(column=0, row=3)
two.grid(column=1, row=3)
three.grid(column=2, row=3)
ok.grid(column=3, row=3)
cancel.grid(column=4, row=3)

root.columnconfigure(0, weight=1)
root.rowconfigure(0, weight=1)
content.columnconfigure(0, weight=3)
content.columnconfigure(1, weight=3)
content.columnconfigure(2, weight=3)
content.columnconfigure(3, weight=1)
content.columnconfigure(4, weight=1)
content.rowconfigure(1, weight=1)

root.mainloop()


#==============================================================================
# listbox example 
#==============================================================================
from tkinter import *
from tkinter import ttk
root = Tk()

# Initialize our country "databases":
#  - the list of country codes (a subset anyway)
#  - a parallel list of country names, in the same order as the country codes
#  - a hash table mapping country code to population<
countrycodes = ('ar', 'au', 'be', 'br', 'ca', 'cn', 'dk', 'fi', 'fr', 'gr', 'in', 'it', 'jp', 'mx', 'nl', 'no', 'es', 'se', 'ch')
countrynames = ('Argentina', 'Australia', 'Belgium', 'Brazil', 'Canada', 'China', 'Denmark', \
        'Finland', 'France', 'Greece', 'India', 'Italy', 'Japan', 'Mexico', 'Netherlands', 'Norway', 'Spain', \
        'Sweden', 'Switzerland')
cnames = StringVar(value=countrynames)
populations = {'ar':41000000, 'au':21179211, 'be':10584534, 'br':185971537, \
        'ca':33148682, 'cn':1323128240, 'dk':5457415, 'fi':5302000, 'fr':64102140, 'gr':11147000, \
        'in':1131043000, 'it':59206382, 'jp':127718000, 'mx':106535000, 'nl':16402414, \
        'no':4738085, 'es':45116894, 'se':9174082, 'ch':7508700}

# Names of the gifts we can send
gifts = { 'card':'Greeting card', 'flowers':'Flowers', 'nastygram':'Nastygram'}

# State variables
gift = StringVar()
sentmsg = StringVar()
statusmsg = StringVar()

# Called when the selection in the listbox changes; figure out
# which country is currently selected, and then lookup its country
# code, and from that, its population.  Update the status message
# with the new population.  As well, clear the message about the
# gift being sent, so it doesn't stick around after we start doing
# other things.
def showPopulation(*args):
    idxs = lbox.curselection()
    if len(idxs)==1:
        idx = int(idxs[0])
        code = countrycodes[idx]
        name = countrynames[idx]
        popn = populations[code]
        statusmsg.set("The population of %s (%s) is %d" % (name, code, popn))
    sentmsg.set('')

# Called when the user double clicks an item in the listbox, presses
# the "Send Gift" button, or presses the Return key.  In case the selected
# item is scrolled out of view, make sure it is visible.
#
# Figure out which country is selected, which gift is selected with the 
# radiobuttons, "send the gift", and provide feedback that it was sent.
def sendGift(*args):
    idxs = lbox.curselection()
    if len(idxs)==1:
        idx = int(idxs[0])
        lbox.see(idx)
        name = countrynames[idx]
        # Gift sending left as an exercise to the reader
        sentmsg.set("Sent %s to leader of %s" % (gifts[gift.get()], name))

# Create and grid the outer content frame
c = ttk.Frame(root, padding=(5, 5, 12, 0))
c.grid(column=0, row=0, sticky=(N,W,E,S))
root.grid_columnconfigure(0, weight=1)
root.grid_rowconfigure(0,weight=1)

# Create the different widgets; note the variables that many
# of them are bound to, as well as the button callback.
# Note we're using the StringVar() 'cnames', constructed from 'countrynames'
lbox = Listbox(c, listvariable=cnames, height=5)
lbl = ttk.Label(c, text="Send to country's leader:")
g1 = ttk.Radiobutton(c, text=gifts['card'], variable=gift, value='card')
g2 = ttk.Radiobutton(c, text=gifts['flowers'], variable=gift, value='flowers')
g3 = ttk.Radiobutton(c, text=gifts['nastygram'], variable=gift, value='nastygram')
send = ttk.Button(c, text='Send Gift', command=sendGift, default='active')
sentlbl = ttk.Label(c, textvariable=sentmsg, anchor='center')
status = ttk.Label(c, textvariable=statusmsg, anchor=W)

# Grid all the widgets
lbox.grid(column=0, row=0, rowspan=6, sticky=(N,S,E,W))
lbl.grid(column=1, row=0, padx=10, pady=5)
g1.grid(column=1, row=1, sticky=W, padx=20)
g2.grid(column=1, row=2, sticky=W, padx=20)
g3.grid(column=1, row=3, sticky=W, padx=20)
send.grid(column=2, row=4, sticky=E)
sentlbl.grid(column=1, row=5, columnspan=2, sticky=N, pady=5, padx=5)
status.grid(column=0, row=6, columnspan=2, sticky=(W,E))
c.grid_columnconfigure(0, weight=1)
c.grid_rowconfigure(5, weight=1)

# Set event bindings for when the selection in the listbox changes,
# when the user double clicks the list, and when they hit the Return key
lbox.bind('<<ListboxSelect>>', showPopulation)
lbox.bind('<Double-1>', sendGift)
root.bind('<Return>', sendGift)

# Colorize alternating lines of the listbox
for i in range(0,len(countrynames),2):
    lbox.itemconfigure(i, background='#f0f0ff')

# Set the starting state of the interface, including selecting the
# default gift to send, and clearing the messages.  Select the first
# country in the list; because the <<ListboxSelect>> event is only
# generated when the user makes a change, we explicitly call showPopulation.
gift.set('card')
sentmsg.set('')
statusmsg.set('')
lbox.selection_set(0)
showPopulation()

root.mainloop()


#==============================================================================
# scroll bar
#==============================================================================
from tkinter import *
from tkinter import ttk

root = Tk()
l = Listbox(root, height=5)
l.grid(column=0, row=0, sticky=(N,W,E,S))
s = ttk.Scrollbar(root, orient=VERTICAL, command=l.yview)
s.grid(column=1, row=0, sticky=(N,S))
l['yscrollcommand'] = s.set
ttk.Sizegrip().grid(column=1, row=1, sticky=(S,E))
root.grid_columnconfigure(0, weight=1)
root.grid_rowconfigure(0, weight=1)
for i in range(1,101):
    l.insert('end', 'Line %d of 100' % i)
root.mainloop()




#==============================================================================
# menu bars
#==============================================================================
from tkinter import *

def callback():
    print("called the callback!")
    
root = Tk()

# create a menu
menu = Menu(root)
root.config(menu=menu)

filemenu = Menu(menu)
menu.add_cascade(label="File", menu=filemenu)
filemenu.add_command(label="New", command=callback)
filemenu.add_command(label="Open...", command=callback)
filemenu.add_separator()
filemenu.add_command(label="Exit", command=callback)

helpmenu = Menu(menu)
menu.add_cascade(label="Help", menu=helpmenu)
helpmenu.add_command(label="About...", command=callback)


mainloop()
   
   
#==============================================================================
# toolbars
#==============================================================================
from tkinter import *

root = Tk()

def callback():
    print("called the callback!")

# create a toolbar
toolbar = Frame(root)

b = Button(toolbar, text="new", width=6, command=callback)
b.pack(side=LEFT, padx=2, pady=2)

b = Button(toolbar, text="open", width=6, command=callback)
b.pack(side=LEFT, padx=2, pady=2)

toolbar.pack(side=TOP, fill=X)

mainloop()




#==============================================================================
# open filename
#==============================================================================
from tkinter import filedialog
filename = filedialog.askopenfilename()
filename = filedialog.asksaveasfilename()
dirname = filedialog.askdirectory()




#==============================================================================
# alerts
#==============================================================================


from tkinter import messagebox
messagebox.showinfo(message='Have a good day')


#==============================================================================
# notebook or tabbed browsing
#==============================================================================
from tkinter import *
from tkinter import ttk

root = Tk()
n = ttk.Notebook(root)
f1 = ttk.Frame(n)   # first page, which would get widgets gridded into it
f2 = ttk.Frame(n)   # second page
n.add(f1, text='One')
n.add(f2, text='Two')

root.mainloop()



#==============================================================================
# events and bindings - mouse clicks
#==============================================================================
from tkinter import *

root = Tk()

def callback(event):
    print("clicked at {},{}".format(event.x, event.y))

frame = Frame(root, width=100, height=100)
frame.bind("<Button-1>", callback)
frame.pack()

root.mainloop()




#==============================================================================
# events and bindings - keyboard clicks
#==============================================================================
from tkinter import *
root = Tk()

def key(event):
    print("pressed", repr(event.char))

def callback(event):
    frame.focus_set()
    print( "clicked at", event.x, event.y)

frame = Frame(root, width=100, height=100)
frame.bind("<Key>", key)
frame.bind("<Button-1>", callback)
frame.pack()

root.mainloop()




#==============================================================================
# multiple windows
#==============================================================================
from tkinter import *

root = Tk()

# create root window contents...

top = Toplevel()

# create top window contents...

root.mainloop()



#==============================================================================
# another hello world
#==============================================================================
import tkinter as tk

class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        self.hi_there = tk.Button(self)
        self.hi_there["text"] = "Hello World\n(click me)"
        self.hi_there["command"] = self.say_hi
        self.hi_there.pack(side="top")

        self.quit = tk.Button(self, text="QUIT", fg="red",
                              command=root.destroy)
        self.quit.pack(side="bottom")

    def say_hi(self):
        print("hi there, everyone!")

root = tk.Tk()
app = Application(master=root)
app.mainloop()




#==============================================================================
# another example
#==============================================================================
import tkinter as tk

class App(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.pack()

# create the application
myapp = App()

#
# here are method calls to the window manager class
#
myapp.master.title("My Do-Nothing Application")
myapp.master.maxsize(1000, 400)

# start the program
myapp.mainloop()


#==============================================================================
# grid
#==============================================================================
from tkinter import *

root = Tk()

height = 5
width = 5
for i in range(height): #Rows
    for j in range(width): #Columns
        b = Entry(root, text="")
        b.grid(row=i, column=j)

mainloop()


#==============================================================================
# label grid
#==============================================================================
import tkinter as tk

class ExampleApp(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        t = SimpleTable(self, 10,2)
        t.pack(side="top", fill="x")
        t.set(0,0,"Hello, world")

class SimpleTable(tk.Frame):
    def __init__(self, parent, rows=10, columns=2):
        # use black background so it "peeks through" to 
        # form grid lines
        tk.Frame.__init__(self, parent, background="black")
        self._widgets = []
        for row in range(rows):
            current_row = []
            for column in range(columns):
                label = tk.Label(self, text="%s/%s" % (row, column), 
                                 borderwidth=0, width=10)
                label.grid(row=row, column=column, sticky="nsew", padx=1, pady=1)
                current_row.append(label)
            self._widgets.append(current_row)

        for column in range(columns):
            self.grid_columnconfigure(column, weight=1)


    def set(self, row, column, value):
        widget = self._widgets[row][column]
        widget.configure(text=value)

if __name__ == "__main__":
    app = ExampleApp()
    app.mainloop()
    


#==============================================================================
# tree view
#==============================================================================
try:
    from Tkinter import *
    from ttk import *
except ImportError:  # Python 3
    from tkinter import *
    from tkinter.ttk import *


class App(Frame):

    def __init__(self, parent):
        Frame.__init__(self, parent)
        self.CreateUI()
        self.LoadTable()
        self.grid(sticky = (N,S,W,E))
        parent.grid_rowconfigure(0, weight = 1)
        parent.grid_columnconfigure(0, weight = 1)

    def CreateUI(self):
        tv = Treeview(self)
        tv['columns'] = ('starttime', 'endtime', 'status')
        tv.heading("#0", text='Sources', anchor='w')
        tv.column("#0", anchor="w")
        tv.heading('starttime', text='Start Time')
        tv.column('starttime', anchor='center', width=100)
        tv.heading('endtime', text='End Time')
        tv.column('endtime', anchor='center', width=100)
        tv.heading('status', text='Status')
        tv.column('status', anchor='center', width=100)
        tv.grid(sticky = (N,S,W,E))
        self.treeview = tv
        self.grid_rowconfigure(0, weight = 1)
        self.grid_columnconfigure(0, weight = 1)

    def LoadTable(self):
        self.treeview.insert('', 'end', text="First", values=('10:00',
                             '10:10', 'Ok'))

def main():
    root = Tk()
    App(root)
    root.mainloop()

if __name__ == '__main__':
    main()
