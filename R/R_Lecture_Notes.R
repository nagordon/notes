####  Data Types Lecture ####

mydir = getwd()

#Everything in R is an Object
#A vetor can only contain objects of the same class, except for a list
vector()  # creates an empty vector
5L # returns the integer 5
Inf  # infinity
#R obejcts have attributes
#-names, dimnames
#-dimmensions
#-class
#-length
#- user defined attributes , metadata
x<-1   # assingmment
print(x)
c(TRUE,FALSE) == c(T,F)
x<-vector('numeric',length=10)
#coercion occurs when mixed characters are in a vector. Example
y<-c("a",TRUE)  # TRUE is a string here because it is forced 
x<-0:6
class(x)  # returns integer
as.numeric(x)   # returns numeric
as.logical(x)  # returns logical where >0 is TRUE
as.character(x)  # returns characters
#Matrix is a vector with dimension attribute
m<-matrix(nrow=2,,ncol=3)
dim(m) # returns 2 3
attributes(m) # returns $dim
#Matrices is constructed column-wise, starting at the upperleft and going down
#Can also create a matrix by assinging dim attribute to a vector
m<-1:10
dim(m)<-c(2,5)
#Can also create a matrix by binding
x<-1:3;x
y<-10:12;y
cbind(x,y) # column by column
rbind(x,y) # row by row
#Lists are a vector that can contain different classes
x<-list(1,"a",TRUE,1+4i)
#Factor is used to represent categorical data, can be ordered or unordered
x<-factor(c("yes","yes","no","yes","no"))
x   # shows all the levels and values
table(x)  # returns count of ech factor
unclass(x)  # 
x<-factor(c("yes","yes","no","yes","no"),levels=c("yes","no"))
x  # makes yes the baseline level, dafult is alphbetical
# missing values NA and not a number NAN 
x<-c(1,NaN,NA)
is.na(x)
is.nan(x)
# NAN value is also a NA, but a NA is not necissarily NaN
# Data frames used to store tabular data, is a special type of list
# Unlike matrices, each columns does not have to be the same type
# every element in the list must be the same length
# data.matrix() converts to data frame to matrix
# create by read.table() or read.csv()
x<-data.frame(foo=1:4,bar=c(T,T,F,F))
x
nrow(x);ncol(x)
# R object can have names
x<-1:3
names(x)
names(x) <-c("foo","bar","norf")
x
names(x)
# list can also have names
x<-list(a=1,b=2,c=3);x
# matrics can have dim names
m<-matrix(1:4,nrow=2,ncol=2);m
dimnames(m)<-list(c("a","b"),c("c","d"));m
######################################

############ Subsetting ##############
# x[] (returns same class as x)
# x[[]] (used to extract single element of a lists or a data frame but may not be the same class
# $ ( used to extract elements of a list or a data frame by name), may not be the same class as the roginal
x<-c("a","b","c","d","a")
x[1]
x[1:4]
x[x>"a"]
u<-x>"a";u
x[u]
# matrices
x<-matrix(1:6,2,3);x
x[1,2]   # returns a 1x1 vector, not a matrix
x[1,]  # returns row 1 and all columns
x[1,2,drop=FALSE]  # drops the dimension, returns a 1x1 matrix with 3
# subsetting lists
x<-list(foo=1:4, bar=0.6);x
x[1] #  returns the elemment $foo as list with the sequence
x[[1]]  # returns just the sequence 1 to 4
x$bar == x[["bar"]] 
x["bar"]   # returns a list, dont need to know where it is in the list by using thr name
# etract multiple lements of a list
x<-list(foo = 1:4, bar=0.6, baz = "hello");x
x[c(1,2,3)] # return 1st and 3rd element of the list 
# $ can only extract one element
# x[[c(1,2,3)]] returns an error because only one element can be called with [[]]
# the [[ operator can be used with computed indices , $ can only be used with literal names
name<-"foo"
x[[name]]  # returns all elements with incides "foo"
x[name]  # returns the element $foo, and its contents
x["foo"]  # same as previous
# element 'name' does not exist, 
x$name # will return an NULL becaues 'foo' must be explicitly called
x$foo  # element 'foo' does exist
# [[ can take an integer sequence, recursuve list seraching
x<- list(a=list(10,12,14),b= c(3.14, 2.81));x
x[[c(1,3)]]  # returns the 3rd element of the 1st list
x[[1]][[3]] # retutrns the same thing
x[c(1,3)]  # not the same
x[[c(2,2)]] # returns the 2nd element or the 2nd list
x[[2]][[2]]  #same thing
# partial matching is not allowed with [[ and $
x<-list(aardvark=1:5);x
x$a  # do not need to finish term
x$aa
x$aar
x$aardvark==x[["aardvark"]]
x[["a"]] # no partial matching
x[["a", exact = FALSE]]  # can do partial matching by specifying not exact
# remove missing values
x<-c(1,2,NA,4,NA,5);x
bad<-is.na(x)
x[!bad]
# complete cases function skips all NA
y<-c("a","b",NA,"d",NA,"f");y
good <- complete.cases(x,y);good  # for both x,y which are not NA
x[good]
y[good]

#############  Vectorized operations  ##############
x<-1:4; y<- 6:9;x;y
x/y
x*y
x>2
x<-matrix(1:4,2,2);x
y<-matrix(rep(10,4),2,2);y
x/y  # element by element
x %*% y  # matrix multiplication
x<-1:10
x[x %in% 1:5]

############## Reading and writing Data ##############
# read.table
# read.csv
# readLines
# source
# dget
# load
# unserialize

# data <- read.table("foo.txt")  # skips lines that start with '#'
# set comment.char = "" if there are no commented lines in your file
# colClasses will improve speed alot
#############################################
###way to check what type of class
# initial <- read.table("datatable.txt",nrows=100)
# classes <- sapply(initial,class)
# tabALL <- read.table("datatable.txt"),
#                    colClasses = classes)
###########################################
# nrows will preallocate memory for loading

# 1.5 million rows by 120 columns read into the computer
elements <- 1.5e6 * 120
totalbytes<- 8*elements # 8 bytes per numeric
totalMb <- totalbytes / 2^20
totalGb <- totalMb/1e3
# dumping and dputing keeps metadata preserving tableformat
# deparsing an r object 
y <- data.frame(a = 1,b = "a");y
dput(y)
dput(y,file = "y.R")
new.y <-dget("y.R");new.y
# dget can only be used on a single r object, ddump can be used for multiple
x<-"foo"
y<-data.frame(a=1,b="a")
dump(c("x","y"),file = "data.R")
rm(x,y)
source("data.R");y;x
# file() opens a connection to a file
# gzfile() opens a connection to a file compressed with gzip
# bzfile() bzip2 compression algorithm
# url() opens a connection to a webpage
# unzip("specdata.zip")

###### gives more control over read/write by making a connection object
# con <- file("foo.txt","r")
# data <- read.csv(con)
# readLines(con,10) # read specific lines of data
# close(con)


############ set wirking directory ############

setwd(mydir)
list.files()
myfunction <- function () {
  x<-rnorm(100)
  mean(x)
}
myfunction()


########### str function ###############
# shows whats in an R object
str(str)
str(lm)
?lm
x <- rnorm(100,2,4)
summary(x)
str(x)
f<-gl(40,10)
str(f)
summary(f)
# library()  # other ways to get info
head(f)
m<-matrix(rnorm(100),10,10);m
str(m)
m[,1]

##### quiz 1 #####
x <- list(2, "a", "b", TRUE)
str(x)
str(x[[2]])   # returns a string "a"
str(x[2])  # returns a list with char "a"

### remove
rm(list=ls())

######## COntrol Structures #########
x<-TRUE

# first layout
if(x) {
  print('first if')
}else{
  print("else")
};

#another form
y<- if(x) {
  10
} else{
  0
};y

# for-loop forms
for(i in 1:10) {
  print(i)
}

x<-c("a","b","c","d")
for(i in 1:4) {
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])

# while loop
count<-0
while(count<10) { 
        print(count)
        count<- count+1
}

# repeat loop
repeat{
  # only way to exit a repeat loops is with break
  break
}

# next skips to the next loop
# return exits the loop

######### functions ################
# functions are first class objects
# funtions can be passed as arguments to other functions
# functions can be nested, so that you can define a function within
#     another function
# the return value in a function is the very last value in the function

#by naming the inputs, we can reoder them, dont recommend
# if a variable is named, it is removd from the order and # 
#   whatver is left is in that order
mydata <- rnorm(100)
sd(mydata)  # standard deviation
sd(x=mydata) # same as previous
sd(x=mydata, na.rm = FALSE) # 
sd(na.rm = FALSE, x=mydata) # removes missing values first
sd(na.rm=FALSE, mydata) #

#  formal argument in a function is one that is in the input of the function

f<-function(a,b=1,c=2,d=NULL){
  # b,c,d have default values
}

# functions on evaluate variables as needed, Laz evaluation

# '...' elipsis will pass on all the arguments to the function within the function
myplot <- function(x,y,type = "l",...) {
        plot(x,y,type = type,...)
        # we can easily alter exiting functions with ...
        # any arguments after ... must be explicitly defined and cannot be partial mathcing
}

# concatenation
paste("a","b",sep = ":")  # complete arguments
paste("a","b",se = ":")   # se is not complete, and will not be completed

###### Scoping ########
# scoping rules determine how a value is asscoaited with a free variable in a function
# R uses static scoping, (as opposed to dynamic scopng)
# if I define a function that currently has a name, dos it choose mine or
# the preexiting  function
# use search() to see if it will use mine

# clear all varibles
rm(list=ls())

search()
# typically GlobalEnv is where user define functions are stored, thus will be chosen first

# example
library(lattice)
search()

# for static/lexical scoping, the free variables is searched for in the environments in which the function is defined
# all environments have a parent except the empty enviroonment
# x,y are formal arguments, z is a free variable
f<-function(x,y) {
  x^2+y/z
}
# f(1,2) # this will fail because z is undefined
z<-3
f(1,2) # this works
# how to find what environment you are in
search()
env1<-environment(f);env1
parent.env(env1)
# functions are usualy defined in the global environment so that all varaibles are accessable
# a function can return a function (embedded function). The environment
#   is then not global, but within the other function
rm(list=ls())
make.power <- function(n) {
  pow <- function(x) {
    x^n  # n is a free variable but exists in the enviroment where the function lives
  }
}
cube <- make.power(3)  # returns another function
cube # retuns a hexidecimal number that is a pointer to the memory location
square <- make.power(2);square
cube(3) # returns the cube of the input
square(2)

ls(environment(make.power)) # shows all objects that exist in the same environment as make.power
ls(environment(cube)) # returns object n and pow
get("n", environment(cube)) # returns the value n in the cube environment

# Dynamic scoping
rm(list=ls())
y<-10

f<-function(x) {
  y<-2 # is 2 inside this function
  y^2 + g(x)
} # y is a free variable

y # is still 10

g<-function(x) {
  y # is still 10
  x*y
} # y free variable 

f(3) # y is a free varaible, g is a free variable

# in g(), y is a free variable
# in g(), dynamic scoping y == 2, y is looked up from the envrionemnt which is is called (parent frame)
# in g(), lexical scoping y == 10, y is looked up in the envrioment which it is defined 

# dynamic scoping can appear to be the case when the function is defined
#   in a global environment and is subsequently called from the global environment
#   then the defineing environment and calling environment are the same

# Python also uses lexical scoping


############### Optimization ############### 
rm(list=ls())
# minimzes by default
make.NegLogLik <- function(data,fixed=c(FALSE,FALSE)) {
  # data is a vector of data to fit
  # fixed are the parameters to fit to
  params <- fixed
  function(p) {
    # parameters to optimize over
    params[!fixed] <- p
    mu <- params[1] # mean
    sigma <- params[2] # stdev
    a<- -0.5*length(data)*log(2*pi*sigma^2)
    b<- -0.5*sum((data-mu)^2)/(sigma^2)
    -(a+b)
  }
}

set.seed(1)
normals<-rnorm(100,1,2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))

# optim when >1 variables
optim(c(mu=0,sigma=1),nLL)$par

#fixing sigma = 2
nLL <- make.NegLogLik(normals, c(FALSE,2))
optimize(nLL,c(-1,3))$minimum

# fixing mu = 1, use optimize with only 1 variable
nLL <- make.NegLogLik(normals,c(1,FALSE))
optimize(nLL,c(1e-6,10))$minimum

# plot 1
nLL <- make.NegLogLik(normals,c(1,FALSE))
x<-seq(1,3,len=100)
y<-sapply(x,nLL)
plot(x,exp(-(y-min(y))),type = "l")

# plot 2
nLL <- make.NegLogLik(normals, c(FALSE,2))
x<-seq(1,2,len=100)
y<-sapply(x,nLL)
plot(x,exp(-(y-min(y))),type = "l")

############## lapply ############
# not necessarily faster than for loop, just less typing
# lapply - loop over a list and evaluate a function on each element
# sapply - same as lapply but simplified result
# apply apply a function over the margins of an array
# tapply - apply a function over a subset of vectors
# mapply - multivariate verson of lapply
# split - useful with these functions
# makes heavy use of anonymous function

lapply # shows function

x <- list(a=1:5,b = rnorm(10));x # x does not have to be a list
result<-lapply(x,mean) # returns as list, applies mean function
result$a # mean of list a
result$b # mean of list b

lapply(1:4,rnorm) # returns a list 4 long

lapply(1:4,runif, min=0,max = 10) # change default values of runif

x<- list(a=matrix(1:4,2,2),b=matrix(1:6,3,2));x

# we want to extract the first column of each of the lists

# method with for loop
for (k in 1:length(x)) {
  print(x[[k]][,1])
}
# anonymous function for extracting the first column of each matrix
lapply(x,function(elt) elt[,1])

# sapply
x<- list(a=1:4, b = rnorm(10),c = rnorm(20,1),d=rnorm(100,5))
lapply(x,mean) # returns a list
sapply(x,mean) # returns a vector, which iis simplier to work with

x <- list(rnorm(100), runif(100), rpois(100, 1))
result<-sapply(x, quantile, probs = c(0.25, 0.75)) # returns a 2x3 matrix
dim(result)

##### apply #######
# apply is not necessarily faster than a for loop, it is just less typing
# apply is used to evalute over the margins of a array or matrix
str(apply)
x<-matrix(rnorm(200),20,10);x # 20 rows and 10 col
#calcluate the mean of each column
apply(x,2,mean) # keep all columns collapse rows
apply(x,1,mean) # keep all rows but collapse columns

# built in functions are much faster, but the same
rowSums(x) == apply(x,1,sum)
rowMeans(x) == apply(x,1,mean)
colSums(x) == apply(x,2,sum)
colMeans(x) == apply(x,2,mean)

a<-array(rnorm(2*2*10),c(2,2,10));a
apply(a,c(1,2),mean) # collapse 3rd dimension
# same as previous
rowMeans(a,dims=2)
dim(a)

# side note, these are not the same
mat <- matrix(rnorm(2*2*10),c(2,2,10)) # matrix can only be 2 dimensions
arr <- array(rnorm(2*2*10),c(2,2,10))
dim(mat);dim(arr)

# tapply is used to apply a function overs a subsets of a vector
rm(list = ls())
str(tapply)
# x is a number [1:30]
x<-c(rnorm(10),runif(10),rnorm(10,1));x
str(x)
x[1:30]
# generate factor levels is gl(),#
# 10 1's , 10 2's, 10 3's
f<-gl(3,10)
tapply(x,f,mean) # returns the mean for each level
# we get a list if w edont simplify
tapply(x,f,mean,simplify = FALSE)
# fnd group ranges
tapply(x,f,range,)

# split takes a vector or other objects and splits
#    into groups determined by a factor or list
#   always returns a list
str(split)

x<-c(rnorm(10),runif(10),rnorm(10,1));x
f<-gl(3,10)
lapply(split(x,f),mean)
# is the same as the previous
tapply(x,f,mean,simplify=FALSE)

# split can be used with complex objects
library(datasets)
head(airquality)
s<- split(airquality, airquality$Month);s
# take the means of each column per month
monthdat <- lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
monthdat['9']   # shows means for month 9
# can find specific values for month 9
monthdat$'9'[2]
# same as before
monthdat[['9']][2]

#can also call sapply to simplify and put into vector
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
# to get rid of na
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],
                              na.rm = TRUE))

# splitting on more than one level
x<-rnorm(10)
f1 <-gl(2,5)
f2<-gl(5,2)
f1
f2
interaction(f1,f2) # results in 10 levels with one each
str(split(x,list(f1,f2)))
# drops emply levels
str(split(x,list(f1,f2),drop=TRUE)) 

# split test

dat<-matrix(rnorm(4000),100,4)
x<-data.frame(dat);x
str(x)
f<-gl(4,25)
length(f)
str(f)
spltx<-split(x,f) # returns a list of 4 data frames
str(spltx)
spltx$'1'$X1 == spltx[[1]]$X1
# returns the first value of the first list of the first data frame
spltx[[1]][[1]][1] == spltx$'1'$X1[1]

##### Mapply #######
# all the previous apply functions were only over a single object
# we can go over two lists with mapply, or use a for loop
# multivariate apply of sorts
str(mapply)

#to create a list of 4 vectors, there are two ways
var<- list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
# same as previous
mapply(rep,1:4,4:1)

# allows to vectorize functions that do not accept vectors
noise<-function(n,mean,sd) {
  rnorm(n,mean,sd)
}
noise(5,1,2)
mapply(noise,1:5,1:5,2)

############## debugging ################
invisible()  # prevents autorprintint
load() # loads object from a saved workspace
x<- print("x is stored")
x
# traceback # prints the function call stack after an error has occured
# debug
# browser
# trace 
# recover

?browser
rm(list=ls())
mean(x) # returns error
traceback() # where the last error occurs, must be called
#   immediatly after the error occurs
lm(y~x)
traceback() # error is 7 levels deep

# debug function
debug(lm) # prints out the function
lm(y~x)
# now we are in the browser
# type 'n' for next, 'c' for continue
# can debug funtions inthe debugger
options(error=recover)
read.csv("nofile")
?options
options(error=stop)
