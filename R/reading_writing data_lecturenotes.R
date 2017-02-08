#slide 
# go over the help page for read.table

#dput-ting objects
y=data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")
new.y=dget("y.R")
new.y

#File connections
##data=read.csv("File")

